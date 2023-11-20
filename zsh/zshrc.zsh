# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:/mnt/c/Users/lucas/AppData/Local/Microsoft/WindowsApps"
export PATH="$PATH:/mnt/c/Users/lucas/AppData/Local/Programs/Microsoft VS Code/bin"
export PATH="$PATH:/mnt/c/Program Files/Docker/Docker/resources/bin"
export PATH="$PATH:/mnt/c/ProgramData/DockerDesktop/version-bin"
export PATH="$PATH:/mnt/c/WINDOWS"

# Theme
ZSH_THEME="robbyrussell"

# auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Plugins
plugins=(fast-syntax-highlighting git docker golang archlinux)

source $ZSH/oh-my-zsh.sh

# Rust zsh-alternativs install with yay
# yay -S exa fd procs sd dust ripgrep tokei hyperfine bottom tealdeer bandwhich grex

# Custom Aliases
alias zshrc="code .zshrc"
alias p10kz="code .p10k.zsh"
# Improved ls command with icons using 'exa'
alias ls="exa --icons"
# Clear screen command
alias cls="clear"
# Improved 'find' command using 'fd'
alias find="fd"
# Display running processes with 'procs'
alias pd="procs"
# Improved 'sed' command using 'sd'
alias sed="sd"
# Improved 'du' command using 'dust'
alias du="dust"
# Add SSH key to agent
alias ssha="ssh-add ~/.ssh/id_ed25519"
# Shortcut for GitHub Copilot command
alias ghc="gh copilot"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
 
# starship
#eval "$(starship init zsh)"

# ssh agent
eval "$(ssh-agent -s)"

. /opt/asdf-vm/asdf.sh

# bash_completion
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh