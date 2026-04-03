local nest = require('nest')
local fzf = require("fzf-lua")

local fuzzy = require("fuzzy")
local git = require("git")
local syntax = require("syntax")

-- Cmd-line abbreviations
vim.cmd("cabbr <expr> %% expand('%:p:h')") -- %% → current file dir
vim.cmd("cabbr <expr> %$ expand('%:t')")   -- %$ → current filename

-- Smarter movement: move by display lines when no count is given, otherwise by actual lines. If count > 5, set a mark before moving.
vim.cmd("nnoremap <expr> j v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'")


nest.defaults.options = { noremap = false }

nest.enable(require('nest.integrations.whichkey'))

nest.applyKeymaps({
  -- { 'j', '<expr>...', 'Visual down' },
  { 'K', 'i<CR><Esc>', 'Break line' },
  { 'Y', 'y$', 'Make Y behave like other capitals' },

  { mode = 'i', {
    { 'jj', '<ESC>', 'Exit Insert mode' },
  }},

  { mode = 'nvi', {
    { '<C-y>', '"*y', 'External copy' },
    { '<C-p>', '"*p', 'External paste' },
  }},

  { '<C-t>', name = '+Tabs', {
    { 'n', ':tabnext<CR>', '' },
    { 'p', ':tabprev<CR>', '' },
    { 'c', ':tabnew<CR>', '' },
    { 'd', ':tabclose<CR>', '' },
    { '1', '1gt', '' },
    { '2', '2gt', '' },
    { '3', '3gt', '' },
    { '4', '4gt', '' },
    { '5', '5gt', '' },
    { '6', '6gt', '' },
    { '7', '7gt', '' },
    { '8', '8gt', '' },
    { '!', '<C-w>T', '' },
    { 'z', '<C-w>o', '' },
  }},

  { '<Leader>', {
    { 'o', 'o<Esc>', 'New line below' },
    { 'O', 'O<Esc>', 'New line above' },
    { 'm', "'", "Go to Mark (')" },

    { 'p', '<Plug>yankstack_substitute_older_paste', '<- Yank ring' },
    { 'P', '<Plug>yankstack_substitute_newer_paste', '-> Yank ring' },

    { name = '+Buffers', {
      { '<Leader>', ':b!#<CR>', 'Switch to alternative buffer' },
    }},

    { name = '+Tree', {
      { 'nt', ':NvimTreeToggle<CR>', 'Toggle file tree' },
      { 'nf', ':NvimTreeFindFile<CR>', 'Reveal file in tree' },
    }},

    { name = '+Files', {
      { 'o', fzf.files, 'Fzf files' },
      { 'ro', fuzzy.gems, 'Gems' },
      { 'ra', fuzzy.gems_grep, 'Gems Grep' },
      { '<C-o>', fzf.git_status, 'Fzf git stage files' },
      { '<Enter>', fzf.buffers, 'Fzf buffers' },
      { 'ed', ':e %%<SPACE><BACKSPACE>/', 'Edit in current dir' },
      { 'ee', fuzzy.ed_files, 'Fzf in current dir' },
      { 'ep', fuzzy.projects, 'Fzf projects' },
      { 'eo', fuzzy.projects_files, 'Fzf files in projects' },
      { 'ea', fuzzy.projects_grep, 'Grep files in projects' },
    }},

    { name = '+Search and replace', {
      { 'sr', ':%s/', 'Search in file' },
      { 'Sr', ':%Subvert/', 'Better search' },
      { 'sh', fzf.search_history, 'Fzf search history' },
      { '/w', '/<C-r><C-w>', 'Search word under cursor' },
      { 'sw', [[:%s/\<<C-r><C-w>\>/]], 'Replace word under cursor' },
      { 'a', fzf.grep, 'Fzf grep' },
      { 'A', ':FzfLua grep <C-r><C-w><CR>', 'Fzf grep word under cursor' },
    }},

    { 'f', name = '+File', {
      { 'd', ':Unlink<CR>', 'Delete the file' },
    }},

    { 'y', name = '+Yank', {
      { 'a', 'ggVGy', 'Yank the whole file' },
      { 'y', ':let @*=@0<CR>', 'Yank from internal copy register into external register' },
    }},

    { 'g', name = '+Git', {
      { 'g', ':!fork open<CR>', 'Fork' },
      { 'y', git.copy_line_url, 'Copy remote url' },
      { 'h', fzf.git_bcommits, 'File history' },
      { 'b', ':Git blame -w -C -C -C<CR>', 'Git blame' },
      { 'B', ':Git blame<CR>', 'Git blame fast' },
      { 'H', ':!fork log -- %<CR>', 'Fork file history' },
      { 'r', ':GBrowse<CR>', 'GBrowse: open file in remote' },
    }},

    { '=', name = '+Format', {
      { 'j', ':%!python3 -m json.tool<CR>', 'Format JSON' },
    }},

    { 'l', name = '+LSP', {
      { 'r', ':lsp restart<CR>', 'Restart LSP' },
      { 's', ':lsp stop<CR>', 'Stop LSP' },
      { 'm', ':Mason<CR>', 'Mason' },
      { 'h', ':checkhealth lsp<CR>', 'LSP health' },
    }},

    { 't', name = '+Toggle', {
      { 'n', ':NumbersToggle<CR>', 'Toggle relative numbers' },
    }},

    { 'v', name = 'Vim', {
      { 'e', fuzzy.vim_configs, 'Edit config' },
      { 'k', ':e ~/.config/nvim/lua/config/keymaps.lua<CR>', 'Edit keybindings' },
      { 'r', ':source $MYVIMRC<CR>', 'Reload config' },
      { 'R', ':source %<CR>', 'Source current file' },
      { 'd', syntax.toggle_dark_mode, 'Toggle dark mode' },

      { 'i', ':Lazy install<CR>', 'Install packages' },
      { 'u', ':Lazy sync<CR>', 'Update packages' },
      { 'c', ':Lazy clean<CR>', 'Clean packages' },

      { 's', ':RestoreSession<CR>', 'Restore session' },
      { 'S', ':DeleteSession<CR>', 'Delete session' },

      { 'L', ':Luadev<CR><C-W>b:set ft=lua<CR>', 'Lua REPL' },
      { 'l', '<Plug>(Luadev-RunLine)', 'Execute line in REPL' },

      { 'h', fzf.help_tags, 'Help tags' },
      { 'H', fzf.commands, 'Neovim commands' },
    }},
  }},
})

