fundle plugin 'tuvistavie/fish-ssh-agent'
fundle plugin 'edc/bass'

fundle init

test -r /usr/share/autojump/autojump.fish; and source /usr/share/autojump/autojump.fish
test -r $HOME/.homesick/repos/homeshick/homeshick.fish; and source $HOME/.homesick/repos/homeshick/homeshick.fish
