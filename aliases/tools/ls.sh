# ls

if [[ ${OS} == 'Darwin' ]]; then

cat << EOF | tee -a ./.aliases &> /dev/null
# ls
alias ll='ls -AGlh'
alias ld='ls -AGlhd -- */'
EOF

elif [[ ${OS} == 'Linux' ]]; then

cat << EOF | tee -a ./.aliases &> /dev/null
# ls
alias lf='ls -Alh | grep -v ^d'
alias ll='ls -Alh --group-directories-first --color=always'
alias ld='ls -Alh --group-directories-first --color=always | grep ^d --color=never'
EOF

fi