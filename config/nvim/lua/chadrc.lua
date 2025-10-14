---@type ChadrcConfig
local M = {}

---@diagnostic disable-next-line: deprecated
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

M.base46 = {
  theme = "solarized_osaka",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  integrations = {
    "dap",
    "flash",
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
