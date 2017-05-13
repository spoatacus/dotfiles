# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd histignorespace nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/spoat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

fpath=( "$HOME/.zfunctions" $fpath)

# configure prompt
autoload -Uz promptinit
promptinit
prompt pure

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# shell aliases
source ~/.dotfiles/shell/common/aliases/aliases

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/spoat/.sdkman"
[[ -s "/home/spoat/.sdkman/bin/sdkman-init.sh" ]] && source "/home/spoat/.sdkman/bin/sdkman-init.sh"

