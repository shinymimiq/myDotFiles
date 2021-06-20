# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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


# navigation through command history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# 
setopt nomatch         # show completion menu on successive tab press
setopt menucomplete
setopt extendedglob
setopt interactive_comments

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
ZPLUG_HOME=$WORKSPACE/zsh/zplug
if [[ ! -d $ZPLUG_HOME ]]; then
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source $ZPLUG_HOME/init.zsh && zplug update
fi

source $WORKSPACE/zsh/zplug/init.zsh
# ====================================
zplug "zsh-users/zsh-autosuggestions"

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "nyquase/vi-mode"
zplug "zsh-users/zsh-completions", depth:1

# Use lib/clipboard plugin only on Mac
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/git",  from:oh-my-zsh, as:plugin


# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zdharma/fast-syntax-highlighting", defer:2

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
alias nv="nvim"
alias ws="cd $WORKSPACE"

# common
alias ls='ls -G'     #size,show type,human readable
alias l='ls -lGFh'     #size,show type,human readable
alias la='ls -lGAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tGRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -lGtFh'   #long list,sorted by date,show type,human readable
alias ll='ls -lG'      #long list

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

# =======================
# END ALIAS


# PROMPT
# =========================


# ==============================
# END prompt


# KeyBinding
# =========================
bindkey '^o' autosuggest-accept
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

# Customize 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $WORKSPACE/myDotFiles/p10k.zsh ]] || source $WORKSPACE/myDotFiles/p10k.zsh
