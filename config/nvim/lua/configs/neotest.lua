local M = {}

M.config = function(_, opts)
  require("neotest").setup(opts)
end

M.keys = {
  { "<leader>tt", '<cmd>lua require("neotest").run.run()<cr>', desc = "Run nearest test" },
  { "<leader>tf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = "Run tests in file" },
  { "<leader>ta", '<cmd>lua require("neotest").run.run({ suite = true })<cr>', desc = "Run all tests" },
  { "<leader>ts", '<cmd>lua require("neotest").summary.toggle()<cr>', desc = "Toggle test summary" },
  { "<leader>to", '<cmd>lua require("neotest").output.open({ enter = true })<cr>', desc = "Open test output" },
  { "<leader>tl", '<cmd>lua require("neotest").run.run_last()<cr>', desc = "Run last test" },
  { "<leader>td", '<cmd>lua require("neotest").run.run({ strategy = "dap" })<cr>', desc = "Debug nearest test" },
}

return M
