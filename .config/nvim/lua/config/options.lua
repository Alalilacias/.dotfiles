-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.wrap = true -- Enable line wrap
opt.spelllang = { "en", "es", "ca" } -- Enable spell check in English, Spanish and Catalan
opt.foldmethod = "manual"
