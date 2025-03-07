if status is-interactive && test -n "$ALACRITTY_WINDOW_ID"
    eval (zellij setup --generate-auto-start fish | string collect)
    eval (zellij setup --generate-completion fish | string collect)
end
