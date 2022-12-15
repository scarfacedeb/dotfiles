-- SESSION

local session = require("auto-session")

session.setup({
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = false,
  auto_session_enable_last_session = false,
  auto_session_suppress_dirs = { "~" },
  auto_session_root_dir = vim.fn.stdpath('cache') .. "/sessions/",
})

-- Skip hidden buffers and options because they can corrupt sessions
vim.opt.sessionoptions = { "blank", "curdir", "folds", "help", "tabpages", "winsize", "resize", "winpos", "terminal" }

-- nnoremap <leader><C-S>o :RestoreSession<CR>
-- nnoremap <leader><C-S>s :SaveSession<CR>
-- nnoremap <leader><C-S>d :DeleteSession<CR>

-- BACKUP

vim.opt.backup = true
vim.opt.undofile = true
vim.opt.backupdir = vim.fn.stdpath("cache") .. "/backup/"
vim.opt.directory = vim.fn.stdpath("cache") .. "/swap/"
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo/"
