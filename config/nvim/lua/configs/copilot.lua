local M = {}

M.options = {
  copilot = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      ["."] = false,
      cvs = false,
      gitcommit = false,
      gitrebase = false,
      help = false,
      hgcommit = false,
      markdown = false,
      svn = false,
      yaml = true,
    },
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
