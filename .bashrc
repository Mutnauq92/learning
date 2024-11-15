# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors and Prompt
PS1='${debian_chroot:+($debian_chroot)}\033[01;32m\u@\h:\033[01;34m\w\$\033[00m '

# Alias definitions
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias e='exit'
alias update='sudo apt update && sudo apt upgrade -y'

# Kali-specific tools aliases (sample)
alias nmap='nmap -sV'
alias nikto='nikto -host'
alias metasploit='sudo msfconsole'
alias sqlmap='sudo sqlmap'
alias gobuster='gobuster dir -u'
alias python3='python3'
alias py='python3'

# Custom functions for Kali NetHunter
function extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Enable persistent history and ignore duplicates
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Custom prompt for root
if [ "$(id -u)" -eq 0 ]; then
    PS1='\033[01;31m\u@\h:\w\$ \033[00m'
fi

# Adding more tools to PATH
export PATH="$PATH:/usr/share/exploitdb:/opt/metasploit-framework/bin:/opt/nmap"

# Add Tab Autocompletion for Kali tools
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Load aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Alias for Kali's commonly used directories
alias web='cd /var/www/html'
alias payloads='cd /usr/share/metasploit-framework/modules/payloads'
alias exploits='cd /usr/share/exploitdb/exploits'
alias wordlists='cd /usr/share/wordlists'

function lsenv () {
        count=$(ls ~/envs -1 | wc -l)
        if [ "$count" -eq ;0 ]; then
                echo "Did you perhaps forget to create a virtual environment!"
        else
                echo "$count"
                envlist
        fi
}

function mkvirtualenv () {
        local env_name=$1
        virtualenv ~/envs/$1
        workon $1
}

function envlist () {
        dir ~/envs
}

function workon () {                                         local arg=$1
        source ~/envs/$1/bin/activate
}
                                                     function inst () {
        localhost arg1=$1
        apt-get install $1 -y
}

function spdown () {
        local arg1=$1
        spacy download en_core_web_$1
}

alias cls="clear"
alias edal="vim ~/.bashrc"
alias sali="source ~/.bashrc"
alias py="python3"
alias la="ls -a"
alias vstart="vncserver-start"
alias vstop="vncserver-stop"
alias upgr="apt-get upgrade -y"
alias upd="apt-get update -y"
alias off="deactivate"
alias del="rm -r"

