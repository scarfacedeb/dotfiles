vim.api.nvim_create_user_command('NumbersToggle', function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, {})
