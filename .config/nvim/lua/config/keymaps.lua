-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

keymap.set("n", "<C-l>", "z=", { desc = "Quick Spell Correction" })

keymap.set("n", "<leader>cc", function()
  local filename = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")
  vim.cmd("!compile_cpp " .. output .. " " .. filename)
end, { desc = "Compile current C++ file" })

keymap.set("n", "<leader>fj", function()
  vim.bo.filetype = "json"
  require("conform").format({ async = false, lsp_format = "never" })
end, { desc = "Set filetype to JSON and format" })
