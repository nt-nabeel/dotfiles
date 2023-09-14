local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "json",
    "python",
    "rust",
    "cpp",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "json-lsp",
    "html-lsp",
    "css-lsp",
    "typescript-language-server",
    "prettier",
    "pyright",
    "flake8",
    "isort",
    "black",
    "debugpy",
    "rust-analyzer",
    "rustfmt",
    "codelldb",
    "clangd",
    "sourcery",
    "tailwindcss-language-server",
    "sonarlint-language-server",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitsigns = {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
    ignore_whitespace = true,
  }
}

return M
