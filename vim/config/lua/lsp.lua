local lsp_util = require('lspconfig.util')

-- Setup cmp capabilities for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  print('Attached LSP: ' .. client.name)

  -- Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>=f', function() vim.lsp.buf.format { async = true } end, bufopts)

  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

-- Configure LSP servers using vim.lsp.config
-- socket support: https://github.com/neovim/neovim/issues/11911
vim.lsp.config.solargraph = {
  cmd = { 'solargraph', 'stdio' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git', '.lsp_ruby_root' },
  settings = {
    solargraph = {
      diagnostics = true,
      -- logLevel = 'debug',
      -- useBundler = true,
    }
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

vim.lsp.config.ts_ls = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
}

vim.lsp.config.eslint = {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue', 'svelte', 'astro' },
  root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json', 'package.json' },
  capabilities = capabilities,
  on_attach = on_attach,
}

vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Enable LSP servers
local servers = { 'solargraph', 'ts_ls', 'eslint', 'gopls' }

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
