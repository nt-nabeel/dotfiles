return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = require("configs.copilot").options.copilot,
  },

  {
    "fang2hou/blink-copilot",
    opts = require("configs.copilot").options["blink-copilot"],
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      "fang2hou/blink-copilot",
    },
    opts = require("configs.copilot").options.blink,
  },
}
