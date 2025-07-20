# zinit
source /usr/share/zinit/zinit.zsh

# plugin
# zinit light zdharma-continuum/fast-syntax-highlighting
# zinit light zsh-users/zsh-autosuggestions
zinit light hlissner/zsh-autopair
# zinit light zsh-users/zsh-completions

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

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
autoload -Uz compinit
compinit
# End of lines added by compinstall

# alias
source ~/.zsh_alias

eval "$(starship init zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/Atom/.dart-cli-completion/zsh-config.zsh ]] && . /home/Atom/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# zoxide
eval "$(zoxide init zsh --cmd z)"
