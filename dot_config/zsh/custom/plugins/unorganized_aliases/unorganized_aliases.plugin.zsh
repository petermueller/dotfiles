# Just a bunch of aliases that are general enough they don't get their own file.
# These should be general, and not distro/OS, computer, or employer specific.

# "code" is the VSCode command
alias e="code"

# Quick-edit alias of readily edited folders across systems
alias dotfiles="e ~/.dotfiles"
alias ohmyzsh="e ~/.oh-my-zsh"


alias tmc="clear && tmux clear-history"
alias json="jql"
alias dps="docker ps --format 'table {{.Names}}\t{{.Ports}}'"


ttf() {
  mix test $@;
  while [ $? -eq 0 ]; do
    mix test $@;
  done
}

ttf_clear() {
  mix test $@;
  while [ $? -eq 0 ]; do
    tmc
    mix test $@
  done
}
