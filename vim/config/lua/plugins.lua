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
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use 'MTDL9/vim-log-highlighting'
  use 'towolf/vim-helm'

  --
  -- AI & LLMs --
  --
  -- use 'github/copilot.vim'

  use {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { 
          enabled = true, 
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = false,  -- we'll handle it manually
          }

        },
        panel = { enabled = true },
      })
    end,
  }

  -- use {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   requires = {
  --     { "zbirenbaum/copilot.lua" },
  --     { "nvim-lua/plenary.nvim" },
  --   },
  --   config = function()
  --     require("CopilotChat").setup({
  --       -- optional settings
  --     })

  --     -- Optional: quick chat keymap
  --     vim.keymap.set("n", "<leader>cc", function()
  --       require("CopilotChat").ask("Explain this code", {
  --         selection = require("CopilotChat.select").visual,
  --       })
  --     end, { desc = "Copilot Chat: Explain code" })
  --   end,
  -- }

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and
          vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        completion = {
          autocomplete = false,  -- ✅ disables auto-popup while typing
        },
        preselect = cmp.PreselectMode.Item, -- ✅ preselect first item
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
          -- Smart Tab behavior
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            local copilot = require("copilot.suggestion")
            if copilot.is_visible() then
              copilot.accept()
            elseif cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  })
  -- use {
  --   "olimorris/codecompanion.nvim",
  --   config = function()
  --     require("codecompanion").setup()
  --   end,
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   }
  -- }


  -- AVANTE
  -- Required plugins
  -- use 'nvim-treesitter/nvim-treesitter'
  -- use 'stevearc/dressing.nvim'
  -- use 'nvim-lua/plenary.nvim'
  -- use 'MunifTanjim/nui.nvim'
  -- use 'MeanderingProgrammer/render-markdown.nvim'

  -- Optional dependencies
  -- use 'hrsh7th/nvim-cmp'
  -- use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  -- use 'HakonHarnes/img-clip.nvim' -- embed images into markdown
  -- use 'zbirenbaum/copilot.lua' -- copilot rewritten in lua

  -- Avante.nvim with build process
  -- use {
  --   'yetone/avante.nvim',
  --   branch = 'main',
  --   run = 'make',
  --   config = function()
  --     require('avante').setup({
  --       --- @alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  --       provider = "copilot",
  --     })
  --   end
  -- }

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
      'nvim-tree/nvim-web-devicons' 
    }
  }

  use 'dyng/ctrlsf.vim'

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

  use "tpope/vim-fugitive" -- Git integration
  use "tpope/vim-rhubarb" -- GitHub integration, enabled GBrowse
  use "f-person/git-blame.nvim" -- Git blame inline

  -- EXPERIMENTS

  use { 
    "inkarkat/vim-ExtractMatches", 
    requires = "inkarkat/vim-ingo-library",
  }

  use {
    "neovim/nvim-lspconfig"
  }

--   use 'hrsh7th/cmp-nvim-lsp'
--   use 'hrsh7th/cmp-buffer'
--   use 'hrsh7th/cmp-path'
--   use 'hrsh7th/cmp-cmdline'
--   use 'hrsh7th/nvim-cmp'

  use "elzr/vim-json"

  -- use "ervandew/supertab"

  -- Outline, :AerialToggle
  use "stevearc/aerial.nvim"
  use "nvim-treesitter/nvim-treesitter-context"


  -- Gruvbox colorsheme fork with Treesitter support
  -- use { "ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"} } 
  use "rebelot/kanagawa.nvim"
  use "Th3Whit3Wolf/one-nvim"
  use "junegunn/seoul256.vim"
  -- use "morhetz/gruvbox" -- Colorscheme
  -- use 'RRethy/nvim-base16'

--   use { 
--     "metakirby5/codi.vim",
--     cmd = 'Codi'
--   }

  -- VIM DEBUG

  -- use "mfussenegger/nvim-dap"
  -- use "rcarriga/nvim-dap-ui"
  -- use "suketa/nvim-dap-ruby"
  -- use "theHamsta/nvim-dap-virtual-text"
  -- -- use "puremourning/vimspector"

  -- use "tweekmonster/startuptime.vim"
  -- use "bfredl/nvim-luadev"
  -- use "rafcamlet/nvim-luapad"

    use {
      'mikesmithgh/kitty-scrollback.nvim',
      disable = false,
      opt = true,
      cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
      event = { 'User KittyScrollbackLaunch' },
      -- tag = '*', -- latest stable version, may have breaking changes if major version changed
      -- tag = 'v2.0.0', -- pin specific tag
      config = function()
        require('kitty-scrollback').setup()
      end,
    }

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
