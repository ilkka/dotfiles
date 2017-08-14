test -r $HOME/.homesick/repos/homeshick/homeshick.fish; and source $HOME/.homesick/repos/homeshick/homeshick.fish
eval (python3 -m virtualfish auto_activation compat_aliases 2>/dev/null)
test -r $HOME/.asdf/asdf.fish; and source $HOME/.asdf/asdf.fish
