return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = false, -- handled manually via Tab in autocomplete
          },
        },
        panel = { enabled = true },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      { "L3MON4D3/LuaSnip", version = "v2.*", submodules = false },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("autocomplete").setup()
    end,
  },
}
