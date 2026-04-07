return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec")({
            -- Override default rspec_cmd to avoid deprecated vim.tbl_flatten
            rspec_cmd = function()
              return { "bundle", "exec", "rspec" }
            end,
          }),
        },
      })
    end,
  },
}