-- Apply filetype-specific mappings
local filetype = {
  lua = {
    { mode = 'i', {
      { '<Tab>', '<Plug>(Luadev-Complete)', 'Autocomplete table field' },
    }},
  },
  ruby = {
    { prefix = 'cr', name = 'Change ruby', {
      { 'hs', 'ds"ea:<Esc>f=dW', 'Hash#symbolize_keys' },
      { 'h=', [[:%s/:\([^ ]*\)\(\s*\)=>/\1:/<CR>]], 'Old => new hash' },
      { 'tl', 'ysiwba:<Esc>Ilet<Esc>f=dwys${', 'Rspec var = to let()' },
      { 'ss', "ds'i:<Esc>", 'String to Symbol' },
      { 'Ss', "ysw'", 'Symbol to string' },
    }},
  },
}

for ft in pairs(filetype) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function() 
      nest.applyKeymaps { { buffer = true, filetype[ft] } }
    end,
  })
end

-- LSP keybindings — applied lazily when an LSP client attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_keybindings', { clear = true }),
  callback = function(args)
    nest.applyKeymaps({
      { buffer = args.buf, options = { noremap = true, silent = true }, {

        -- Navigation
        { 'gD', vim.lsp.buf.declaration, 'Go to declaration' },
        { 'gd', vim.lsp.buf.definition, 'Go to definition (also: <C-]> via tagfunc)' },
        -- { 'K', vim.lsp.buf.hover, 'Hover' },                           -- default in 0.12
        -- { 'gi', vim.lsp.buf.implementation, 'Implementation' },        -- use gri (default)
        -- { 'gr', vim.lsp.buf.references, 'References' },                -- use grr (default)
        -- { '<Space>rn', vim.lsp.buf.rename, 'Rename' },                 -- use grn (default)
        -- { '<Space>ca', vim.lsp.buf.code_action, 'Code action' },       -- use gra (default)
        -- { '<Space>D', vim.lsp.buf.type_definition, 'Type definition' },-- use grt (default)

        -- Actions
        { '<Space>=f', function() vim.lsp.buf.format({ async = true }) end, 'Format document' },

        -- Diagnostics
        { '<Space>d', vim.diagnostic.open_float, 'Diagnostic float (also: <C-W>d)' },
        { '<Space>q', vim.diagnostic.setloclist, 'Diagnostics to loclist' },
        -- { '[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Prev diagnostic' }, -- default in 0.12
        -- { ']d', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic' },  -- default in 0.12
      }},
    })
  end,
})
