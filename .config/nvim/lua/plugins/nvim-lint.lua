return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      json = { "jsonlint" },
      yaml = { "yamllint" },
      lua = { "luacheck" },
    },
    linters = {
      ["markdownlint-cli2"] = {
        args = {
          "--config",
          vim.fn.expand("~/.dotfiles/.config/dotfiles/config/.markdownlint-cli2.yaml"),
          "--",
        },
      },
    },
  },
}
