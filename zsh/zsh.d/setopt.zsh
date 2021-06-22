#!/usr/bin/env zsh

# echo "setopt"

# ========== History ============

setopt hist_ignore_dups # Ignore consecutive duplicates
setopt hist_ignore_space # ignore commands starting from space
setopt extended_history # save timestamp and duration of command
setopt append_history # shared history across sessions
setopt inc_append_history # add as run, not just on exit
setopt hist_reduce_blanks # Pack extra blank
setopt hist_verify # don't execute, just expand history

# imports history from other sessions while running.
# !! set either SHARE_HISTORY or INC_APPEND_HISTORY
#setopt SHARE_HISTORY 

# delete an old recorded event if a new event is a duplicate.
#setopt hist_ignore_all_dups
#setopt hist_save_nodups

# ======= Completion =======

setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
#setopt auto_name_dirs # any parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt auto_remove_slash # Automatically delete slash complemented by supplemented by inserting a space.
setopt auto_param_slash # Automatically add slash if completed directory
setopt auto_param_keys # Automatically delete space betwen command arguments when completing
setopt auto_cd # cd into directory without `cd`
setopt auto_pushd

setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word    
setopt complete_in_word # Allow completion from within a word/phrase
setopt list_types #show type of files

unsetopt menu_complete # do not autoselect the first completion entry

# ============ Prompt ===========

setopt prompt_subst # allow to use commands inside prompts, like git branch ($>/home/ (master))
setopt print_exit_value # Show exit status if it's except zero.

# Remove % at the end of line
# See: https://superuser.com/questions/645599/why-is-a-percent-sign-appearing-before-each-prompt-on-zsh-in-windows/1129213
setopt prompt_cr
setopt prompt_sp
export PROMPT_EOL_MARK=""

# ============ Editing ===========

setopt correct # correct commands
# setopt correctall correct arguments

setopt no_case_glob # Ignore case when glob
setopt mark_dirs # If the path is directory, add '/' to path tail when generating path by glob
setopt interactivecomments # allow comments
setopt rc_quotes #~$ echo 'hoge '' fuga'

setopt equals # Expand '=command' as path of command; e.g.) '=ls' -> '/bin/ls'
setopt rm_star_wait # Confirm when executing 'rm *'

# Case of multi redirection and pipe,
# use 'tee' and 'cat', if needed
# ~$ < file1  # cat
# ~$ < file1 < file2        # cat 2 files
# ~$ < file1 > file3        # copy file1 to file3
# ~$ < file1 > file3 | cat  # copy and put to stdout
# ~$ cat file1 > file3 > /dev/stdin  # tee
setopt multios

setopt combining_chars    # Combine zero-length punctuation characters (accents)

# ============ Other ===========

setopt noflowcontrol # Nobody need flow control anymore. Troublesome feature.

# Look for a sub-directory in $PATH when the slash is included in the command
# Thus if ‘/usr/local/bin’ is in the user’s path, and he or she types ‘X11/xinit’, 
# the command ‘/usr/local/bin/X11/xinit’ will be executed (assuming it exists).
#setopt path_dirs

# Use '*, ~, ^' as regular expression
# Match without pattern
#  ex. > rm *~398
#  remove * without a file "398". For test, use "echo *~398"
#setopt extended_glob

# Prevent overwrite prompt from output withour cr
#setopt no_prompt_cr

# setopt globdots

# ============ Jobs ===========
#
# Let me know immediately when terminating job
setopt notify

# Show process ID
setopt long_list_jobs

# ============ Directory Stack ===========

setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# DIRSTACKSIZE=20
# DIRSTACKFILE="$HOME/.cache/zsh/dirs"
# setopt autopushd pushdsilent pushdtohome
# setopt pushdignoredups
# setopt pushdminus # reverts +/- operators

# if [ ! -d $HOME/.cache/zsh ]; then
#     mkdir $HOME/.cache/zsh -p
# fi

# if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
#     dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
#     [[ -d $dirstack[1] ]] && cd $dirstack[1]
# fi

# chpwd() {
#     print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
# }


