return {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup {}
    end,
  },

  {
    "fredrikaverpil/neotest-golang",
    ft = "go",
    dependencies = {
      "nvim-neotest/neotest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          ["neotest-golang"] = {
            dap_go_enabled = true,
          },
        },
      }
    end,
  },
}
