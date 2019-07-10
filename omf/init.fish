set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Global
set -gx EDITOR /usr/bin/vim

# Stack
set PATH "$HOME/.local/bin" $PATH

# Abbreviations
abbr -a dc docker-compose
abbr -a gp git pull

# Android
set PATH "$HOME/Library/Android/sdk/platform-tools/" $PATH
