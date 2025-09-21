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
  "vtsls",
  "yamlls",
}
vim.lsp.enable(servers)

vim.diagnostic.config { virtual_text = false }
