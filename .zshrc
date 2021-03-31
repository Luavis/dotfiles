export ZSH=~/.oh-my-zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LANG=en_US.UTF-8

ZSH_THEME="fbi"
plugins=(git git-flow cp tmux osx fzf
   autojump fast-syntax-highlighting zsh-autosuggestions kubectl)
bindkey '[C' forward-word
bindkey '[D' backward-word

# load dotfiles
for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# load zsh config
source $ZSH/oh-my-zsh.sh

# pyenv init
eval "$(pyenv init -)"

# GOROOT path settings
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# JENV (Java Env)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fzf options
source ~/.fzf.zsh
