return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- Enables Treesitter integration
    })

    -- nvim-cmp integration
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- Add custom autopairs (e.g., `**` for Markdown bold)
    local Rule = require("nvim-autopairs.rule")
    local npairs = require("nvim-autopairs")

    npairs.add_rules({
      Rule("**", "**", "markdown") -- Adds ** pair in markdown
          :with_move(function(opts)
            return opts.prev_char:match(".%*") ~= nil
          end)
          :use_key("**"),
    })
  end,
}
