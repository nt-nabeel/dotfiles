require("nvchad.configs.lspconfig").defaults()

local servers = {
  "basedpyright",
  "bashls",
  "biome",
  "cssls",
  "dartls",
  "docker_language_server",
  "fish_lsp",
  "gopls",
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
vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
          genericTypes = true,
        },
      },
    },
  },
})

vim.diagnostic.config { virtual_text = false }

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
