local u = require("utils")
local packer = require("packer")

local P = packer.startup({function()
  use "wbthomason/packer.nvim"

  -- EDITING

  use "tpope/vim-repeat" -- Utility plugin to improve .
  use "tpope/vim-surround" -- Surround targets: csb, cs", ds{, dsb
  use "tpope/vim-abolish" -- Better find-and-replace: Subvert; camelCase to snake case (crs)
  use "tpope/vim-commentary" -- Add comments: gcc
  -- use "tpope/vim-endwise" -- To add `end` blocks in ruby automatically
  -- use "rstacruz/vim-closer" -- To add brackets on Enter
  use "AndrewRadev/splitjoin.vim" -- To convert between single line and multi line: gJ, gS
  use "junegunn/vim-easy-align" -- Easy align (ga)

  use "maxbrunsfeld/vim-yankstack" -- Yank ring (<Leader>p to cycle through yank history)

  use "tpope/vim-unimpaired" -- [q, ]q, [Q, ]Q and etc keybindings

  use 'rmagatti/auto-session' -- Autosave session

  -- Text objects
  use 'kana/vim-textobj-user'  -- Dependency to create custom text objects
  use 'michaeljsmith/vim-indent-object'  -- Add indent object (e.g. vii)
  use { 'nelstrom/vim-textobj-rubyblock', ft = 'ruby' }  -- Add ruby block object
  -- use 'andyl/vim-textobj-elixir', { 'for': 'elixir' } -- Add elixir text object (e)
    -- use 'thinca/vim-textobj-function-javascript', { 'for': 'javascript' } -- Text objects for js
    -- use 'jeetsukumaran/vim-indentwise' -- Navigate by indents, [-, [+, ]-, ]+, [=, ]=

  -- Commands
  use 'tpope/vim-eunuch' -- UNIX shell helpers (mkdir, mv, cp)

  -- UI

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Syntax
  use 'MTDL9/vim-log-highlighting'
  use 'towolf/vim-helm'

  -- Fuzzy finder
  -- use {
  --   'nvim-telescope/telescope.nvim',
  --   requires = { { 'nvim-lua/plenary.nvim' } },
  --   cmd = 'Telescope'
  -- }
  -- use { 
  --   'nvim-telescope/telescope-fzf-native.nvim', 
  --   run = 'make',
  --   cmd = 'Telescope'
  -- }

  use { 
    'ibhagwan/fzf-lua',
    requires = { 
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons' 
    }
  }

  -- Key bindings
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  }

  -- use { 'LionC/nest.nvim' }
  use { 
    'connorgmeehan/nest.nvim', 
    branch = 'integrations-api'
  }

  -- Git
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }

  -- use "tpope/vim-fugitive" -- Git integration
  -- use "tpope/vim-rhubarb" -- GitHub integration, enabled GBrowse

  -- EXPERIMENTS
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use {
    "neovim/nvim-lspconfig"
  }

--   use 'hrsh7th/cmp-nvim-lsp'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/cmp-path'
--   use 'hrsh7th/cmp-cmdline'
--   use 'hrsh7th/nvim-cmp'

  use "ervandew/supertab"

  -- Outline, :AerialToggle
  use "stevearc/aerial.nvim"

  -- Gruvbox colorsheme fork with Treesitter support
  -- use { "ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"} } 
  use "rebelot/kanagawa.nvim"
  use "sainnhe/edge"
  use "Th3Whit3Wolf/one-nvim"
  -- use "morhetz/gruvbox" -- Colorscheme
  -- use 'RRethy/nvim-base16'

  use { 
    "metakirby5/codi.vim",
    cmd = 'Codi'
  }

  -- VIM DEBUG

--   use "mfussenegger/nvim-dap"
--   use "rcarriga/nvim-dap-ui"
--    -- use "suketa/nvim-dap-ruby"
--   use "puremourning/vimspector"

  -- use "tweekmonster/startuptime.vim"
  -- use "bfredl/nvim-luadev"
  -- use "rafcamlet/nvim-luapad"

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  },
}})


-- Recompile packer when plugins.lua changes
u.autogroup("packer_user_config", {
  { "BufWritePost", "plugins.lua", "source <afile> | PackerCompile" }
})

return P
