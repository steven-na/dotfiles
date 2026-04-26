set fish_greeting

# Auto-attach to tmux on interactive startup (skip if already inside tmux)
# if status is-interactive && not set -q TMUX
#     exec tmux new-session
# end

set -gx EDITOR nvim
set -gx BROWSER zen-browser

fish_add_path ~/.local/bin

# Starship prompt
starship init fish | source

# Zoxide (replaces cd)
zoxide init fish | source

# Direnv
direnv hook fish | source

# FZF
# Wallust: set FZF_DEFAULT_OPTS with colors from ~/.cache/wallust/fzf-colors when wiring theming
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
