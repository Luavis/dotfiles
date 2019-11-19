# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# FZF
export FZF_BASE=/usr/local/bin/fzf

export UPDATE_ZSH_DAYS=13
DISABLE_LS_COLORS="false"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git git-flow autojump cp tmux osx pyenv python fzf
    fast-syntax-highlighting zsh-autosuggestions)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# pyenv init
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# alias nproc
alias nproc="sysctl -n hw.physicalcpu"

# set brew make job
export HOMEBREW_MAKE_JOBS=$(nproc)
export EDITOR='nvim'

# Skip forward/back a word with opt-arrow
bindkey '[C' forward-word
bindkey '[D' backward-word

# alias vim as nvim
alias vim="nvim"
alias vi="nvim"

# load dotfiles
for file in ~/.{exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# ADB
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

# go-lang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Python crash in specific version
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JENV (Java Env)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Kubernetes
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh);
fi
alias k8s='kubectl'
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.gcloud/google-console.json

# use GO 1.11 module
export GO111MODULE=on

# fzf options
source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 30% --layout=reverse'
function ssh_list() {
    server_name="$(sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/config | fzf)"
    if [ "$server_name" = "" ]; then
        return
    fi
    echo "Connect to $server_name"
    ssh $server_name
}

fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {} FZF-EOF"
}

fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
