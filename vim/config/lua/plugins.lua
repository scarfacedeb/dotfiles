-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to continue...", "ErrorMsg" },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- EDITING

  "tpope/vim-repeat",          -- Utility plugin to improve .
  "tpope/vim-surround",        -- Surround targets: csb, cs", ds{, dsb
  "tpope/vim-abolish",         -- Better find-and-replace: Subvert; camelCase to snake case (crs)
  "tpope/vim-commentary",      -- Add comments: gcc
  "AndrewRadev/splitjoin.vim", -- Convert between single line and multi line: gJ, gS
  "junegunn/vim-easy-align",   -- Easy align (ga)
  "maxbrunsfeld/vim-yankstack", -- Yank ring (<Leader>p to cycle through yank history)
  "tpope/vim-unimpaired",      -- [q, ]q, [Q, ]Q and etc keybindings
  "rmagatti/auto-session",     -- Autosave session

  -- Text objects
  "kana/vim-textobj-user",           -- Dependency to create custom text objects
  "michaeljsmith/vim-indent-object", -- Add indent object (e.g. vii)
  { "nelstrom/vim-textobj-rubyblock", ft = "ruby" }, -- Add ruby block object

  -- Commands
  "tpope/vim-eunuch", -- UNIX shell helpers (mkdir, mv, cp)

  -- UI

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Syntax

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
  },

  "MTDL9/vim-log-highlighting",
  "towolf/vim-helm",

  -- AI & Copilot

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
            accept = false, -- handled manually via Tab
          },
        },
        panel = { enabled = true },
      })
    end,
  },

  -- Completion

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
      "hrsh7th/cmp-buffer",       -- Buffer words completion
      "hrsh7th/cmp-path",         -- File path completion
      { "L3MON4D3/LuaSnip", version = "v2.*", submodules = false }, -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
    },
    config = function() require("autocomplete").setup() end,
  },

  -- Fuzzy finder

  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "vijaymarupudi/nvim-fzf",
      "nvim-tree/nvim-web-devicons",
    },
  },

  "dyng/ctrlsf.vim",

  -- Key bindings

  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end,
  },

  {
    "connorgmeehan/nest.nvim",
    branch = "integrations-api",
  },

  -- Git

  {
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  "tpope/vim-fugitive",     -- Git integration
  "tpope/vim-rhubarb",      -- GitHub integration, enables GBrowse
  "f-person/git-blame.nvim", -- Git blame inline

  -- LSP

  "neovim/nvim-lspconfig",

  -- Experiments

  {
    "inkarkat/vim-ExtractMatches",
    dependencies = "inkarkat/vim-ingo-library",
  },

  "elzr/vim-json",

  -- Outline, :AerialToggle
  "stevearc/aerial.nvim",
  "nvim-treesitter/nvim-treesitter-context",

  -- Colorschemes
  "rebelot/kanagawa.nvim",
  "Th3Whit3Wolf/one-nvim",
  "junegunn/seoul256.vim",

}, {
  ui = {
    border = "rounded",
  },
})
