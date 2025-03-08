return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",           -- Source for buffer words
    "hrsh7th/cmp-path",             -- Source for file system paths
    "hrsh7th/cmp-cmdline",          -- Source for command-line completion
    "hrsh7th/cmp-nvim-lsp",         -- Source for LSP completion
    "hrsh7th/cmp-nvim-lua",         -- Source for Neovim Lua API
    "L3MON4D3/LuaSnip",             -- Snippet engine
    "saadparwaiz1/cmp_luasnip",     -- Completion source for LuaSnip
    "rafamadriz/friendly-snippets", -- Even more snippets
    "windwp/nvim-autopairs"         -- Autopairs (integrated with cmp)
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Load friendly-snippets if needed
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),            -- Trigger completion manually
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "luasnip" },  -- Snippet completions
        { name = "buffer" },   -- Buffer words
        { name = "path" },     -- File system paths
      }),
    })

    -- Command-line completion
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" }
      }),
    })

    -- Autopairs integration
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
