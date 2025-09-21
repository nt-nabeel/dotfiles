local M = {}

M.options = {
  copilot = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },

  ["blink-copilot"] = {
    max_completions = 1,
    max_attempts = 2,
  },

  blink = {
    sources = {
      default = { "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
  },
}
return M
