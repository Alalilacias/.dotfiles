return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          options = {
            -- Sin esto prettier falla en ficheros sin extension (p.ej. "random") aunque el filetype sea json
            ft_parsers = { json = "json", jsonc = "jsonc", json5 = "json5", markdown = "markdown", yaml = "yaml" },
          },
        },
      },
      formatters_by_ft = {
        bash = { "shfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        cmake = { "cmakelang" },
        java = {},
        json = { "prettier" },
        json5 = { "prettier" },
        jsonc = { "prettier" },
        kotlin = { "ktlint" },
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
