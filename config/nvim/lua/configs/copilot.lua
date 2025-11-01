local M = {}

M.options = {
  copilot = {
    copilot_node_command = vim.fn.getenv "FNM_DIR" .. "/aliases/lts-latest/bin/node",
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
      ["."] = false,
      cvs = false,
      gitcommit = false,
      gitrebase = false,
      help = false,
      hgcommit = false,
      markdown = true,
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
