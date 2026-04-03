local M = {}

function M.setup()
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  -- Helper: Check if cursor has text before it (not whitespace/start of line)
  -- Used to decide whether to trigger completion on Tab
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
      vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    completion = {
      -- autocomplete = false: Don't auto-popup while typing, only on Tab/Ctrl-Space
      -- This prevents annoying popups and conflicts with Copilot
      autocomplete = false,

      -- completeopt controls completion behavior:
      -- - menu: show popup menu
      -- - menuone: show menu even for single match
      -- - noinsert: don't auto-insert first match (wait for explicit selection)
      completeopt = "menu,menuone,noinsert",
    },
    snippet = {
      -- Required: Tell cmp how to expand snippets (using LuaSnip)
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      -- Add borders to completion and documentation windows for better visibility
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      -- Tab: Smart tab behavior with priority chain
      -- 1. If Copilot suggestion visible -> accept it
      -- 2. If completion menu visible -> move to next item
      -- 3. If in snippet with jump points -> jump to next point
      -- 4. If typing word -> trigger completion
      -- 5. Otherwise -> normal Tab behavior (indent)
      ["<Tab>"] = cmp.mapping(function(fallback)
        local copilot = require("copilot.suggestion")
        if copilot.is_visible() then
          copilot.accept()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          -- expand_or_locally_jumpable: only jump within current snippet,
          -- not to unrelated snippets in the buffer
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
        elseif luasnip.locally_jumpable(-1) then
          -- locally_jumpable: only jump within current snippet
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      -- Ctrl-Space: Manually trigger completion when Tab doesn't
      ["<C-Space>"] = cmp.mapping.complete(),

      ["<C-e>"] = cmp.mapping.abort(),

      -- select = false: Only confirm if explicitly selected (prevents accidents)
      -- behavior = Replace: Replace word under cursor instead of inserting
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),

      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),

    -- Completion sources with priorities (higher = shown first)
    -- First group: Primary sources (LSP, snippets, paths)
    -- Second group: Fallback sources (buffer words)
    sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 }, -- LSP completions (highest priority)
      { name = "luasnip",  priority = 750 },  -- Snippet completions
      { name = "path",     priority = 500 },  -- File path completions
    }, {
      {
        name = "buffer",
        priority = 250, -- Buffer words (lowest priority)
        option = {
          -- Only complete from visible buffers (not all 50 open buffers)
          -- This keeps completions relevant and fast
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
    }),
    formatting = {
      -- Add labels to show where each completion came from
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip  = "[Snip]",
          buffer   = "[Buf]",
          path     = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    experimental = {
      -- ghost_text shows completion as virtual text at cursor
      -- Disabled to avoid visual conflicts with Copilot's inline suggestions
      ghost_text = false,
    },
  })
end

return M
