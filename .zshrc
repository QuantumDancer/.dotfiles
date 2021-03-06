# Path to your oh-my-zsh installation.
export ZSH=/home/benjamin/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="intheloop_yellow"

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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git,sudo,autopep8,zsh-256color)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/benjamin/local/bin:$HOME/.config/composer/vendor/bin"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
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

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-shapeshifter.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# custom alias
alias twitch='~/.twitch'
alias mkdir='mkdir -pv'
alias ports='netstat -tulanp'
alias pupdate='sudo pacman -Syu'
alias gl='git log --oneline --graph --decorate --all'
alias zshconfig='vim ~/.zshrc'
alias root='root -l'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -h'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F -h'
alias htt='ssh bfg4 -t tmux a -t htt'
alias mva='ssh bfg4 -t tmux a -t mva'
alias fit='ssh brottler@lxplus033.cern.ch -t tmux a -t fit'

#thefuck
eval "$(thefuck --alias)"

#show dir contents after changing to dir
#function chpwd() {
#    emulate -L zsh
#    ls -a
#}

#set vim as default editor
export VISUAL="vim"
export EDITOR="vim"

#set firefox as default browser
export BROWSER="firefox"

#config make to use all cores
export MAKEFLAGS=-j8

#pythia make

pmake() {
    PYPATH="/home/benjamin/programs/pythia8219"
    MAKEFLAGS="-std=c++11 -O2 -W -Wall -Wshadow"
    ROOTLIBS=$(root-config --libs)
    ROOTINC=$(root-config --incdir)
    eval g++ $MAKEFLAGS $1.cc $PYPATH/lib/libpythia8.a -o $1 -I$PYPATH/include -I$ROOTINC $ROOTLIBS
}

#homestad
function homestead() {
    ( cd ~/Homestead && vagrant $*  )
}
