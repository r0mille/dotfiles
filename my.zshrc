source ~/.bash_profile

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='${PWD/#$HOME/~} (${vcs_info_msg_0_}) $ '

eval "$(oh-my-posh init zsh --config .my.omp.json)"
