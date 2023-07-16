# Alias generator
touch .aliases
printf "# Aliases\n" > .aliases
chmod 644 .aliases

OS="$(uname)"

if [[ ${OS} == 'Linux' ]]; then

    # Generic linux aliases
    echo -ne "\n" >> .aliases
    cat ./tools/linux | tee -a .aliases &> /dev/null

    # Distro specific aliases
    DISTRO="$( cat /etc/*-release | grep -Po '(?<=^ID=).*' )"

    if [[ ${DISTRO} == 'arch' || ${DISTRO} == 'manjaro' ]]; then

        # Arch based
        echo -ne "\n" >> .aliases
        cat ./tools/arch | tee -a .aliases &> /dev/null

    elif [[ ${DISTRO} == 'fedora' ]]; then

        # Fedora based
        echo -ne "\n" >> .aliases
        cat ./tools/fedora | tee -a .aliases &> /dev/null

    elif [[ ${DISTRO} == 'debian' || ${DISTRO} == 'ubuntu' ]]; then

        # Debian based
        echo -ne "\n" >> .aliases
        cat ./tools/debian | tee -a .aliases &> /dev/null
    fi
fi

# File lister
if command -v exa &> /dev/null; then

    echo -ne "\n" >> .aliases
    cat ./tools/exa | tee -a .aliases &> /dev/null

elif command -v ls &> /dev/null; then

    echo -ne "\n" >> .aliases
    source ./tools/ls.sh

fi
