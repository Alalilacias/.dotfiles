return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "shfmt",
      "stylua",
      "prettier",
      "markdownlint",
      "markdown-toc",
      "sqlfluff",
      "jsonlint",
      "yamllint",
      "hadolint",
      "luacheck",
      "cmakelang",
      "rustfmt",
    },
  },
}
