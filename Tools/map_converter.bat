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
Write-Host "| - Simple Map Converter Tool          |"
Write-Host "| - Load Q3map2 with custom params     |"
Write-Host "|______________________________________|`n"

# Path to the temp file
$tempFilePath = "$env:TEMP\DskMods-lastSelectedFolder.txt"

# Ensure the required assembly is loaded
Add-Type -AssemblyName System.Windows.Forms

# Create a new FolderBrowserDialog object
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog

# Set the description text
$folderBrowser.Description = "Select the GameData folder"

# If the temp file exists, read the previous folder
if (Test-Path -Path $tempFilePath) {
    $previousFolder = Get-Content -Path $tempFilePath -Raw
	$previousFolder = $previousFolder.Trim()
    if (Test-Path -Path $previousFolder) {
        $folderBrowser.SelectedPath = $previousFolder
    }
}

# Show the dialog to select a folder
$result = $folderBrowser.ShowDialog()

# Check if the user clicked 'OK'
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    # Output the selected folder path
    $selectedFolder = $folderBrowser.SelectedPath
    Write-Host "Your Folder: $selectedFolder"
	
	# Save the selected folder to the temp file
    Set-Content -Path $tempFilePath -Value $selectedFolder
    
    # Create a new OpenFileDialog object
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    
    # Set the initial directory to the previously selected folder
    $fileDialog.InitialDirectory = "$selectedFolder/base"
    
    # Set the filter to only show filtered files
    $fileDialog.Filter = "BSP files (*.BSP)|*.BSP|MAP files (*.MAP)|*.MAP|ENT files (*.ENT)|*.ENT|All files (*.*)|*.*"
    
    # Set the dialog title
    $fileDialog.Title = "Select a file"
    
    # Show the dialog to select a file
    $fileResult = $fileDialog.ShowDialog()
    
    # Check if the user clicked 'OK'
    if ($fileResult -eq [System.Windows.Forms.DialogResult]::OK) {
        # Output the selected file path
        $selectedFile = $fileDialog.FileName
        Write-Host "Your File: $selectedFile"
		$inputArgs = Read-Host "Custom Arguments (Press ENTER to skip)"
		$customArgs = "-game ja"
		
		if ($inputArgs) {
			$customArgs += " "+$inputArgs
		}
		
		# Confirm
		Write-Host -NoNewLine "Attempting to run: "
		Write-Host "q3map2.exe $customArgs -fs_basepath `"Your Folder`" -fs_game `"base`" -convert -format map_bp `"Your File`"" -fo Yellow;
		Write-Host -NoNewLine "Do you want continue?"; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
		Clear-Host
		
		#Finish
		$exeFile = "q3map2.exe"
		$exeArgs = @(
			$customArgs,
			"-fs_basepath `"$selectedFolder`"",
			"-fs_game base",
			"-convert -format map_bp `"$selectedFile`""
		)
		
		Start-Process -FilePath $exeFile -ArgumentList $exeArgs -NoNewWindow -Wait
    } else {
        Write-Host "File selection was cancelled."
    }
} else {
    Write-Host "Folder selection was cancelled."
}

# End
Write-Host -NoNewLine "Press any key to continue..." -fo Yellow; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');