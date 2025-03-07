return {
  "windwp/nvim-ts-autotag",
  after = "nvim-treesitter", -- Ensure Treesitter is loaded first
  config = function()
    require("nvim-ts-autotag").setup({
      enable = true,                             -- Enable automatic tag closing and completion
      filetypes = { "markdown" },
      skip_tags = { "textarea", "pre", "code" }, -- Tags to skip auto-completion (optional)
    })
  end,
}
