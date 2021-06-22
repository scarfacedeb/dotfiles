#!/usr/bin/env zsh

# ========== VIM mode ============

# Vim-like keybind as default
bindkey -v

bindkey -M vicmd 'gg' beginning-of-line
bindkey -M vicmd 'G'  end-of-line

bindkey -M vicmd '/'   vi-history-search-forward
bindkey -M vicmd '?'   vi-history-search-backward

# Add emacs-like keybind to viins mode
bindkey -M viins '^B'  backward-char
bindkey -M vicmd '^A'  beginning-of-line
bindkey -M vicmd '^E'  end-of-line
bindkey -M vicmd '^K'  kill-line
bindkey -M vicmd '^P'  up-line-or-history
bindkey -M vicmd '^N'  down-line-or-history
bindkey -M vicmd '^Y'  yank
bindkey -M vicmd '^W'  backward-kill-word
bindkey -M vicmd '^U'  backward-kill-line

#bindkey -M viins '^H'  backward-delete-char
#bindkey -M viins '^?'  backward-delete-char
#bindkey -M viins '^G'  send-break
#bindkey -M viins '^D'  delete-char-or-list

# vim-surround
zle -N delete-surround surround
zle -N change-surround surround
zle -N add-surround surround

bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -a S add-surround

# Surround a forward word by single quote by C-Q (insert mode)
quote-previous-word-in-single() {
    modify-current-argument '${(qq)${(Q)ARG}}'
    zle vi-forward-blank-word
}
zle -N quote-previous-word-in-single
bindkey -M viins '^Q' quote-previous-word-in-single

# Surround a forward word by double quote by C-Xq (insert mode)
quote-previous-word-in-double() {
    modify-current-argument '${(qqq)${(Q)ARG}}'
    zle vi-forward-blank-word
}
zle -N quote-previous-word-in-double
bindkey -M viins '^Xq' quote-previous-word-in-double

# Edit command in vim
zle -N edit-command-line
bindkey -M vicmd '^e' edit-command-line

# ========== Extra ============

# Start TMUX by C-T
_start-tmux-if-it-is-not-already-started() {
    BUFFER="${${${(M)${+commands[tmuxx]}#1}:+tmuxx}:-tmux}"
    if has "tmux_automatically_attach"; then
        BUFFER="tmux_automatically_attach"
    fi
    CURSOR=$#BUFFER
    zle accept-line
}
zle -N _start-tmux-if-it-is-not-already-started
if ! [[ -n $TMUX ]]; then
    bindkey '^S' _start-tmux-if-it-is-not-already-started
fi
