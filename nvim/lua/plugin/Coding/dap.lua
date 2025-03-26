return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      require("plugin.Coding.debugger")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      require("nvim-dap-virtual-text").setup()
      require("plugin.Ui.dapui")
    end,
  },
}
