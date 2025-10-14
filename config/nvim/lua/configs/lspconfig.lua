require("nvchad.configs.lspconfig").defaults()

local servers = {
  "basedpyright",
  "bashls",
  "biome",
  "cssls",
  "docker_language_server",
  "fish_lsp",
  "html",
  "jsonls",
  "marksman",
  "ruff",
  "taplo",
  "terraformls",
  "vtsls",
  "yamlls",
}
vim.lsp.enable(servers)

vim.diagnostic.config { virtual_text = false }

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
