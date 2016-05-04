set PATH $HOME/.local/bin $PATH

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

