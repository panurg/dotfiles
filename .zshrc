# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

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
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

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
plugins=(git tmux tmuxinator z vi-mode)

# User configuration

export PATH="/usr/lib/ccache/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.9.3:$(gem environment gemdir)/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# tmux configuration
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOSTART_ONCE="true"
ZSH_TMUX_AUTOCONNECT="true"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# export EDITOR='vim'

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

alias mux=tmuxinator
alias config='$(which git) --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias diff='diff -u --color'

# Android-MYco
# Aliases for speeding up work with device
alias arb='adb reboot bootloader'
alias ar='adb reboot'
alias as='adb shell'
alias al='adb logcat -v time'
alias fr='fastboot reboot'
alias fd='fastboot devices'
alias ffb='fastboot flash boot'
alias ffs='fastboot flash system'
alias ffv='fastboot flash vendor'
alias ffr='fastboot flash recovery'
alias ffa='ffb && ffs $OUT/system.img.gz && fr'
alias asit="adb shell input text"
alias asik="adb shell input keyevent"

# Build settings
export USE_CCACHE=1

[ -f $HOME/.zshrc.private ] && source $HOME/.zshrc.private
# end of Android-MYco

# do not remove automatically inserted space when entering pipe symbol
export ZLE_SPACE_SUFFIX_CHARS=$'|'

# integration of z and fzf
unalias z 2> /dev/null
_j() {
   [ $# -gt 0 ] && _z "$*" && return
   cd "$(_z -l 2>&1 | fzf-tmux -d 40% --nth 2.. --reverse --height 40% \
      --inline-info | sed 's/^[0-9,.]* *//')"
}
alias j=_j

# color sources for less by using pygments
export LESSOPEN='| pygmentize -f terminal16m %s'
export LESS='-R'

