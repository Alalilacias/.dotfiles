-- 
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",               -- Required dependency
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Faster sorting
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<esc>"] = actions.close }, -- Allow ESC to close
        },
      },
      pickers = {
        find_files = { hidden = true },  -- Show hidden files
      },
    })

    -- Load the fzf-native sorter
    telescope.load_extension("fzf")
    
    local builtin = require('telescope.builtin')
    
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  
  end,
}
