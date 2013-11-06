if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# ### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR="/usr/local/bin/mate -w"

source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
PS1="\[\033[0;47;30m\]\W\[\033[m\][\u]\[\033[0;36m\]\$(__git_ps1 \"(%s)\")\[\033[m\]\$ "
PS2="->"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export PATH="$HOME/.bash_scripts:$PATH"
export PATH="/usr/local/share/python:$PATH"
export OBJC_UNCRUSTIFY_CONFIG=$HOME/Development/UncrustifyConfigs/uncrustify_obj_c.cfg
export PYTHONPATH="/usr/local/bin/python"
# export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# alias
alias tmifa='tmuxinator ifa'
alias tmmt='tmuxinator tjumt'
alias xcode='open *.xcodeproj >/dev/null 2>&1
if (( $? ))
then
   open *.xcworkspace
fi'
alias uverse='tmuxinator uverse'
OCLINT_HOME=/Users/tj/Development/C-Like/External/oclint-0.8.dev.2888e0f
export PATH=$OCLINT_HOME/bin:$PATH
