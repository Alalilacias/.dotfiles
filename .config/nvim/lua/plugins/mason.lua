return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clang-format",
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
