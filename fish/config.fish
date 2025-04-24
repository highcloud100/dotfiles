if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test "$TERM" = "xterm-kitty"
    alias ssh="env TERM=xterm-256color ssh"
end


fish_add_path /home/high/.spicetify


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/high/.opam/opam-init/init.fish' && source '/home/high/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration

alias vim='nvim'
alias cty='tty-clock -S -c -C 6 -t -n -D'
alias fucking='sudo'
alias n='nvim'
alias t='tmux'
alias ta='tmux attach'
alias tl='tmux ls'
alias cd..='cd ..'
alias gc='git clone '
alias ga='git add .'
alias gcm='git commit -m '
alias gp='git push -u orign main'
alias gs='git status'
alias ll='ls -Alh'
alias ls='lsd --group-dirs first'
alias cat='bat'
alias gc='g++ -o o'
alias py='python3'
alias logout='hyprctl dispatch exit'
