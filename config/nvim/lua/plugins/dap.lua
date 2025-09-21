return {
  {
    "mfussenegger/nvim-dap",
    config = require("configs.dap").config,
    keys = require("configs.dap").keys,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = require("configs.dap-ui").config,
    keys = require("configs.dap-ui").keys,
  },
}
