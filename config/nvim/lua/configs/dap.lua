dofile(vim.g.base46_cache .. "dap")

local M = {}

M.config = function()
  local vscode = require "dap.ext.vscode"
  local json = require "plenary.json"
  vscode.json_decode = function(str)
    return vim.json.decode(json.json_strip_comments(str))
  end

  -- Define DAP signs with better icons
  vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
  )
  vim.fn.sign_define("DapLogPoint", { text = "◈", texthl = "DapLogPoint", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "", numhl = "" })
  vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "✗", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
  )
end

M.keys = {
  { "<leader>dc", '<cmd>lua require("dap").continue()<cr>', desc = "DAP Continue" },
  { "<leader>do", '<cmd>lua require("dap").step_over()<cr>', desc = "DAP Step Over" },
  { "<leader>di", '<cmd>lua require("dap").step_into()<cr>', desc = "DAP Step Into" },
  { "<leader>du", '<cmd>lua require("dap").step_out()<cr>', desc = "DAP Step Out" },
  { "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<cr>', desc = "DAP Toggle Breakpoint" },
  {
    "<leader>dB",
    '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>',
    desc = "DAP Set Breakpoint",
  },
  { "<leader>dr", '<cmd>lua require("dap").repl.open()<cr>', desc = "DAP Open REPL" },
  { "<leader>dl", '<cmd>lua require("dap").run_last()<cr>', desc = "DAP Run Last" },
  { "<leader>dt", '<cmd>lua require("dap").terminate()<cr>', desc = "DAP Terminate" },
}

return M
