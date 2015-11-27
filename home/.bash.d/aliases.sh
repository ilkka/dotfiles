if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is not meant to be run directly." 1>&2
	exit 2
fi

alias ls='ls -Gh'
alias ll='ls -lGh'
alias l='ls -1AGh'

alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias ln="ln -i"

alias vboxmanage=VBoxManage

docker_machine_cmd () {
    if [[ "$1" == "which" ]]; then
        echo $(docker-machine active)
        return
    fi
    if [[ "$1" == "use" ]]; then
        eval $(docker-machine env "$2")
        return
    fi
    if [[ $# > 1 ]]; then
      host=$1
      shift
      docker $(docker-machine config $host) "$@"
    fi
}

alias dkr=docker_machine_cmd

if cmd_exists hub; then
  alias git=hub
fi
