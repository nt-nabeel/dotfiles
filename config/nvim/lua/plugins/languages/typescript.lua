return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "biome-check" },
        typescriptreact = { "biome-check" },
        ["typescript.tsx"] = { "biome-check" },
      },
    },
  },
}
