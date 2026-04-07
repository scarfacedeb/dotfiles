local u = require('utils')

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py", "*.js", "*.rb", "*.css", "*.scss", "*.slim", "*.haml", "*.elm", "*.ex", "*.exs" },
  command = "StripLines",
})

-- Toggle relative/absolute line numbers depending on mode and focus
u.autogroup("absolute_numbers", {
  { "InsertEnter",      "*", function() vim.opt_local.relativenumber = false end },
  { "InsertLeave",      "*", function() vim.opt_local.relativenumber = true end },
  { "WinEnter,FocusGained", "*", function()
    if vim.bo.filetype == "dashboard" then return end
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end },
  { "WinLeave,FocusLost",   "*", function()
    if vim.bo.filetype == "dashboard" then return end
    vim.opt_local.number = true
    vim.opt_local.relativenumber = false
  end },
})

-- No line numbers in dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
