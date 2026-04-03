return {
  "neovim/nvim-lspconfig",

  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Set capabilities globally for all LSP servers
      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      -- Ensure these servers are installed; automatic_enable = true (default)
      -- means mason-installed servers are enabled automatically
      require('mason-lspconfig').setup({
        ensure_installed = { 'ruby_lsp', 'ts_ls', 'eslint', 'gopls' },
      })

      -- Disable servers auto-loaded from nvim-lspconfig runtimepath that we don't want
      vim.lsp.enable('solargraph', false)
    end,
  },
}
