return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = require("configs.tiny-inline-diagnostic").options,
    config = require("configs.tiny-inline-diagnostic").config,
  },
}
