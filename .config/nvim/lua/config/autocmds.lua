-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd

-- Auto-insert shebang template on new shell scripts
autocmd("BufNewFile", {
  pattern = "*.sh",
  callback = function()
    vim.cmd("Shebang")
  end,
})

-- Auto-chmod +x on save when file has a shebang line
autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    local first = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
    if first:match("^#!") then
      local path = vim.fn.expand("%:p")
      vim.fn.system("chmod +x " .. vim.fn.shellescape(path))
    end
  end,
})

-- Auto-insert header guard on new C/C++ header files
autocmd("BufNewFile", {
  pattern = { "*.h", "*.hpp" },
  callback = function()
    local macro = vim.fn.expand("%:t"):upper():gsub("[^%w]", "_")
    vim.cmd("HeaderGuard " .. macro)
  end,
})

-- Set bash filetype for extensionless files inside any bin/ directory
autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/bin/*",
  callback = function()
    if vim.fn.expand("%:e") == "" then
      vim.bo.filetype = "bash"
    end
  end,
})
