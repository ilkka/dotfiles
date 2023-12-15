set -l agentSock ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
if test -e $agentSock
  set -gx SSH_AUTH_SOCK $agentSock
end
