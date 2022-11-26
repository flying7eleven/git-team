#compdef git-team
function _git-team {
  local -a opts
  local cmd cur
  cmd=${words[1]}
  cur=${words[-1]}
  if [[ "$cur" == "-"* ]]; then
    if [[ "${cmd}" == "team" ]]; then
      opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 git ${cmd} ${words[@]:1:#words[@]-1} ${cur} --generate-bash-completion)}")
    else
      opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 ${cmd} ${words[@]:1:#words[@]-1} ${cur} --generate-bash-completion)}")
    fi
  else
    if [[ "${cmd}" == "team" ]]; then
      opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 git ${cmd} ${words[@]:1:#words[@]-1} --generate-bash-completion)}")
    else
      opts=("${(@f)$(_CLI_ZSH_AUTOCOMPLETE_HACK=1 ${cmd} ${words[@]:1:#words[@]-1} --generate-bash-completion)}")
    fi
  fi
  if [[ "${opts[1]}" != "" ]]; then
    _describe 'values' opts
  fi
  return
}
compdef _git-team git-team
# the function will automatically be discovered by the git zsh completion as its name follows the pattern _git-<user-command>
# make the 'team' user-command known to the git completion, so that it will be suggested using git<TAB>
zstyle ':completion:*:*:git:*' user-commands team:'manage and enhance git commit messages with co-authors'
