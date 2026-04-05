local M = {}

-- Disable highlight on syntax errors (TSError was renamed to @error in Neovim 0.10+)
-- Fixes lag when editing files: https://github.com/nvim-treesitter/nvim-treesitter/issues/119
vim.cmd("highlight link @error Normal")

vim.cmd("colorscheme kanagawa")

function M.toggle_dark_mode()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
  vim.cmd("colorscheme kanagawa")
end

return M
