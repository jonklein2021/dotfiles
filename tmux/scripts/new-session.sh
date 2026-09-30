#!/usr/bin/env bash
# prompts for a session name and switches to it, creating it first if needed.
# if the name has a preset (@preset_<name> tmux option), the session starts in that directory.

read -r -p "Session name: " name
[ -z "$name" ] && exit 0

if ! tmux has-session -t "=$name" 2>/dev/null; then
	dir=$(tmux show-option -gqv "@preset_$name")
	dir="${dir/#\~/$HOME}"

	if [ -n "$dir" ] && [ -d "$dir" ]; then
		# if a match is found, create a new session is the correspondent
		# directory, then open nvim in a new window
		tmux new-session -d -s "$name" -c "$dir"
		tmux new-window -t "=$name:" -c "$dir"
		tmux send-keys -t "=$name:" nvim Enter
	else
		tmux new-session -d -s "$name"
	fi
fi

tmux switch-client -t "=$name"
