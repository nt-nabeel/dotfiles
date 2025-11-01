if not set -q SSH_AGENT_PID || not ps aux | grep -E -q "\s+$SSH_AGENT_PID\s+.*ssh-agent" || not test -S "$SSH_AUTH_SOCK"
    eval (keychain --quiet --eval nt-nabeel)
end
