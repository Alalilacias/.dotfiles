return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config= function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,         -- Show hidden files/folders (in case you want to see them)
          hide_dotfiles = false,  -- Change to true if you want to hide dotfiles
          hide_gitignored = true  -- Hide files ignored by git (e.g., in .gitignore)
        }
      },
      git_status = {
        window = {
          position = "float"      -- Position of the git status window
        },
        filtered_items = {
          hide_dotfiles = false   -- Change to true to hide dotfiles in git status window
        },
        -- Show unstaged, staged, and modified files in git status
        show_ignored = false,     -- Hide ignored files in the git status view
      }
    })
    -- Keybindings
        vim.keymap.set('n', '<C-f>', ':Neotree<CR>', {})
        vim.keymap.set('n', '<C-g>', ':Neotree git_status<CR>', {})
        vim.keymap.set('n', '<C-b>', ':Neotree buffers<CR>', {})
  end,
}
