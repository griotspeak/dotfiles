#!/usr/bin/env bash

# AUTO-GENERATED with Twig v1.2. Regenerate with `twig init-completion`.
#
# Initializes bash tab completion for Twig. To use this, run
# `twig init-completion` and follow the instructions.
#
# Author: Ron DeVera <http://rondevera.com>

__twig_branches() {
  local current words
  current="${COMP_WORDS[COMP_CWORD]}"
  words="$(git for-each-ref refs/heads/ --format="%(refname:short)" | tr '
' ' ')"
  COMPREPLY=($(compgen -W "$words" -- "$current"))
  return 0
}

__twig() {
  if [ -z "$(git rev-parse HEAD 2>/dev/null)" ]; then
    return 0;
  fi

  local previous=${COMP_WORDS[COMP_CWORD-1]}

  case "${previous}" in
  -b|--branch)  __twig_branches ;;
  esac

  return 0
}

complete -F __twig twig
