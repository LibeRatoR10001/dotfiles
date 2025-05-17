return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    -- event = "VeryLazy",
    config = function()
      require("plugin.Coding.debugger")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      require("nvim-dap-virtual-text").setup()
      require("plugin.Ui.dapui")
    end,
  },
}
