# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

export UPDATE_ZSH_DAYS=13
DISABLE_LS_COLORS="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git git-flow autojump cp django xcode
    tmux osx ruby pyenv python
    zsh-syntax-highlighting zsh-autosuggestions)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# pyenv init
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set brew make job
export HOMEBREW_MAKE_JOBS=1

export EDITOR='nvim'

# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word

# alias vim as nvim
alias vim="nvim"
alias vi="nvim"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# load dotfiles
for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# ADB
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# go-lang
export PATH=$PATH:/usr/local/opt/go/libexec/bin

