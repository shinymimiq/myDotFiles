# Common initial setup

export LANG=en_GB.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export WORKSPACE=$HOME/Developer


# ZSH options
# for more info, check man zshoptions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload -i zsh/complist

# navigation through command history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

# 
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

stty stop undef		# Disable ctrl-s to freeze terminal.
# zle_highlight=('paste:none')

# directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus


# ZSH Plugins
source $WORKSPACE/zsh/zplug/init.zsh
# ====================================
zplug "zsh-users/zsh-autosuggestions"





# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
# =============================
# END ZSH PLUGINs


# Alias
# =============================
alias nv="nvim"
alias ws="cd $WORKSPACE"

# common
alias l='ls --color=auto -lFh'     #size,show type,human readable
alias la='ls --color=auto -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls --color=auto -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls --color=auto -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls --color=auto -l'      #long list

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias h='history'
alias p='ps -f'

# directory
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -10
  fi
}
compdef _dirs d

# git
alias g="git"
alias gcl='git clone --recurse-submodules'
alias gl="git pull"
alias gp="git push"
alias ga="git add"
alias gb="git branch"
alias gc="git commit -v"
alias gc!='git commit -v --amend'
alias gco="git checkout"
alias gcb='git checkout -b'
alias gcount='git shortlog -sn'
alias gst="git status"
alias grb="git rebase"
alias grbi="git rebase --interactive"
alias gsta='git stash push'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gd='git diff'

# tmux
alias ta='tmux attach -t'



# =======================
# END ALIAS


# VIM MODE
# ====================
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# ===================
# END VIM MODE


# PROMPT
# =========================
## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

# enable only git 
zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

# format our main prompt for hostname current folder, and permissions.
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "
# TODO look into this for more colors
# https://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
# also ascii escape codes
# ==============================
# END prompt


# Customize 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

