# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# PYENV
# Load pyenv automatically by adding
# the following to ~/.bashrc:

export PATH="/Users/r0mille/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

alias dh="cd ~/dev/"
alias sbp="source ~/.bash_profile"
alias bgrep='git branch -a | grep '

# VIM SHITS
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette_osx.sh"
alias vi='/usr/local/bin/nvim'
alias vim='/usr/local/bin/nvim'

# Current Project Home
alias gh="cd ~/dev/nftplay/hotdog-nft"
alias gd="cd ~/dev/web3/dappns-zee-bridge"
alias gb="cd ~/dev/bubblegoods/bubble"

alias syncdotvi='cp ~/.vimrc ~/dev/dotfiles/my.vimrc'
