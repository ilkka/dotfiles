# prevent path strangeness in tmux, see http://superuser.com/a/583502/57235
if [[ -n $TMUX && -f /etc/profile && egrep -q path_helper /etc/profile ]]; then
  PATH=""
  source /etc/profile
fi

[ -r $HOME/.bashrc ] && . $HOME/.bashrc
