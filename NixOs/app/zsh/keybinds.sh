# Key-bindings
bindkey '^[[P' delete-char
bindkey '^H' backward-kill-word
bindkey -M menuselect '^[[Z' reverse-menu-complete # shift-tab to go to previous choice
bindkey '^f' autosuggest-execute

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey -M viins 'jk' vi-cmd-mode
