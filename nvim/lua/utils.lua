local u = {}
local cmd = vim.cmd

-- Source: https://icyphox.sh/blog/nvim-lua/
function u.autogroup(name, autocmds)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

function u.create_command(name, repl)
  cmd('command! ' .. name .. ' ' .. repl)
end

-- Utility function for strip whitespace at the end of the line
function u.strip_lines(command)
  -- Preparation: save last search, and cursor position.
  -- local search_index = vim.fn.histnr("search")
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")

  -- Remove EOL whitespace
  cmd([[%s/\s\+$//e]])

  -- Remove EOF empty lines
  cmd([[%s/\(\n\)\+\%$//e]])

  -- Clean up: restore previous search history, and cursor position
  for i = 1, 2 do
    vim.fn.histdel("search", -1)
  end

  vim.fn.cursor(line, col)
end

u.create_command('StripLines', 'lua require("utils").strip_lines()')

return u
