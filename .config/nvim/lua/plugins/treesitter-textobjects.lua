return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  after = "nvim-treesitter", -- Ensure Treesitter is loaded first
  config = function()
    local ts_textobjects = require("nvim-treesitter.configs")

    ts_textobjects.setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump to the next text object
          keymaps = {
            -- Select a block inside a function (without the function signature)
            ["if"] = "@function.inner",
            -- Select the entire function block
            ["af"] = "@function.outer",
            -- Select the class block
            ["ac"] = "@class.outer",
            -- Select an inner class
            ["ic"] = "@class.inner",
            -- Select a block (e.g., for loops, if statements, etc.)
            ["ib"] = "@block.inner",
            ["ab"] = "@block.outer",
            -- Select a function parameter
            ["ip"] = "@parameter.inner",
            ["ap"] = "@parameter.outer",
          },
        },
      },
    })
  end,
}
