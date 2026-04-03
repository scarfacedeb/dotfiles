vim.api.nvim_create_user_command('NumbersToggle', function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, {})

vim.api.nvim_create_user_command('StripLines', function()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")

  vim.cmd([[%s/\s\+$//e]])        -- remove EOL whitespace
  vim.cmd([[%s/\(\n\)\+\%$//e]]) -- remove EOF empty lines

  -- restore search history and cursor
  for _ = 1, 2 do vim.fn.histdel("search", -1) end
  vim.fn.cursor(line, col)
end, {})

vim.api.nvim_create_user_command('ToggleClipboard', function()
  if vim.opt.clipboard:get() == 'unnamedplus' then
    vim.opt.clipboard = ''
  else
    vim.opt.clipboard = 'unnamedplus'
  end
end, {})
