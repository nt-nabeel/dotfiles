return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome-check" },
        javascriptreact = { "biome-check" },
        ["javascript.jsx"] = { "biome-check" },
      },
    },
  },
}
