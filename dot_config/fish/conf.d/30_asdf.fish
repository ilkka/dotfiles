if test -f /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
    set -gx KERL_BUILD_DOCS yes
    source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
else if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
    set -gx KERL_BUILD_DOCS yes
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end
