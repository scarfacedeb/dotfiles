local gitlinker = require('gitlinker')
local M = {}

function M.copy_line_url()
  return gitlinker.get_buf_range_url(vim.fn.mode())
end

return M
