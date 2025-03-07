return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },   -- Lazy load on save
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        bash = { "shfmt" },
        c = { "clang-format" },
        c_sharp = { "csharpier" },
        cmake = { "cmake-format" },
        cpp = { "clang-format" },
        java = { "google-java-format" },
        json = { "jq" },
        json5 = { "jq" },
        jsonc = { "jq" },
        kotlin = { "ktlint" },
        lua = { "stylua" },
        make = { "shfmt" },
        markdown = { "prettier" },
        markdown_inline = { "prettier" },
        nix = { "nixfmt" },
        rust = { "rustfmt" },
        sql = { "sqlfluff" },
        yaml = { "prettier" },
        dockerfile = { "dockfmt" },
        xml = { "xmlformatter" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
