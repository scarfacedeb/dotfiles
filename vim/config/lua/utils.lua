local u = {}
local cmd = vim.cmd

-- Autogroup helper: wraps vim.api.nvim_create_augroup/autocmd
-- Each autocmd entry: { event(s), pattern, command_string_or_callback }
-- Comma-separated event strings are split automatically.
function u.autogroup(name, autocmds)
  local group = vim.api.nvim_create_augroup(name, { clear = true })
  for _, autocmd in ipairs(autocmds) do
    local events = autocmd[1]
    if type(events) == "string" and events:find(",") then
      local event_list = {}
      for event in events:gmatch("[^,]+") do
        table.insert(event_list, vim.trim(event))
      end
      events = event_list
    end

    local opts = { group = group, pattern = autocmd[2] }
    if type(autocmd[3]) == "function" then
      opts.callback = autocmd[3]
    else
      opts.command = autocmd[3]
    end

    vim.api.nvim_create_autocmd(events, opts)
  end
end

return u
