local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Extras can be added here, source: https://github.com/LazyVim/LazyVim/discussions/1674
    -- AI
    { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.ai.copilot-chat" },

    -- DAP
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },

    -- Languages
    { import = "lazyvim.plugins.extras.lang.clangd" }, -- For C, C++
    { import = "lazyvim.plugins.extras.lang.cmake" }, -- For CMake
    { import = "lazyvim.plugins.extras.lang.docker" }, -- For Dockerfile support
    { import = "lazyvim.plugins.extras.lang.git" }, -- For Git support
    { import = "lazyvim.plugins.extras.lang.java" }, -- For Java support
    { import = "lazyvim.plugins.extras.lang.json" }, -- For JSON, JSON5, JSONC
    { import = "lazyvim.plugins.extras.lang.kotlin" }, -- For Kotlin support
    { import = "lazyvim.plugins.extras.lang.markdown" }, -- For Markdown syntax highlighting and editing
    { import = "lazyvim.plugins.extras.lang.rust" }, -- For Rust support
    { import = "lazyvim.plugins.extras.lang.sql" }, -- For SQL support
    { import = "lazyvim.plugins.extras.lang.toml" }, -- For TOML support
    { import = "lazyvim.plugins.extras.lang.yaml" }, -- For YAML support

    -- Testing
    { import = "lazyvim.plugins.extras.test.core" }, -- For testing core support

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "everforest" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
