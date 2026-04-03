-- Mouse
vim.opt.mouse = 'a'

-- Timing
vim.opt.timeoutlen = 500

-- UI
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"

-- Splits
vim.opt.splitbelow = true

-- Tab completion
vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildignorecase = true

-- Scroll
vim.opt.scrolljump = 20
vim.opt.scrolloff = 1

-- Indent: soft tabs, 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Display extra whitespace
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
vim.opt.gdefault = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true

-- Folding
vim.opt.foldenable = false
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 30
vim.opt.foldmethod = "indent"

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5

-- Colors
vim.o.termguicolors = true
vim.o.background = "dark"

-- Session & backup
vim.opt.sessionoptions = { "blank", "curdir", "folds", "help", "tabpages", "winsize", "resize", "winpos", "terminal" }
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.backupdir = vim.fn.stdpath("cache") .. "/backup/"
vim.opt.directory = vim.fn.stdpath("cache") .. "/swap/"
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo/"

-- Workaround: Neovim 0.12's built-in Lua highlights query uses 'operator'
-- field not in tree-sitter-lua grammar. Override at startup before any file
-- opens. Remove once Neovim ships a fix (nvim-treesitter#8480).
vim.treesitter.query.set("lua", "highlights", "; disabled")
