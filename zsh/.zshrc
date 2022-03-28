# ZSH configs

# Shell options
bindkey -e
unsetopt beep
setopt autocd 
setopt promptsubst
setopt extendedglob

# Env variables
export EDITOR=vim
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE=~/.zsh_history

# Prompt
precmd() {
    precmd() {
        echo
    }
}

function gitBranch(){
    branch=""
    if git branch &> /dev/null; then
        echo -en ": %F{magenta}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    fi
}

PROMPT=$' %B%F{blue}%(6~.%-1~/…/%4~.%5~)$(gitBranch)\n %F{yellow}%(!.#.$)%b%F{reset} '
RPROMPT='%(?.🍀.💥)'

# Aliases
if [[ -e ~/.aliases ]]; then
    source ~/.aliases
fi

# Completion
autoload -Uz compinit 
compinit

# Colors for man pages
if command -v most 2&> /dev/null; then
    export PAGER="most"
else
    man() {
        LESS_TERMCAP_me=$'\e[0m' \
        LESS_TERMCAP_se=$'\e[0m' \
        LESS_TERMCAP_ue=$'\e[0m' \
        LESS_TERMCAP_md=$'\e[01;33m' \
        LESS_TERMCAP_us=$'\e[01;34m' \
        LESS_TERMCAP_so=$'\e[01;44;33m' \
        command man "$@"
    }
fi