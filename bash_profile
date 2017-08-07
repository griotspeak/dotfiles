if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
PS1="\[\033[0;47;30m\]\W\[\033[m\][\u]\[\033[0;36m\]\$(__git_ps1 \"(%s)\")\[\033[m\]\$ "
PS2="->"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

export PATH=/usr/local/bin:$PATH
export PATH=/Users/tj/Library/Haskell/bin:$PATH
export PATH="$HOME/.bash_scripts:$PATH"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:.cabal-sandbox/bin
export PATH="$HOME/.bash_scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# alias
alias xcode='open *.xcodeproj >/dev/null 2>&1
if (( $? ))
then
   open *.xcworkspace
fi'

export SBT_OPTS="-XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:PermSize=128M -XX:MaxPermSize=512M"

export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"
