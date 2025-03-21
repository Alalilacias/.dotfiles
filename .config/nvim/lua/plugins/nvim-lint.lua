return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        arts = {
          "--config",
          "/home/alalin/.dotfiles/.config/dotfiles/config/.markdownlint-cli2.yaml",
          "--",
        },
      },
    },
  },
}
