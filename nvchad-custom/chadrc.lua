local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest_light", "everforest" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "minimal"
  }
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
