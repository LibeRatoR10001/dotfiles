# zinit
source /usr/share/zinit/zinit.zsh

# plugin
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light hlissner/zsh-autopair

# oh-my-zsh plugin
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/Atom/.zshrc'

# autocompletions
zinit light zsh-users/zsh-completions
autoload -Uz compinit
compinit
# End of lines added by compinstall

# environment
source ./.zsh_env

# alias
source ./.zsh_alias

eval "$(starship init zsh)"
