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

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

include $HOME/.extra

# added by travis gem
[ -f /Users/choage5/.travis/travis.sh ] && source /Users/choage5/.travis/travis.sh

# nvm config
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# chruby config
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# ASCII settings for click (http://click.pocoo.org/5/python3/)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

# GPG Code Signing settings
export GPG_TTY=$(tty)

# -------------------------- VIRTUALENVWRAPPER INIT -------------------------- #
source /usr/local/bin/virtualenvwrapper.sh

# ------------------------ TINY CARE TERMINAL SETTINGS ----------------------- #
# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# Use this to have a different animal say a message in the big box.
# export TTC_SAY_BOX='mario'

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/Development/CuttleDev,~Development/OSS/Alive,~/Development/Conferences'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=6

# Which method is to be used to read the git commits ('gitstandup' | 'gitlog').
# If you're having problems seeing your commits in the dahsboard, set
# this value to gitlog.
export TTC_GITBOT='gitlog'

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Denver'

# Set to false if you're an imperial lover <3
export TTC_CELSIUS=false

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=false

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Turn off terminal title
export TTC_TERMINAL_TITLE=false

# Twitter api keys
export TTC_CONSUMER_KEY='...'
export TTC_CONSUMER_SECRET='...'
export TTC_ACCESS_TOKEN='...'
export TTC_ACCESS_TOKEN_SECRET='...'

# ------------------------------- PATH SETTINGS ------------------------------ #
# custom path settings
export MANPATH=/usr/local/man:$MANPATH
export PATH=/usr/local/bin:$PATH  # give /usr/local/bin the highest precedence
export PATH=$PATH:HOME/bin:/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin
export PATH=$PATH:$HOME/.fastlane/bin
export PATH=$PATH:/usr/local/mysql/bin

# Android path settings
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/bin
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/28.0.2
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"

# Yarn path settings
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# --------------------- PICKY ZSH SETTINGS (leave at end) -------------------- #
APPEND_HISTORY="true"
unsetopt share_history

# ------------------------- RBENV INIT (leave at end) ------------------------ #
eval "$(rbenv init -)"
