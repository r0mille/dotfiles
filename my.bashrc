# For My Prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PYENV
# Load pyenv automatically by adding
# the following to ~/.bashrc:

export PATH="/Users/r0mille/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias dh="cd ~/dev/"
alias sbp="source ~/.bash_profile"
alias bgrep='git branch -a | grep '

# VIM SHITS
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette_osx.sh"
alias vi='/usr/local/bin/nvim'
alias vim='/usr/local/bin/nvim'

# Current Project Home
alias gh="cd ~/dev/siriusblack"
