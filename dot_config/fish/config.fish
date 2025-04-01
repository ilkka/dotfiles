if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -v direnv &>/dev/null
        direnv hook fish | source
    end
end
