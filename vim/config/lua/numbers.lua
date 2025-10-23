local numbers = {}
local u = require("utils")
local map = vim.api.nvim_set_keymap

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5

-- Toggle relative/absolute numbers

u.autogroup("absolute_numbers", {
  -- Use absolute numbers in insert mode
  { "InsertEnter", "*", function() vim.opt_local.relativenumber = false end },
  { "InsertLeave", "*", function() vim.opt_local.relativenumber = true end },

  -- Use absolute numbers when focus is lost
  { "WinEnter,FocusGained", "*", function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end },
  { "WinLeave,FocusLost", "*", function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end }
})


function numbers.toggle()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

u.create_command('NumbersToggle', 'lua require("numbers").toggle()')

map('n', '<Leader>tn', ':NumbersToggle<CR>', {})

return numbers
