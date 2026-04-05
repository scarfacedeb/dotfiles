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
            accept = false,        -- handled via Tab in autocomplete.lua
            next = "<M-]>",        -- next suggestion
            prev = "<M-[>",        -- prev suggestion
            dismiss = "<C-]>",     -- dismiss
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*", submodules = false },
      "fang2hou/blink-copilot",
    },
    config = function()
      require("autocomplete").setup()
    end,
  },
}
