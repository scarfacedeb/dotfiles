return {
  {
    "folke/which-key.nvim",
    config = true,
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
}
