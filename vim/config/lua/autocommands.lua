
-- Strip whitespace at the end of the lines
local strip_line_exts = {
  "*.py", "*.js", "*.rb", "*.css", "*.scss",
  "*.slim", "*.haml", "*.elm",
  "*.ex", "*.exs"
}

-- Modern API: use vim.api.nvim_create_autocmd instead of vim.cmd
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = strip_line_exts,
  command = "StripLines",
})
