return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        bash = { "shfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        cmake = { "cmakelang" },
        java = {},
        json = { "prettier" },
        json5 = { "prettier" },
        jsonc = { "prettier" },
        kotlin = {},
        lua = { "stylua" },
        make = {},
        markdown = { "prettier", "markdown-toc" },
        nix = {},
        ql = {},
        regex = {},
        rust = { "rustfmt" },
        sql = { "sqlfluff" },
        yaml = { "prettier" },
        ["*"] = { "prettier" },
      },
    },
  },
}
