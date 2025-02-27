# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# i guess this is old stuff? check linux
# if test -f /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
#     set -gx KERL_BUILD_DOCS yes
#     source /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.fish
# else if test -f /opt/homebrew/opt/asdf/libexec/asdf.fish
#     set -gx KERL_BUILD_DOCS yes
#     source /opt/homebrew/opt/asdf/libexec/asdf.fish
# else if test -f $HOME/.asdf/asdf.fish
#     set -gx KERL_BUILD_DOCS yes
#     source $HOME/.asdf/asdf.fish
# end
