<# :
:: PowerShell init
@echo off
powershell /nologo /noprofile /command ^ "&{[ScriptBlock]::Create((cat """%~f0""") -join [Char[]]10).Invoke(@(&{$args}%*))}"
exit /b
#>

# Code init
Write-Host " _____________________________"
Write-Host "|                             |"
Write-Host "| SIMPLE WAY FOR .BSP TO .MAP |"
Write-Host "|                 BY DSK CLAN |"
Write-Host "|_____________________________|`n"

# Ensure the required assembly is loaded
Add-Type -AssemblyName System.Windows.Forms

# Create a new FolderBrowserDialog object
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog

# Set the description text
$folderBrowser.Description = "Select the GameData folder"

# Show the dialog to select a folder
$result = $folderBrowser.ShowDialog()

# Check if the user clicked 'OK'
if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    # Output the selected folder path
    $selectedFolder = $folderBrowser.SelectedPath
    Write-Host "Your GameData: $selectedFolder"
    
    # Create a new OpenFileDialog object
    $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
    
    # Set the initial directory to the previously selected folder
    $fileDialog.InitialDirectory = "$selectedFolder/base"
    
    # Set the filter to only show .BSP files
    $fileDialog.Filter = "BSP files (*.BSP)|*.BSP"
    
    # Set the dialog title
    $fileDialog.Title = "Select a BSP file"
    
    # Show the dialog to select a file
    $fileResult = $fileDialog.ShowDialog()
    
    # Check if the user clicked 'OK'
    if ($fileResult -eq [System.Windows.Forms.DialogResult]::OK) {
        # Output the selected file path
        $selectedFile = $fileDialog.FileName
        Write-Host "Your BSP: $selectedFile"
		$inputArgs = Read-Host "Enter custom arguments (Press ENTER to skip)"
		$customArgs = "-game ja"
		
		if ($inputArgs) {
			$customArgs += " "+$inputArgs
		}
		
		# Confirm
		Write-Host -NoNewLine "Attempting to run: "
		Write-Host "q3map2.exe $customArgs -fs_basepath `"Your GameData`" -fs_game `"base`" -convert -format map_bp `"Your BSP`"" -fo Yellow;
		Write-Host "Do you want continue?"; $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
		
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