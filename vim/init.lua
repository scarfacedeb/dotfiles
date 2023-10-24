-- Assign to global config variable to make it easier to access them via `:lua config.keybindings.func()`
_G.config = {
  plugins = require('plugins'),
  syntax = require('syntax'),
  fuzzy = require('fuzzy'),
  git = require('git'),
  ui = require('ui'),
  keybindings = require('keybindings'),
  numbers = require('numbers'),
  autocommands = require('autocommands'),
  lsp = require('lsp'),
  autocomplete = require('autocomplete'),
  -- dap_config = require('dap_config'),
  session = require('session'),
}

function _G.inspect(obj)
  output = vim.inspect(obj)
  print(output)
  return output
end

-- ALIASES

-- Alias %% to current file dir
vim.cmd("cabbr <expr> %% expand('%:p:h')")
-- Alias %$ to current filename
vim.cmd("cabbr <expr> %$ expand('%:t')")


-- CONFIG

-- UI
-- vim.opt.lazyredraw = true
vim.opt.cursorline = true
vim.opt.colorcolumn = "120" -- color 120 column

-- Open new split panes to <s>right</s> and bottom, which feels more natural
vim.opt.splitbelow = true
-- vim.opt.splitright = true

-- Tab completion
-- will insert tab at beginning of line,
-- will use completion if not at beginning
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildignorecase = true

-- Scroll
vim.opt.scrolljump = 20  -- lines to scroll when cursor leaves screen
vim.opt.scrolloff = 1   -- minimum lines to keep above and below cursor


-- EDITING

-- Indent
-- Soft tabs, 2 spaces
vim.opt.tabstop = 2         -- number of visual spaces per TAB
vim.opt.softtabstop = 2     -- number of spaces in tab when editing
vim.opt.shiftwidth = 2      -- number of spaces to indent with << >>
vim.opt.shiftround = true        -- take into account existing spaces with << >>
vim.opt.expandtab = true         -- turn TAB into spaces in Insert

-- Display extra whitespace
-- extends, precedes – when line continues further (nowrap)
vim.opt.list = true 
vim.opt.listchars = { 
  tab = "»·", 
  trail = "·", 
  nbsp = "~", 
  eol = "¬", 
  extends = ">", 
  precedes = "<" 
}

-- Search
vim.opt.gdefault = true -- the /g flag on :s substitutions by default
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true            -- no highlight matches

-- Folding
vim.opt.foldenable = false    -- disabled by default, enabled with za
vim.opt.foldlevelstart = 99   -- open most folds by default
vim.opt.foldnestmax = 30      -- max nested folds
vim.opt.foldmethod = "indent" 
-- Slows down incremental search and replace
-- vim.opt.foldmethod = "expr"  -- folds including top
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


-- CODI
vim.g['codi#interpreters'] = {
  -- Disable multiline to make it work
  ruby = {
    bin = { 'irb', '-f', '--nomultiline' }
  }
}
