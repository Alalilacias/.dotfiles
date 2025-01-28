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

-- TODO finish.

--------------------------------------------------
-- 2. Bash Support
--------------------------------------------------

-- Custom 'shebang' command.

local function WriteInitialLineCustomShebang()
	-- Define template for custom Shebang, customize at will.
	local shebang_template = [[
#!/usr/bin/env bash
#
# Author: Alalilacias
# Description: 
# Syntax:
# Version: 
]]
		
	-- Sets the predefined template string array, split separated by an indent.
	vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(shebang_template, "\n"))
end

vim.api.nvim_create_user_command('Shebang', WriteInitialLineCustomShebang, {})

-- Automatic Shebang writting. TODO check if possible.
