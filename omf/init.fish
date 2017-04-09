set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Global
set -gx EDITOR /usr/local/bin/emacs

# Stack
set PATH "$HOME/.local/bin" $PATH

# Abbreviations
abbr -a dc docker-compose
