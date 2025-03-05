return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- General purpose and essential LSPs
        "clangd",         -- C, C++
        "dprint",         -- JSON, JSONC, Markdown, Rust (and many more)
        "glsl_analyzer",  -- OpenGL
        "lua_ls"          -- Lua
      }
    })
  end
}
