local M = {}

require("nvim-treesitter.configs").setup({
  ensure_installed = "all", -- "all", "maintained", or custom
  highlight = { enable = true },
  ignore_install = { "phpdoc" },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})

require("treesitter-context").setup({
  enable = true,
  multiwindow = false,
  max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 1, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = '#',
  -- zindex = 20, -- The Z-index of the context window
  -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
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
vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme one-nvim")

function M.toggle_dark_mode(opts)
  if vim.o.background == "dark" then 
    vim.o.background = "light" 
    vim.cmd("colorscheme kanagawa")
  else 
    vim.o.background = "dark" 
    vim.cmd("colorscheme kanagawa")
  end
end

return M
