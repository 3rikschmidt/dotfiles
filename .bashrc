# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# increase history size
export HISTFILESIZE=2500

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# PS1='${debian_chroot:+($debian_chroot)}\[\033[32m\]\u@\h\[\033[00m\]:\[\033[00;33m\] \W\[\033[00m\]\$ '
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[00;33m\] \W\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -x /usr/bin/cygpath ]; then
	export JAVA_HOME=`cygpath -au "$JAVA_HOME"`
	export ANT_HOME=`cygpath -au "$ANT_HOME"`
	export PATH=$PATH:$HOME/bin.cygwin
fi

# so the PATH is set up correctly when run from IntelliJ
case "$PATH" in
    */usr/bin*)
        ## path already contains bin
    ;;
    
    *)
        echo "Running in IntelliJ"
        PATH=/usr/local/bin:/usr/bin:$PATH
        
        # also update the prompt to show which VCS and branch we are in
        . ~/.bash_prompt
        set_prompts
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# ssh-agent
export SSH_AUTH_SOCK=/tmp/.ssh-socket

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
    # Exit status 2 means couldn't connect to ssh-agent; start one now
    echo "Starting ssh-agent"
    rm -rf /tmp/.ssh-*

    if [ -x /usr/bin/ssh-pagent ]; then
        ssh-pageant -a $SSH_AUTH_SOCK >/tmp/.ssh-script
        . /tmp/.ssh-script
    else
        ssh-agent -a $SSH_AUTH_SOCK >/tmp/.ssh-script
        . /tmp/.ssh-script
    fi
fi

# set Cygwin SVN_SSH, so windows can have its own
export SVN_SSH="ssh -q"
export SVN_EDITOR=vim

