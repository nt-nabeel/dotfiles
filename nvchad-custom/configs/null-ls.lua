local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.stylua,
  b.formatting.prettier,
  b.diagnostics.flake8,
  b.formatting.isort,
  b.formatting.black,
  b.formatting.rustfmt,
  b.formatting.dprint.with {
    filetypes = { "toml" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
