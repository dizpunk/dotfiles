touch aliases
echo "" > aliases
chmod 644 aliases

OS="$(uname)"

# Generic aliases
cat ./files/generic | tee -a aliases &> /dev/null

# Exa / ls
if command -v exa &> /dev/null; then

    echo -ne "\n" >> aliases
    cat ./files/exa | tee -a aliases &> /dev/null

elif command -v ls &> /dev/null; then

    echo -ne "\n" >> aliases
    source ./files/ls

fi

if [[ ${OS} == 'Linux' ]]; then

    # Generic linux aliases
    echo -ne "\n" >> aliases
    cat ./files/linux | tee -a aliases &> /dev/null

    # Distro specific aliases
    DISTRO="$( cat /etc/*-release | grep -Po '(?<=^ID=).*' )"

    if [[ ${DISTRO} == 'arch' || ${DISTRO} == 'manjaro' ]]; then

        # Arch based
        echo -ne "\n" >> aliases
        cat ./files/arch | tee -a aliases &> /dev/null

    elif [[ ${DISTRO} == 'fedora' ]]; then

        # Fedora based
        echo -ne "\n" >> aliases
        cat ./files/fedora | tee -a aliases &> /dev/null

    elif [[ ${DISTRO} == 'debian' || ${DISTRO} == 'ubuntu' ]]; then

        # Debian based
        echo -ne "\n" >> aliases
        cat ./files/debian | tee -a aliases &> /dev/null
    fi
fi
