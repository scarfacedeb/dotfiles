return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local header = {
        "",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
        "",
      }
      local center = {
        { icon = "  ", key = "f", desc = "Find file",       action = "FzfLua files" },
        { icon = "  ", key = "r", desc = "Recent files",    action = "FzfLua oldfiles" },
        { icon = "  ", key = "g", desc = "Grep",            action = "FzfLua grep" },
        { icon = "  ", key = "s", desc = "Session restore", action = "AutoSession restore" },
        { icon = "  ", key = "c", desc = "Config",          action = "FzfLua files cwd=~/.config/nvim" },
        { icon = "󰈆  ", key = "q", desc = "Quit",            action = "qa" },
      }

      local top_pad = math.max(0, math.floor((vim.o.lines - #header - #center * 2) / 2))
      local padded_header = vim.deepcopy(header)
      for _ = 1, top_pad do
        table.insert(padded_header, 1, "")
      end

      require("dashboard").setup({
        theme = "doom",
        config = {
          header = padded_header,
          center = center,
          footer = {},
        },
      })
    end,
  },

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

  { "folke/which-key.nvim", config = true },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('fuzzy') -- setup fzf + register custom helpers (see lua/fuzzy.lua)
    end,
  },

  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = false,
        auto_session_enable_last_session = false,
        auto_session_suppress_dirs = { "~" },
        auto_session_root_dir = vim.fn.stdpath('cache') .. "/sessions/",
      })
    end,
  },

  -- Colorschemes
  "rebelot/kanagawa.nvim",
  "junegunn/seoul256.vim",
}
