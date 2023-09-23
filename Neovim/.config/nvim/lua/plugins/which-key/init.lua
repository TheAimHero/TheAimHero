return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("plugins.which-key.which-key")
    require("plugins.which-key.whichkey_maps")
  end,
}
