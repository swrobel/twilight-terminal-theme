ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo " $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function ruby_version_info() {
  if [ ! -z current_ruby ]; then
    echo "%{$reset_color%} %{$fg[green]%}[$(current_ruby)]%{$reset_color%}"
  else
    echo ""
  fi
}

PROMPT='
  %{$fg[green]%}%~$(git_prompt_info)$(ruby_version_info)
%{$fg[red]%}$%{$reset_color%} '
