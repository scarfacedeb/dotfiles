
-- Strip whitespace at the end of the lines
local strip_line_exts = {
  "*.py", "*.js", "*.rb", "*.css", "*.scss", 
  "*.slim", "*.haml", "*.elm", 
  "*.ex", "*.exs"
}

vim.cmd("autocmd BufWritePre " .. table.concat(strip_line_exts, ",") .. " :StripLines")
