# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input should go above this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZIM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zim"
export ZIM_CONFIG_FILE="${ZDOTDIR}/zimrc"
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"
export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"

mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}/zsh" "${XDG_STATE_HOME:-$HOME/.local/state}/zsh"

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi

[[ ! -f "${ZDOTDIR}/.p10k.zsh" ]] || source "${ZDOTDIR}/.p10k.zsh"

source "${ZIM_HOME}/init.zsh"

set +o noclobber
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

export PATH="/opt/homebrew/bin:$HOME/.local/bin:$PATH"
export LANG="en_US.UTF-8"

for file in "${ZDOTDIR}"/.{exports,aliases,functions,secrets}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

eval "$(pyenv init -)"

export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init - zsh)"

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
