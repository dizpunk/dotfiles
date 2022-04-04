# BASH configurations

# If not running interactively return
case $- in
    *i*) ;;
      *) return;;
esac

# Shell options
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s direxpand
shopt -s histappend
shopt -s checkwinsize

# Env variables
export EDITOR=vim
export HISTSIZE=2000
export HISTCONTROL=ignoreboth

# Prompt
RESET='\e[0m'
RED='\e[1;31m'
CYAN='\e[1;36m'
GREEN='\e[1;32m'
PURPLE='\e[1;35m'
YELLOW='\e[1;33m'

function returnCode() {
    if [[ ${?} -eq 0 ]]; then
        echo -en "${GREEN} ✔"
    else
        echo -en "${RED} ✘"
    fi
}

function gitBranch(){
    exit_status=$?
    if git branch &> /dev/null; then
        echo -en ": ${PURPLE}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
    fi
    exit ${exit_status}
}

PROMPT_COMMAND="PROMPT_COMMAND=echo"

if [[ $UID -eq 0 ]]; then
    PS1=" \[${CYAN}\]\w\$(gitBranch)\$(returnCode)\n\[${YELLOW}\] #\[${RESET}\] "
else
    PS1=" \[${CYAN}\]\w\$(gitBranch)\$(returnCode)\n\[${YELLOW}\] $\[${RESET}\] "
fi

# Aliases
if [[ -f ~/.aliases ]]; then
    source ~/.aliases
fi

# Completion
bind 'TAB:menu-complete'
bind 'set show-all-if-ambiguous on'

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        source /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
fi

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
