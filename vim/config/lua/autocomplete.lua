local M = {}

function M.setup()
  local blink = require("blink.cmp")

  -- Hide Copilot inline ghost text when blink menu opens; restore on close
  -- This prevents visual clutter from competing ghost text and menu suggestions
  vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuOpen",
    callback = function()
      require("copilot.suggestion").dismiss()
      vim.b.copilot_suggestion_hidden = true
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "BlinkCmpMenuClose",
    callback = function()
      vim.b.copilot_suggestion_hidden = false
    end,
  })

  blink.setup({
    -- No auto-popup: only trigger manually via Tab or <C-Space>
    completion = {
      trigger = {
        prefetch_on_insert = false,
        show_on_insert_on_trigger_character = false,
      },
      list = {
        selection = {
          preselect = false, -- don't auto-select first item (require explicit selection)
        },
      },
      menu = {
        border = "rounded",
      },
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
      ghost_text = { enabled = false }, -- avoid conflicts with Copilot inline suggestions
    },

    keymap = {
      preset = "none",

      -- Tab priority: Copilot inline accept → LuaSnip jump → blink menu next → indent
      ["<Tab>"] = {
        function(cmp)
          local ok, copilot = pcall(require, "copilot.suggestion")
          if ok and copilot.is_visible() then
            copilot.accept()
            return true
          end
        end,
        function(cmp)
          if cmp.snippet_active() then return cmp.snippet_forward() end
        end,
        "select_next",
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.snippet_backward() end
        end,
        "select_prev",
        "fallback",
      },

      ["<C-Space>"] = { "show", "fallback" },        -- manually trigger
      ["<C-e>"]     = { "cancel", "fallback" },       -- abort
      ["<CR>"]      = { "accept", "fallback" },        -- confirm only if selected
      ["<C-u>"]     = { "scroll_documentation_up", "fallback" },
      ["<C-d>"]     = { "scroll_documentation_down", "fallback" },
    },

    snippets = { preset = "luasnip" },

    sources = {
      default = { "copilot", "lsp", "snippets", "path", "buffer" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          async = true,
          score_offset = 100, -- appear above LSP completions
          opts = {
            max_completions = 3,
          },
        },
        buffer = {
          -- Only complete from visible buffers, not all open buffers
          opts = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
      },
    },
  })
end

return M
