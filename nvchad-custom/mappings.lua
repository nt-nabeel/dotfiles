local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format {
          async = true,
          filter = function(client)
            return client.name == "null-ls"
          end,
        }
      end,
      "lsp format",
    },
    ["<leader>."] = {
      function()
        require("base46").toggle_theme()
      end,
      "Toggle themes",
    },
  },
}

return M
