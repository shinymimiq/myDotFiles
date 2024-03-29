# Common initial setup

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export DEVSPACE=$HOME/Developer


# navigation through command history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# 
setopt extendedglob
setopt interactive_comments

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# should this be in keybindings?
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# completions
# autoload -Uz compinit
# zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

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


# zplug 
# Check if zplug is installed
ZPLUG_HOME=$DEVSPACE/zsh/zplug
if [[ ! -d $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source $ZPLUG_HOME/init.zsh && zplug update
fi

source $DEVSPACE/zsh/zplug/init.zsh
# ====================================
zplug "zsh-users/zsh-autosuggestions"

zplug "nyquase/vi-mode"
zplug "zsh-users/zsh-completions", depth:1

# Use lib/clipboard plugin only on Mac
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/git",  from:oh-my-zsh, as:plugin

zplug "modules/prompt", from:prezto


# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load  # Quitely load plugins
# =============================
# END ZSH PLUGINs


# Alias
# =============================

# common
alias ls='exa'     #size,show type,human readable
alias l='exa -1'
alias la='exa -la'  #long list, all
alias lr='exa -lR'  #recursive
alias lt='exa -T'   #tree view
alias lg='exa -G'   #grid view
alias ll='exa -l'   #long list

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

alias g="lazygit"
alias tmux="tmux -u" # tmux font issue over ssh
alias nv="nvim"
alias nvc="nvim --noplugin" # nvim without plugin

# =======================
# END ALIAS

# KeyBinding
# =========================
bindkey '^o' autosuggest-accept
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

# Source work zshrc
if [[ ! -z "${WORKING_MACHINE}" ]]; then
    source $DEVSPACE/myDotFiles/work/zsh-work-local
fi


# ========================
#  Customize for apps installed
# ========================
if ! type "exa" > /dev/null; then
  echo "NO exa installed"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --color=always'
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# prompt
prompt minimal
