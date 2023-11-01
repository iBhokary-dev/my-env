function Show-TerminalIcons {
    Import-Module Terminal-Icons
    Show-TerminalIcons @args
}

function Initialize-Profile {
    $ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
    Invoke-Expression (&starship init powershell)
}

if ($host.Name -eq "ConsoleHost") {
    Initialize-Profile
}
