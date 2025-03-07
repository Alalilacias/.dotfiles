return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "clangd",                 -- C, C++
        "glsl_analyzer",          -- OpenGL
        "jdtls",                  -- Java (Maven, Gradle, general Java support)
        -- "json-lsp",               -- JSON
        "kotlin_language_server", -- Kotlin
        "lua_ls",                 -- Lua
        "marksman",               -- Markdown
        "rust_analyzer",          -- Rust
        -- "sqlls"                   -- SQL
      }
    })
  end
}
