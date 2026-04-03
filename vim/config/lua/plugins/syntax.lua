return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 1,
        multiline_threshold = 1,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = '#',
      })
    end,
  },

  "towolf/vim-helm",
}
