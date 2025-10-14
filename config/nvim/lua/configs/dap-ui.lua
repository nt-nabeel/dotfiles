local M = {}

M.config = function(_, opts)
  local dap = require "dap"
  local dapui = require "dapui"
  local tree = require "nvim-tree"

  dapui.setup(opts)
  dap.listeners.before.attach.dapui_config = function()
    tree.close()
    dapui.open()
  end

  dap.listeners.before.launch.dapui_config = function()
    tree.close()
    dapui.open()
  end

  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end

  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end
end

M.keys = {
  { "<leader>dd", '<cmd>lua require("dapui").toggle()<cr>', desc = "DAP UI Toggle" },
}

return M
