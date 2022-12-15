local aerial = require("aerial")
local tree = require("nvim-tree")

aerial.setup({
  backends = { "treesitter", "markdown" }, -- disable lsp
  default_bindings = true,
  default_direction = "prefer_left",
  max_width = { 50, 0.2 },
})

tree.setup({
  view = {
    adaptive_size = true,
    float = {
      enable = true,
      -- quit_on_focus_loss = false,
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
