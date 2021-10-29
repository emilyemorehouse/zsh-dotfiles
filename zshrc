# ------------------------------- ZSH SETTINGS ------------------------------- #
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export SHELL=/bin/zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="emilyemorehouse"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

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

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh-custom

# -------------------------------- ZSH PLUGINS ------------------------------- #
plugins=(cake git sublime osx git-flow git-extras node battery nvm rvm npm rsync sublime common-aliases web-search functions aliases)

case `uname` in
  Darwin)
    plugins=(brew z osx $plugins)
    ;;
  Linux)
    plugins=(debian $plugins)
    ;;
esac

plugins=($plugins zsh-syntax-highlighting)

# --------------------------------- ZSH INIT --------------------------------- #
source $ZSH/oh-my-zsh.sh

# ------------------------------- MISC SETTINGS ------------------------------ #
# Make vim the default editor
export EDITOR="vim"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Prefer US English and use UTF-8
export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# GPG Code Signing settings
export GPG_TTY=$(tty)

# ------------------------------- PATH SETTINGS ------------------------------ #
# custom path settings
export MANPATH=/usr/local/man:$MANPATH
export PATH=/usr/local/bin:$PATH  # give /usr/local/bin the highest precedence!
export PATH=$PATH:$HOME/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Fastlane path settings
export PATH=$PATH:$HOME/.fastlane/bin

# Java + Android path settings
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/28.0.2
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"

# Yarn path settings
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# ------------------------------- PYENV SETTINGS ------------------------------ #
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# -------------------------- VIRTUALENVWRAPPER INIT -------------------------- #
export VIRTUALENVWRAPPER_PYTHON=$(which python)
source /usr/local/bin/virtualenvwrapper.sh

# -------------------------- RVM INIT -------------------------- #
source $HOME/.rvm/scripts/rvm

# --------------------- PICKY ZSH SETTINGS (leave at end) -------------------- #
APPEND_HISTORY="true"
unsetopt share_history

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/emily/Development/Installed Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/emily/Development/Installed Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/emily/Development/Installed Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/emily/Development/Installed Tools/google-cloud-sdk/completion.zsh.inc'; fi
