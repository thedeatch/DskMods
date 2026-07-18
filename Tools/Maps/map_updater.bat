<# :
:: PowerShell init
@echo off
powershell /nologo /noprofile /command ^ "&{[ScriptBlock]::Create((cat """%~f0""") -join [Char[]]10).Invoke(@(&{$args}%*))}"
exit /b
#>

# Code init
Write-Host "________________________________________"
Write-Host "|        ___ _____      _   ___        |"
Write-Host "|       |  _|  __ \    | | |_  |       |"
Write-Host "|  __  _| | | |  | |___| | __| |_  __  |"
Write-Host "|  \ \/ / | | |  | / __| |/ /| \ \/ /  |"
Write-Host "|   >  <| | | |__| \__ \   < | |>  <   |"
Write-Host "|  /_/\_\ |_|_____/|___/_|\_\| /_/\_\  |"
Write-Host "|       |___|              |___|       |"
Write-Host "|                                      |"
Write-Host "| - Map Updater Tool                   |"
Write-Host "| - Synchronize files to Git tools     |"
Write-Host "|______________________________________|`n"

$tempFilePath = "$env:TEMP\DskMods-mapUpdaterLast.txt"
$tempFilePath2 = "$env:TEMP\DskMods-mapUpdaterTarget.txt"

Add-Type -AssemblyName System.Windows.Forms

#----------------------------------------------------------
# Seleccionar modo
#----------------------------------------------------------

Write-Host "Select operation:"
Write-Host ""
Write-Host "1) Upload updates to Cloud (Git)"
Write-Host "2) Download updates from Cloud (Git)"
Write-Host ""

do
{
    $syncMode = Read-Host "Option"

} until ($syncMode -eq "1" -or $syncMode -eq "2")

#----------------------------------------------------------
# Seleccionar GameData
#----------------------------------------------------------

$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog

if (Test-Path $tempFilePath)
{
    $previousFolder = (Get-Content $tempFilePath -Raw).Trim()

    if (Test-Path $previousFolder)
    {
        $folderBrowser.SelectedPath = $previousFolder
        $folderBrowser.Description = "Select the GameData folder (Last: $previousFolder)"
    }
    else
    {
        $folderBrowser.Description = "Select the GameData folder"
    }
}
else
{
    $folderBrowser.Description = "Select the GameData folder"
}

if ($folderBrowser.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK)
{
    Write-Host "Folder selection cancelled."
    Write-Host -NoNewLine "Press any key to continue..." -fo Yellow; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

$gameData = $folderBrowser.SelectedPath
Set-Content $tempFilePath $gameData

#----------------------------------------------------------
# Calcular carpeta Maps del proyecto
#----------------------------------------------------------

$scriptFolder = Get-Location

# Tools/Maps/map_updater.bat
# subir dos niveles -> raiz
$projectRoot = Resolve-Path (Join-Path $scriptFolder "..\..")

$mapsRoot = Join-Path $projectRoot "Maps"

if (!(Test-Path $mapsRoot))
{
    Write-Host ""
    Write-Host "ERROR:"
    Write-Host "Could not find:"
    Write-Host $mapsRoot
    Write-Host -NoNewLine "Press any key to continue..." -fo Yellow; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

#----------------------------------------------------------
# Seleccionar carpeta del mapa
#----------------------------------------------------------

$folderBrowser2 = New-Object System.Windows.Forms.FolderBrowserDialog

if (Test-Path $tempFilePath2)
{
    $previousTarget = (Get-Content $tempFilePath2 -Raw).Trim()

    if (Test-Path $previousTarget)
    {
        $folderBrowser2.SelectedPath = $previousTarget
		$lastMap = Split-Path $previousTarget -Leaf
		$folderBrowser2.Description = "Select the Target Map folder (Last: $lastMap)"
        # $folderBrowser2.Description = "Select the Target Map folder (Last: $previousTarget)"
    }
    else
    {
        $folderBrowser2.SelectedPath = $mapsRoot
        $folderBrowser2.Description = "Select the Target Map folder (Click on Maps to open the list)"
    }
}
else
{
    $folderBrowser2.SelectedPath = $mapsRoot
    $folderBrowser2.Description = "Select the Target Map folder (Click on Maps to open the list)"
}

if ($folderBrowser2.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK)
{
    Write-Host "Map selection cancelled."
    Write-Host -NoNewLine "Press any key to continue..." -fo Yellow; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

$projectMap = $folderBrowser2.SelectedPath
Set-Content $tempFilePath2 $projectMap
$mapName = Split-Path $projectMap -Leaf

#----------------------------------------------------------
# Carpeta origen
#----------------------------------------------------------

$source = Join-Path $gameData "base"

#----------------------------------------------------------
# Determinar dirección de sincronización
#----------------------------------------------------------

if ($syncMode -eq "1")
{
    # Local -> Cloud
    $syncSource = $source
    $syncDestination = $projectMap

    $operationText = "Upload updates to Cloud"
}
else
{
    # Cloud -> Local
    $syncSource = $projectMap
    $syncDestination = $source

    $operationText = "Download updates from Cloud"
}

if (!(Test-Path $source))
{
    Write-Host ""
    Write-Host "ERROR:"
    Write-Host "Source folder does not exist:"
    Write-Host $source
    Write-Host -NoNewLine "Press any key to continue..." -fo Yellow; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
    exit
}

#----------------------------------------------------------
# Confirmación
#----------------------------------------------------------

Write-Host $operationText
Write-Host ""

Write-Host "Source folder:"
Write-Host $syncSource
Write-Host ""

Write-Host "Destination folder:"
Write-Host $syncDestination
Write-Host ""

Write-Host "This will make destination folder identical to source."
Write-Host -NoNewLine "Press any key to continue..." -fo Red; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

#----------------------------------------------------------
# Sincronizar
#----------------------------------------------------------

# Eliminar del destino cualquier carpeta que ya no exista en el origen
Get-ChildItem $syncDestination -Directory | ForEach-Object {

    if (!(Test-Path (Join-Path $syncSource $_.Name)))
    {
        Remove-Item $_.FullName -Recurse -Force
    }
}

# Sincronizar cada carpeta existente en el origen
Get-ChildItem $syncSource -Directory | ForEach-Object {

    robocopy `
        $_.FullName `
        (Join-Path $syncDestination $_.Name) `
        /MIR `
        /R:1 `
        /W:1 `
        /NFL `
        /NDL `
        /NJH `
        /NJS `
        /NP | Out-Null
}

# Sincronizar únicamente los TXT de la raíz
robocopy `
    "$syncSource" `
    "$syncDestination" `
    *.txt `
    /LEV:1 `
    /R:1 `
    /W:1 `
    /NFL `
    /NDL `
    /NJH `
    /NJS `
    /NP | Out-Null

# Eliminar TXT del destino que ya no existan en el origen
Get-ChildItem $syncDestination -File -Filter *.txt | ForEach-Object {

    if (!(Test-Path (Join-Path $syncSource $_.Name)))
    {
        Remove-Item $_.FullName -Force
    }
}

Clear-Host
Write-Host "Files updated successfully!"
Write-Host ""
Write-Host "Please review Git (SourceTree) and prepare the changes for Commit."
Write-Host -NoNewLine "Press any key to continue..." -fo Yellow; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');