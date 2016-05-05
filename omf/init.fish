set PATH "$HOME/.local/bin" $PATH

# This is so that ghc-mod can find ghc when its only installed with stack
set PATH "$HOME/.stack/programs/x86_64-osx/ghc-7.10.3/bin" $PATH

function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

