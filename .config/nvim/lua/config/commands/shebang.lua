-- Custom 'shebang' command

local function WriteInitialLineCustomShebang()
  -- Define template for custom Shebang, customize at will.
  local shebang_template = [=[
#!/usr/bin/env bash
# 
# Author: Alalilacias
# Description: 
# Created at: 

VERSION=0.0.1


usage() {
  read -r -d '' USAGE_STRING << EOM
Usage: $(basename "$0") [options]

Options:
  -h, --help     Show help
  -v, --version  Show version
EOM
  echo "$USAGE_STRING"
}

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    -h|--help) usage; exit 0 ;;
    -v|--version) echo "Version $VERSION"; exit 0 ;;
    *) echo "Unknown option: $1"; usage; exit 1 ;;
  esac
  shift
done
]=]

  -- Sets the predefined template string array, split separated by an indent.
  vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(shebang_template, "\n"))

  -- Save and reload buffer
  vim.cmd("w")
  vim.cmd("e")
end

vim.api.nvim_create_user_command("Shebang", WriteInitialLineCustomShebang, {})
