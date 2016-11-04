# Global
set -gx EDITOR /usr/local/bin/emacs

# Stack
set PATH "$HOME/.local/bin" $PATH

# Node.js
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# Direnv
eval (direnv hook fish)
