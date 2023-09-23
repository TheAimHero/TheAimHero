return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    require("plugins.dap.dap_virtual_text"),
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    require("plugins.dap.nvim-dap")
    require("plugins.dap.dapui_auto")
  end,
}
