return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          adaptive_size = true,
          float = {
            enable = false,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 100,
              height = 50,
              row = 1,
              col = 1,
            },
          },
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
        },
        live_filter = {
          always_show_folders = false,
        },
      })
    end,
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        backends = { "treesitter", "markdown" },
        default_bindings = true,
        default_direction = "prefer_left",
        max_width = { 50, 0.2 },
      })
    end,
  },

  -- Colorschemes
  "rebelot/kanagawa.nvim",
  "junegunn/seoul256.vim",
}
