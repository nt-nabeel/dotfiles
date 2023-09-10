local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd("BufEnter", {
  pattern = { "*" },
  command = "lua require('lazygit.utils').project_root_dir()",
})

autocmd("BufWritePost", {
  pattern = { "tmux.conf" },
  command = "execute 'silent !tmux source <afile> --silent'",
})
