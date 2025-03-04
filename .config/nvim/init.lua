-- Alalilacias' Neovim Configuration

--------------------------------------------------
-- 1. Documentation
--------------------------------------------------

-- Inspiration: https://github.com/erikw/dotfiles/tree/main.

-- Plugins: ~/.config/nvim/lua/plugins.lua

-- Helpful Guides:
-- - https://learnxinyminutes.com/docs/lua/
-- - https://neovim.io/doc/user/lua-guide.html

-- Profiling:
-- - $ nvim --startuptime /tmp/nvim.log, for saving to temporary file.
-- - $ nvim --startuptime /dev/stdout +qall, for printing to console.
-- - Ref: https://stackoverflow.com/questions/1687799/profiling-vim-startup-time

--------------------------------------------------
--
--------------------------------------------------

-- TODO finish.

require("config.lazy")
require('config.options')
require('config.commands.shebang')
