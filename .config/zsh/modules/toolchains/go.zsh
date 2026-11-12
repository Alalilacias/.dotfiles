export-if-exec "$HOME/.local/go/bin/go" \
  "GOROOT=$HOME/.local/go" \
  "GOPATH=$HOME/go" \
  "GOBIN=$HOME/go/bin" \
  "PATH=$HOME/.local/go/bin:$HOME/go/bin:$PATH"
