-- Leader must be set before lazy.nvim loads (lazy.nvim best practice)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require('config.options')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to continue...", "ErrorMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Auto-imports lua/plugins/*.lua — each file returns plugin spec(s)
require("lazy").setup("plugins", { ui = { border = "rounded" } })

require('config.autocmds')
require('config.keymaps')

-- Cmd-line abbreviations
vim.cmd("cabbr <expr> %% expand('%:p:h')") -- %% → current file dir
vim.cmd("cabbr <expr> %$ expand('%:t')")   -- %$ → current filename

-- Inspect utility (available in command line as :lua inspect(...))
function _G.inspect(obj)
  local output = vim.inspect(obj)
  print(output)
  return output
end
