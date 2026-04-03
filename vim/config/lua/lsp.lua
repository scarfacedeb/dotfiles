-- Set capabilities globally for all LSP servers
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Ensure LSP servers are installed via Mason
require('mason-lspconfig').setup({
  ensure_installed = { 'ruby_lsp', 'ts_ls', 'eslint', 'gopls' },
})

-- LSP servers are enabled automatically by mason-lspconfig (automatic_enable = true)

-- Explicitly disable servers auto-loaded from nvim-lspconfig's runtimepath that we don't want
vim.lsp.enable('solargraph', false)
