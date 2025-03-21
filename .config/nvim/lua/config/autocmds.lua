-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local keymap = vim.keymap

-- Export to PDF using Pandoc
keymap.set("n", "<leader>mpd", ":!pandoc % -o %:r.pdf --pdf-engine=xelatex<CR>", { desc = "Export Markdown to PDF" })

-- Compiles current file using custom function compile_cpp
keymap.set("n", "<leader>cc", function()
  local filename = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")

  vim.cmd("!compile_cpp " .. output .. " " .. filename)
end, { desc = "Compile current C++ file" })
