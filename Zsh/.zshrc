[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
source $ZDOTDIR/.zsh/zshrc

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/Vedant/.ghcup/env" ] && source "/home/Vedant/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -e "/home/Vedant/.zsh/usr_scripts/fzf-extras" ]] \
    && source /home/Vedant/.zsh/usr_scripts/fzf-extras
