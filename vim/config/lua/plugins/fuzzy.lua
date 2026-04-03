return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "vijaymarupudi/nvim-fzf",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Setup fzf and register custom helpers (see lua/fuzzy.lua)
      require('fuzzy')
    end,
  },

  "dyng/ctrlsf.vim",
}
