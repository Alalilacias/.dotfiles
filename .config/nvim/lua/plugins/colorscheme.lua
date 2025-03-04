return {
  {
    "sainnhe/everforest",
    priority = 1000, -- Ensures it loads early
    lazy = false, -- Load immediately, not on demand
    config = function()
      vim.cmd("colorscheme everforest")
    end,
  },
}

