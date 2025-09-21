---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "solarized_osaka",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  integrations = {
    "dap",
    "render-markdown",
    "tiny-inline-diagnostic",
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },

  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
}

return M
