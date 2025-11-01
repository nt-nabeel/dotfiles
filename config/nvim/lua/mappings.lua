require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("v", "<", "<gv", { desc = "Visual indent left" })
map("v", ">", ">gv", { desc = "Visual indent right" })

map("n", "<leader>ch", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { 0 }, { 0 })
end, { desc = "Toggle LSP inlay hints" })

map("n", "<leader>fd", function()
  local builtin = require "telescope.builtin"
  builtin.diagnostics {
    bufnr = 0,
  }
end, { desc = "Telescope: Diagnostics for current buffer" })
map("n", "<leader>fD", function()
  local builtin = require "telescope.builtin"
  builtin.diagnostics {}
end, { desc = "Telescope: Diagnostics for all buffers" })
