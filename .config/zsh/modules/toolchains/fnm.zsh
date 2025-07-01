export-if-exec "$HOME/.local/share/fnm/fnm" \
  "PATH=$HOME/.local/share/fnm:$PATH"
if command -v fnm &>/dev/null; then
  eval "$(fnm env)"
fi
