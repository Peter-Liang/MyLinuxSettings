alias p="ping -c2 www.qq.com"
alias ls="ls -G"
alias ll="ls -GFlash"
alias la="ls -a"
alias l="ls"

alias gs="git status"
alias gc="git commit"
alias gp="git pull && git push"
alias ga="git add"
alias gd="git diff"

alias vim="/usr/local/bin/vim"
alias vi="vim"

alias du="du -sh"
alias py="python3"

PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "
