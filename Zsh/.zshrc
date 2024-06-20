[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
source $ZDOTDIR/.zsh/zshrc

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/Vedant/.ghcup/env" ] && source "/home/Vedant/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -e "/home/Vedant/.zsh/usr_scripts/fzf-extras" ]] \
    && source /home/Vedant/.zsh/usr_scripts/fzf-extras

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vedant/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vedant/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vedant/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vedant/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

