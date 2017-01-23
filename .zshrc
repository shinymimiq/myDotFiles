# Path to your oh-my-zsh installation.
export ZSH=/home/tonliu01/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="mh"
# ZSH_THEME="sorin"
# ZSH_THEME="miloshadzic"
# ZSH_THEME="theunraveler"
# ZSH_THEME="ys"
if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="miloshadzic"
else
  ZSH_THEME="agnoster"
fi
DEFAULT_USER="tonliu01"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git common-aliases ubuntu svn cp command-not-found)

# User configuration

export PATH="/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM=xterm-256color

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

alias tree='tree -C'
alias zshrc='vi ~/.zshrc'

WORK_DIR=/home/tonliu01/Work
# WORK_DIR=/Work/tonliu01

# export PVLIB_HOME=${WORK_DIR}/trunk/work/fastsim/build/PVModelLib/internal
export PVLIB_HOME=${WORK_DIR}/trunk/warehouse/SysGen/PVModelLib/0.0/0/external
export MAXCORE_HOME=${WORK_DIR}/trunk/warehouse/SysGen/Tools/0.0/0/external/Linux64
export PATH=/arm/devsys-tools/abs:$PATH
# SYSGEN_VER=`qrt ESL:SystemGenerator:0.0:/validated`
# export MAXCORE_HOME=${WORK_DIR}/trunk/work/fastsim/build/Tools/internal/Linux64_GCC-4.8
export PATH=$PATH:$MAXCORE_HOME/bin
export SYSTEMC_HOME=/arm/warehouse/Accellera/SystemC/2.3.1/4/internal
export PYTHONPATH=${PVLIB_HOME}/lib/python2.7
#export LD_LIBRARY_PATH=/arm/devsys-tools/collections/gcc/4.8.3/1/linux_3.2-ubuntu_12.04-x86_64/gcc-4.6.3-SYSTEM/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=${MAXCORE_HOME}/lib:$LD_LIBRARY_PATH

export ARMLMD_LICENSE_FILE="8224@sha-lic01, 7010@cam-lic03"

alias work="cd ${WORK_DIR}"
alias fs="cd ${WORK_DIR}/trunk/work/fastsim"
alias css="cd ${WORK_DIR}/trunk/work/fastsim/Platforms/LISA/CSS"
# alias cpp="cd ${WORK_DIR}/Personal/CppPrimer"
alias sv="cd ${WORK_DIR}/kit_validation_suite"

# fs useful command
# alias getAshTrunk="export AshbrookTrunk=/arm/warehouse/SysGen/SubSystemModels/0.0/`qrt SysGen SubSystemModels 0.0 :trunk`/models/Linux64_GCC-4.8/FVP_CSS_Ashbrook"

# alias ds-5="/home/tonliu01/ARM/DS-5_v5.23.0/bin/eclipse"
alias ds-5="/usr/local/DS-5_v5.24.0/bin/eclipse &"
export PATH=$PATH:/home/tonliu01/pycharm-community-2016.1.4/bin
export PATH=$PATH:/home/tonliu01/Developer/clion-2016.2.1/bin
alias pdfreader="/home/tonliu01/Developer/foxitsoftware/foxitreader/FoxitReader.sh&"
source /home/tonliu01/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
