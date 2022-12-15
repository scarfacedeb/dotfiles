local gitlinker = require('gitlinker')
local M = {}

gitlinker.setup({
  mappings = nil
})

function M.copy_line_url(_)
  return gitlinker.get_buf_range_url(vim.fn.mode())
end

return M
