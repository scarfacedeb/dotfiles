local wk = require('which-key')
local nest = require('nest')
local fzf = require("fzf-lua")

local u = require("utils")
local fuzzy = require("fuzzy")
local git = require("git")
local syntax = require("syntax")

local M = { filetype = {}}

function M.createMappings(ft)
  nest.applyKeymaps { { buffer = true, M.filetype[ft] } }
end

function M.defineFiletypeAutocmd(ft)
  vim.cmd("autocmd FileType " .. ft .. " :lua require('keybindings').createMappings('" .. ft .. "')")
end

nest.enable(require('nest.integrations.whichkey'))

-- Enable mouse selection in vim
-- Quick copy: select -> <C-Y>
vim.opt.mouse = 'a'

-- WhichKey delay
vim.opt.timeoutlen = 500

-- Change leader
vim.g.mapleader = ' '

-- Disable default mappings
-- vim.g.yankstack_map_keys = false

-- wk.register({
--   p = { '<Plug>yankstack_substitute_older_paste', '<- Yank ring' },
--   P = { '<Plug>yankstack_substitute_newer_paste', '-> Yank ring' },
-- }, { prefix = '<Leader>' })


nest.defaults.options = {
  noremap = false,
}

vim.cmd("nnoremap <expr> j v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'")

M.mappings = {
  -- { 'j', '<expr>v:count ? (v:count > 5 ? "m\'" . v:count : \'\') . \'j\' : \'gj\', 'Visual down' },
  -- { 'k', 'v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk', 'Visual up' },
  { 'K' , 'i<CR><Esc>', 'Break line' },
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
        { '<C-o>', fzf.git_status, 'Fzf changed files' },
        { '<Enter>', fzf.buffers, 'Fzf buffers' },
        { 'ed', ':e %%<SPACE><BACKSPACE>/', 'Edit in current dir' },
        { 'ee', fuzzy.ed_files, 'Fzf in current dir' },
        { 'ep', fuzzy.projects, 'Fzf projects' },
        { 'eo', fuzzy.projects_files, 'Fzf files in projects' },
      }},

      { name = '+Search and replace', {
        { 'sr', ':%s/', 'Search in file' },
        { 'Sr', ':%Subvert/', 'Better search' },
        { 'sh', fzf.search_history, 'Fzf search history' },
        { '/w', '/<C-r><C-w>', 'Search word under cursor' },
        { 'sw', [[:%s/\<<C-r><C-w>\>/]], 'Replace word under cursor' },
        { 'a', fzf.grep, 'Fzf grep' },
        { 'A', ':FzfLua grep continue_last_search=true', 'Fzf with last filter' },
      }},

      { 'y', name = '+Yank', {
        { 'a', 'ggVGy', 'Yank the whole file' },
        { 'y', ':let @*=@0<CR>', 'Yank from internal copy register into external register' },
      }},

      { 'g', name = '+Git', {
        { 'g', ':!fork open<CR>', 'Fork' },
        { 'y', git.copy_line_url, 'Copy remote url' },
        { 'h', fzf.git_bcommits, 'File history' },
        { 'H', ':!fork log -- %<CR>', 'Fork file history' },
      }},

      { '=', name = '+Format', {
        { 'j', ':%!python3 -m json.tool<CR>', 'Format JSON' },
      }},

      { 'v', name = 'Vim', {
        { 'e', fuzzy.vim_configs, 'Edit config' },
        { 'k', ':e ~/.config/nvim/lua/keybindings.lua<CR>', 'Edit keybindings' },
        { 'r', ':source $MYVIMRC<CR>', 'Reload config' },
        { 'R', ':source %<CR>', 'Source current file' },
        { 'd', syntax.toggle_dark_mode, 'Toggle dark mode' },

        { 'i', ':PackerInstall<CR>', 'Install packages' },
        { 'u', ':PackerSync<CR>', 'Update packages' },
        { 'c', ':PackerClean<CR>', 'Clean packages' },

        { 's', ':RestoreSession<CR>', 'Restore session' },
        { 'S', ':DeleteSession<CR>', 'Delete session' },

        { 'L', ':Luadev<CR><C-W>b:set ft=lua<CR>', 'Lua REPL' },
        { 'l', '<Plug>(Luadev-RunLine)', 'Execute line in REPL' },
        -- { 'r', '<Plug>(Luadev-Run)', 'Execute movement in REPL' },
        -- { 'w', '<Plug>(Luadev-RunWord)', 'Execute word in REPL' },

        { 'h', fzf.help_tags, 'Help tags' },
        { 'H', fzf.commands, 'Neovim commands' },
      }},
  }},
}

M.filetype = {
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

-- -- Convert ruby symbol intro string in hash
-- nmap crSh ysw'f:cw =><Esc>

-- -- Convert ruby :symbol into symbol: "" for hashes
-- nmap crsh xea: ""<Esc>

  }
}

-- Define mappings

nest.applyKeymaps(M.mappings)

for ft, _ in pairs(M.filetype) do
  M.defineFiletypeAutocmd(ft)
end

-- -- Start interactive EasyAlign in visual mode (e.g. vipga)
-- xmap ga <Plug>(EasyAlign)
-- -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- nmap ga <Plug>(EasyAlign)

-- -- Highlight word
-- nmap <Leader>h <Plug>(quickhl-manual-this)<CR>
-- xmap <Leader>h <Plug>(quickhl-manual-this)<CR>
-- nmap <Leader>H <Plug>(quickhl-manual-reset)<CR>
-- xmap <Leader>H <Plug>(quickhl-manual-reset)<CR>
-- nmap <Leader><C-H> <Plug>(quickhl-cword-toggle)


return M
