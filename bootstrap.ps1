$message  = 'This script assumes your repo is at ~\git\nvim'
$question = 'Proceed?'

$choices = New-Object Collections.ObjectModel.Collection[Management.Automation.Host.ChoiceDescription]
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&Yes'))
$choices.Add((New-Object Management.Automation.Host.ChoiceDescription -ArgumentList '&No'))

$decision = $Host.UI.PromptForChoice($message, $question, $choices, 1)
if ($decision -eq 0) {
  if (!(Test-Path -Path $HOME\AppData\Local\nvim)) {
    cmd /c mklink /D $HOME\AppData\Local\nvim $HOME\git\nvim
  } else {
    Write-Host 'A file, folder, or symbolic link already exists at $HOME\AppData\Local\nvim !' -ForegroundColor red
    Write-Host 'Please check the path, then delete or rename it and run this script again if you want to point your Neovim installation to use this repo.'
  }
  if (!(Test-Path -Path $HOME\.local\share\nvim\plugged)) {
    New-Item -ItemType directory -Path $HOME\.local\share\nvim\plugged
  }
  Write-Host 'Done'
} else {
  Write-Host 'Cancelled'
}