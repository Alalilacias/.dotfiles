-- Define custom paths to ensure lazy is set in the my dotfiles' configuration
local dotfiles_config = os.getenv("HOME") .. "/.dotfiles/.config"
local lazy_data_path = dotfiles_config .. "/nvim/data/lazy"

-- Bootstrap lazy.nvim using custom path
if not (vim.uv or vim.loop).fs_stat(lazy_data_path) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazy_data_path })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Ensure Neovim loads plugins from the custom lazy.nvim path
vim.opt.rtp:prepend(lazy_data_path)

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "everforest" } },
  checker = { enabled = true },
})
