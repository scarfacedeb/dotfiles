local numbers = {}
local u = require("utils")
local map = vim.api.nvim_set_keymap

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5

-- Toggle relative/absolute numbers

u.autogroup("absolute_numbers", {
  -- Use absolute numbers in insert mode
  { "InsertEnter", "*", ":set norelativenumber" },
  { "InsertLeave", "*", ":set relativenumber" },

  -- Use absolute numbers when focus is lost
  { "WinEnter,FocusGained", "*", ":setlocal number relativenumber" },
  { "WinLeave,FocusLost",   "*", ":setlocal number norelativenumber" }
})


function numbers.toggle()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

u.create_command('NumbersToggle', 'lua require("numbers").toggle()')

map('n', '<Leader>tn', ':NumbersToggle<CR>', {})

return numbers
