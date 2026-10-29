-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.wrap = true -- Enable line wrap
opt.spelllang = { "en", "es", "ca" } -- Enable spell check in English, Spanish and Catalan
opt.foldmethod = "manual"

-- Treat .env files as shell only when they start with a shebang; otherwise keep default detection
local function env_by_shebang(_, bufnr)
  local first = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
  if first:match("^#!.*bash") then
    return "bash"
  elseif first:match("^#!.*sh") then
    return "sh"
  end
end

vim.filetype.add({
  extension = { env = env_by_shebang },
  filename = { [".env"] = env_by_shebang },
})
