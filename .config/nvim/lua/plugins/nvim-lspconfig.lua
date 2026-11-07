return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=google",
        },
      },
      -- fwcd/kotlin-language-server (enabled by the LazyVim kotlin extra) is unmaintained
      -- and crashes on Kotlin 2.x; use JetBrains' official kotlin-lsp instead.
      kotlin_language_server = { enabled = false },
      kotlin_lsp = {
        -- Mason installs the kotlin-lsp binary as "intellij-server", not "kotlin-lsp"
        cmd = { "intellij-server", "--stdio" },
      },
    },
  },
}
