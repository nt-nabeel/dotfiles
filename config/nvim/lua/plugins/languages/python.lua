return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-ui",
    },
    config = function()
      require("dap-python").setup "uv"
    end,
  },

  {
    "nvim-neotest/neotest-python",
    ft = "python",
    dependencies = {
      "nvim-neotest/neotest",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python",
        },
      }
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
}
