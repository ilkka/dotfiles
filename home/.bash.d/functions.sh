# Bash functions
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	echo "This script is not meant to be run directly." 1>&2
	exit 2
fi

###############################################################################
# cmd_exists: check if command exists in path
#
# Args:
#   cmd: command to check
#
# Returns:
#   0 if command found
#   !0 otherwise
cmd_exists() {
  [[ $# -ne 1 ]] && echo "cmd_exists needs one argument" >&2 && exit 1
  command -v $1 >/dev/null 2>&1
}
