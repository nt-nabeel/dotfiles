dofile(vim.g.base46_cache .. "tiny-inline-diagnostic")

local M = {}

M.options = {
  show_sources = {
    enabled = true,
  },
}

M.config = function(_, opts)
  require("tiny-inline-diagnostic").setup(opts)

  vim.diagnostic.config { virtual_text = false }
end

return M
