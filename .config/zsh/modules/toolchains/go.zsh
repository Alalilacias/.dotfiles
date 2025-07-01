export-if-exec "$HOME/.dotfiles/.local/tools/go/bin/go" \
  "GOROOT=$HOME/.dotfiles/.local/tools/go" \
  "GOPATH=$HOME/go" \
  "GOBIN=$HOME/go/bin" \
  "PATH=$HOME/.dotfiles/.local/tools/go/bin:$HOME/go/bin:$PATH"
