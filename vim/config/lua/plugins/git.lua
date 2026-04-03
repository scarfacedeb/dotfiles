return {
  "tpope/vim-fugitive",      -- Git integration
  "tpope/vim-rhubarb",       -- GitHub integration, enables GBrowse
  "f-person/git-blame.nvim", -- Git blame inline

  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require('gitlinker').setup({ mappings = nil })
    end,
  },
}
