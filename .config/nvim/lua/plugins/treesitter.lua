return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
                -- Languages
                "bash",
                "c", "c_sharp", "cmake", "cpp",
                "java",
                "json", "json5", "jsonc",
                "kotlin",
                "lua",
                "make",
                "markdown", "markdown_inline",
                "nix",
                "ql",
                "regex",
                "rust",
                "sql",
                "yaml",
                -- Config file types
                "comment",
                "dockerfile",
                "gitattributes",
                "gitignore",
                "gitcommit",
                "git_rebase",
                "xml",
                "vim",
                "vimdoc"},
      highlight = { enable = true },
      indent = { enable = true },
      enable_autocmd = false,
    })
  end,
}
