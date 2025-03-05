return {
  "echasnovski/mini.pairs",
  version = false, -- Use the latest version
  event = "InsertEnter",
  config = function()
    require("mini.pairs").setup()
  end,
}
