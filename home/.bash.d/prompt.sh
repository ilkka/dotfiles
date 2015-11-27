if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is not meant to be run directly." 1>&2
	exit 2
fi

###############################################################################
# bash prompt support for docker-machine
#
# This script allows you to see the active machine in your bash prompt.
#
# To enable:
#  1a. Copy this file somewhere and source it in your .bashrc
#      source /some/where/docker-machine-prompt.bash
#  1b. Alternatively, just copy this file into into /etc/bash_completion.d
#  2. Change your PS1 to call __docker-machine-ps1 as command-substitution
#     PS1='[\u@\h \W$(__docker_machine_ps1 " [%s]")]\$ '
#
# Configuration:
#
# DOCKER_MACHINE_PS1_SHOWSTATUS
#   When set, the machine status is indicated in the prompt. This can be slow,
#   so use with care.
#
__docker_machine_ps1 () {
    local format=${1:- [%s]}
    if test ${DOCKER_MACHINE_NAME}; then
        local status
        if test ${DOCKER_MACHINE_PS1_SHOWSTATUS:-false} = true; then
            status=$(docker-machine status ${DOCKER_MACHINE_NAME})
            case ${status} in
                Running)
                    status=' R'
                    ;;
                Stopping)
                    status=' R->S'
                    ;;
                Starting)
                    status=' S->R'
                    ;;
                Error|Timeout)
                    status=' E'
                    ;;
                *)
                    # Just consider everything elase as 'stopped'
                    status=' S'
                    ;;
            esac
        fi
        printf -- "${format}" "${DOCKER_MACHINE_NAME}${status}"
    fi
}

###############################################################################
# Look for powerline
find_powerline_repo() {
  if cmd_exists pip; then
    pip show powerline-status|sed -En 's/^Location: (.*)$/\1/p'
  fi
}

POWERLINE_REPO_ROOT=$(find_powerline_repo)
POWERLINE=$POWERLINE_REPO_ROOT/powerline/bindings/bash/powerline.sh

if [[ -z $POWERLINE_REPO_ROOT || ! -r $POWERLINE ]]; then
  echo "No powerline, using fallback" >&2

  prompt_simple() {
      PS1="\W\$ "
  }

  export PROMPT_COMMAND=prompt_simple
else
  if cmd_exists powerline-daemon; then
    powerline-daemon -q
    export POWERLINE_BASH_CONTINUATION=1
    export POWERLINE_BASH_SELECT=1
  fi

  source $POWERLINE
fi
