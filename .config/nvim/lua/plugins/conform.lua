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
        -- "_" = fallback for filetypes without formatters ("*" would also run after every filetype's own).
        -- Limited to filetypes prettier can parse; otherwise it errors on e.g. COMMIT_EDITMSG or *.env.
        ["_"] = function(bufnr)
          local prettier_fts = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "less",
            "html",
            "htmlangular",
            "vue",
            "graphql",
            "handlebars",
          }
          if vim.tbl_contains(prettier_fts, vim.bo[bufnr].filetype) then
            return { "prettier" }
          end
          return {}
        end,
      },
    },
  },
}
