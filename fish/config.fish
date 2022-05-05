if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

export EDITOR="/usr/local/bin/mate -w"
export PATH="/Applications/Racket_v6-12/bin/:$PATH"
export PATH="/Users/tjusiyan/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export SWIFT_SOURCE_ROOT="/Volumes/Sidebrain/swift-source"

alias build-swift-debug="$SWIFT_SOURCE_ROOT/swift/utils/build-script -r --debug-swift --assertions --skip-build-benchmark --debug-swift-stdlib"
alias build-swift-release="$SWIFT_SOURCE_ROOT/swift/utils/build-script -r --skip-build-benchmark"
 
  set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
