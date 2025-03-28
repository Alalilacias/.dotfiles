return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Programming languages
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "java",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "ql",
        "regex",
        "rust",
        "sql",
        "yaml",

        -- Config & special filetypes
        "comment",
        "dockerfile",
        "gitattributes",
        "gitignore",
        "gitcommit",
        "git_rebase",
        "xml",
        "vim",
        "vimdoc",

        -- Optional but used in plugins
        "latex",
        "html",
      },
    },
  },
}
