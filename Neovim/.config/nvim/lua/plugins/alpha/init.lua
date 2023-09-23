return {
  "goolord/alpha-nvim",
  enabled = true,
  event = "VimEnter",
  config = function()
    require("alpha").setup(require("plugins.alpha.screen").opts)
  end,
}
