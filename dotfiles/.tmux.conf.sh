#!/usr/bin/env bash
set -e

# This script sets the copy command (in particular) and other configuration too
# complex for .tmux.conf (in general).

# Usage: tmux_bind_copy COMMAND
# Uses COMMAND to copy text to the clipboard in tmux.
bind_copy=(bind-key -T copy-mode-vi MouseDragEnd1Pane)
function tmux_bind_copy {
	tmux "${bind_copy[@]}" send-keys -X copy-pipe "$@"
}

tmux_bind_copy wl-copy

# Clone the tmux plugin manager if we don't have it already.
# See: https://github.com/tmux-plugins/tpm
if [[ ! -e ~/.tmux/plugins/tpm ]]; then  # If it's not already cloned...
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
