#!/usr/bin/env bash
# prompts for a session name and switches to it, creating it first if needed.
# if the name has a preset (@preset_<name> tmux option), the session starts in that directory.

read -r -p "Session name: " name
[ -z "$name" ] && exit 0

if ! tmux has-session -t "=$name" 2>/dev/null; then
	dir=$(tmux show-option -gqv "@preset_$name")
	dir="${dir/#\~/$HOME}"

	if [ -n "$dir" ] && [ -d "$dir" ]; then
		tmux new-session -d -s "$name" -c "$dir"
	else
		tmux new-session -d -s "$name"
	fi
fi

tmux switch-client -t "=$name"
