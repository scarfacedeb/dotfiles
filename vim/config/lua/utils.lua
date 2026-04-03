local u = {}
local cmd = vim.cmd

-- Modern autogroup using vim.api (backwards compatible wrapper)
-- Supports both old string commands and new callback functions
function u.autogroup(name, autocmds)
  local group = vim.api.nvim_create_augroup(name, { clear = true })
  for _, autocmd in ipairs(autocmds) do
    -- autocmd format: { event, pattern, command/callback }
    -- Handle comma-separated events by splitting them into a table
    local events = autocmd[1]
    if type(events) == "string" and events:find(",") then
      local event_list = {}
      for event in events:gmatch("[^,]+") do
        table.insert(event_list, vim.trim(event))
      end
      events = event_list
    end

    -- Support both string commands and callback functions
    local opts = {
      group = group,
      pattern = autocmd[2],
    }

    if type(autocmd[3]) == "function" then
      opts.callback = autocmd[3]
    else
      opts.command = autocmd[3]
    end

    vim.api.nvim_create_autocmd(events, opts)
  end
end

-- Modern command creation using vim.api
function u.create_command(name, repl)
  vim.api.nvim_create_user_command(name, repl, {})
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

function u.toggle_clipboard()
  if vim.opt.clipboard == 'unnamedplus' then
    vim.opt.clipboard = ''
  else
    vim.opt.clipboard = 'unnamedplus'
  end
end

u.create_command('ToggleClipboard', 'lua require("utils").toggle_clipboard()')

return u
