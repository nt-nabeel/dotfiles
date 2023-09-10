local dap = require "dap"
dap.set_log_level "DEBUG"

-- python
local venv_path = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX"
dap.adapters.python = {
  type = "executable",
  command = vim.fn.exepath "debugpy-adapter",
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Python: Launch file",
    program = "${file}",
    pythonPath = venv_path and (venv_path .. "/bin/python") or nil,
  },
  {
    type = "python",
    request = "launch",
    name = "Python: Launch Django",
    program = "${workspaceFolder}/manage.py",
    args = { "runserver", "--noreload", "--nothreading" },
    pythonPath = venv_path and (venv_path .. "/bin/python") or nil,
  },
}

-- codelldb (rust)
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath "codelldb",
    args = { "--port", "${port}" },
  },
}
dap.configurations.rust = {
  {
    name = "rust: launch with build",
    type = "codelldb",
    request = "launch",
    program = function()
      local cargo_toml = require("custom.utils").toml_to_lua_table(vim.fn.getcwd() .. "/Cargo.toml")
      local workspaceFolderBasename = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      local target = cargo_toml.package.name or workspaceFolderBasename

      print("Building " .. target .. "...")
      vim.cmd("silent !cargo build --package " .. target .. " --bin " .. target .. " --target-dir target")
      print("Done building " .. target .. "!")

      return "${workspaceFolder}/target/debug/" .. target
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
  {
    name = "rust: launch without build",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- vscode launch.json
require("dap.ext.vscode").load_launchjs()
