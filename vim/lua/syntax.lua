local M = {}

require("nvim-treesitter.configs").setup({
  ensure_installed = "all", -- "all", "maintained", or custom
  highlight = { enable = true },
  ignore_install = { "phpdoc" },
  indent = { enable = true },
--  incremental_selection = {
--    enable = true,
--    keymaps = {
--      init_selection = "gnn",
--      node_incremental = "grn",
--      scope_incremental = "grc",
--      node_decremental = "grm",
--    },
--  },
})

vim.o.termguicolors = true
vim.o.background = "dark"

-- Use new filetype.lua
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 0

-- Disable highlight on syntax errors to fix a horrendous lag when editing files
-- See: https://github.com/nvim-treesitter/nvim-treesitter/issues/119
vim.cmd("highlight link TSError Normal")

-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme one-nvim")

function M.toggle_dark_mode(opts)
  if vim.o.background == "dark" then 
    vim.o.background = "light" 
    vim.cmd("colorscheme kanagawa")
  else 
    vim.o.background = "dark" 
    vim.cmd("colorscheme one-nvim")
  end
end

return M
