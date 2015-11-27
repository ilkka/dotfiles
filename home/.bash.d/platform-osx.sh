if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is not meant to be run directly." 1>&2
	exit 2
fi

# restore terminal cwd
if type update_terminal_cwd &>/dev/null; then
    export PROMPT_COMMAND="$PROMPT_COMMAND;update_terminal_cwd;"
else
    function tab_title {
        echo -n -e "\033]0;${PWD##*/}\007"
    }
    PROMPT_COMMAND="$PROMPT_COMMAND;tab_title"
fi

# Add GHC 7.8.4 to the PATH, via http://ghcformacosx.github.io/
GHC_DOT_APP="/Applications/GHC.app"
if [[ -d "$GHC_DOT_APP" ]]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi
