# Alias generator
touch .aliases
printf "### Aliases\n" > .aliases
chmod 644 .aliases

OS="$(uname)"

# Linux aliases
if [[ ${OS} == 'Linux' ]]; then

    # Generic
    printf "\n" >> .aliases
    cat ./os/linux | tee -a .aliases &> /dev/null

    # Add eza aliases
    if  (command -v eza &> /dev/null); then
        printf "\n" >> .aliases
        cat ./apps/eza | tee -a .aliases &> /dev/null
    fi

    # Distro specific
    DISTRO="$( cat /etc/*-release | grep -Po '(?<=^ID=).*' )"

    if [[ ${DISTRO} == 'arch' || ${DISTRO} == 'manjaro' ]]; then

        # Arch based
        printf "\n" >> .aliases
        cat ./pkgman/arch | tee -a .aliases &> /dev/null

    elif [[ ${DISTRO} == 'fedora' ]]; then

        # Fedora/RHL based
        printf "\n" >> .aliases
        cat ./pkgman/fedora | tee -a .aliases &> /dev/null

    elif [[ ${DISTRO} == 'debian' || ${DISTRO} == 'ubuntu' ]]; then

        # Debian based
        printf "\n" >> .aliases
        cat ./pkgman/debian | tee -a .aliases &> /dev/null
    fi

# MacOS aliases
elif [[ ${OS} == 'Darwin' ]]; then

    # Generic
    printf "\n" >> .aliases
    cat ./os/macos | tee -a .aliases &> /dev/null

fi
