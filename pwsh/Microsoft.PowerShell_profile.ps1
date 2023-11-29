$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_DISTRO = "󰍲"
# Load the Terminal icons module.
Import-Module -Name Terminal-Icons

# Load and configure the PowerShell history.
Import-Module -Name PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows 

# Load the Starship prompt.
Invoke-Expression (&starship init powershell)