export SSH_AUTH_SOCK="$HOME/.1password/agent.sock"
ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
if [[ $ALREADY_RUNNING != "0" ]]; then
  if [[ -S $SSH_AUTH_SOCK ]]; then
    echo "removing previous socket..."
    rm $SSH_AUTH_SOCK
  fi
  echo "starting SSH agent relay..."
  (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi
