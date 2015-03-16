BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
ORANGE="\033[0;33m"
BLUE="\033[0;34m"
MAGENTA="\033[0;35m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
RESET="\033[m"

GIT_PROMPT_PREFIX="[git:"
GIT_PROMPT_SUFFIX="]$reset_color"
GIT_PROMPT_DIRTY="\[${ORANGE}\]+"
GIT_PROMPT_CLEAN="\[${GREEN}\]"

function parse_git_dirty() {
  local status=$(git status --porcelain 2> /dev/null)

  if [[ "$status" != "" ]]; then
    echo "$GIT_PROMPT_DIRTY"
  else
    echo "$GIT_PROMPT_CLEAN"
  fi
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$GIT_PROMPT_PREFIX$(current_branch)$GIT_PROMPT_SUFFIX"
}

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function get_pwd() {
  print -D $PWD
}

function spacing() {
  echo "                               "
}

function set_bash_prompt(){
    PS1="\[${GREEN}\]\u \[$BLUE\]\w $(spacing)$(git_prompt_info)\n$ \[$RESET\]"
}

PROMPT_COMMAND=set_bash_prompt
