-- Mapping of filetypes to formatters for making it easier to configure conform.nvim
-- The keys are the filetypes and the values are lists of formatters to use for that filetype
-- So we need to convert this to the format that conform.nvim expects
local mapping_formatters = {
  lua = {
    lua = { "stylua" },
  },

  bash = {
    bash = { "shfmt" },
    sh = { "shfmt" },
  },

  css = {
    css = { "biome" },
    scss = { "prettier" },
    less = { "prettier" },
  },

  docker = {
    dockerfile = { "dockerfmt" },
  },

  fish = {
    fish = { "fish_indent " },
  },

  html = {
    html = { "prettier" },
    templ = { "templ" },
  },

  javascript = {
    javascript = { "biome-check" },
    javascriptreact = { "biome-check" },
    ["javascript.jsx"] = { "biome-check" },
  },

  json = {
    json = { "biome" },
    jsonc = { "biome" },
  },

  markdown = {
    markdown = { "prettier" },
  },

  python = {
    python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
  },

  terraform = {
    terraform = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
  },

  toml = {
    toml = { "taplo" },
  },

  typescript = {
    typescript = { "biome-check" },
    typescriptreact = { "biome-check" },
    ["typescript.tsx"] = { "biome-check" },
  },

  yaml = {
    yaml = { "prettier" },
    yml = { "prettier" },
  },
}

local options = {
  -- Extra formatters that are not in the mapping above
  formatters_by_ft = function()
    local formatters = {}
    for _, ft_map in pairs(mapping_formatters) do
      for ft, fmt_list in pairs(ft_map) do
        if not formatters[ft] then
          formatters[ft] = {}
        end
        vim.list_extend(formatters[ft], fmt_list)
      end
    end
    return formatters
  end,

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
