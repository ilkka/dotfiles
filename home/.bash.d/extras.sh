if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is not meant to be run directly." 1>&2
	exit 2
fi

if [[ -d ~/.bash.d/extras ]]; then
  for f in ~/.bash.d/extras/*.sh; do
    source "$f"
  done
fi
