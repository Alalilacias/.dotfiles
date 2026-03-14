-- Custom 'shebang' command

local function WriteInitialLineCustomShebang()
  -- Define template for custom Shebang, customize at will.
  local shebang_template = [=[
#!/usr/bin/env bash
#
# Author: Alalilacias
# Description: 
# Created at: 

set -euo pipefail
IFS=$'\n\t'

readonly VERSION="0.0.1"
readonly SCRIPT_NAME="$(basename "$0")"

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m' # No Color

log_info() { echo -e "${GREEN}[INFO]${NC} $*"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $*" >&2; }
log_error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

usage() {
  cat << EOF
Usage: $SCRIPT_NAME [options]

Options:
  -h, --help     Show this help message
  -v, --version  Show version information
EOF
}

version() {
  echo "$SCRIPT_NAME version $VERSION"
}

parse_args() {
  # Parse options with getopt. As a quick reminder:
  #   Format: -o for short options, --long for long options
  #   Colon (:) after option means it requires an argument
  TEMP=$(getopt -o hv --long help,version -n "$SCRIPT_NAME" -- "$@")
  
  if [ $? -ne 0 ]; then
    echo "Error: Failed to parse options" >"&2"
    usage
    exit 1
  fi

  eval set -- "$TEMP"

  while true; do
    case $1 in
      -h|--help) usage; exit 0 ;;
      -v|--version) version; exit 0 ;;
      --) shift; break ;;
    esac
    shift
  done
}

main() {
  parse_args "$@"

}

main "$@"
]=]

  -- Sets the predefined template string array, split separated by an indent.
  vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(shebang_template, "\n"))

  -- Save and reload buffer
  vim.cmd("w")
  vim.cmd("e")
end

vim.api.nvim_create_user_command("Shebang", WriteInitialLineCustomShebang, {})
