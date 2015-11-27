if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is not meant to be run directly." 1>&2
	exit 2
fi

if [[ -r /etc/bash_completion ]]; then
  source /etc/bash_completion
fi

# completions from brew too
if cmd_exists brew; then
  PFX=$(brew --prefix)
  if [[ -f ${PFX}/etc/bash_completion ]]; then
    source ${PFX}/etc/bash_completion
  fi
fi

# complete commands and files after sudo:
# from https://github.com/ches/dotfiles/blob/master/.bash.d/completion.sh
complete -f -c sudo

if [[ -d ~/.bash.d/completion ]]; then
  for f in ~/.bash.d/completion/*.sh; do
    source $f
  done
fi
