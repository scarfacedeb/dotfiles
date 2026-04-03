-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/a.volozhanin/.cache/nvim/packer_hererocks/2.1.1774896198/share/lua/5.1/?.lua;/Users/a.volozhanin/.cache/nvim/packer_hererocks/2.1.1774896198/share/lua/5.1/?/init.lua;/Users/a.volozhanin/.cache/nvim/packer_hererocks/2.1.1774896198/lib/luarocks/rocks-5.1/?.lua;/Users/a.volozhanin/.cache/nvim/packer_hererocks/2.1.1774896198/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/a.volozhanin/.cache/nvim/packer_hererocks/2.1.1774896198/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot.lua"] = {
    config = { "\27LJ\2\nÃ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\npanel\1\0\1\fenabled\2\15suggestion\1\0\2\npanel\0\15suggestion\0\vkeymap\1\0\1\vaccept\1\1\0\4\rdebounce\3K\17auto_trigger\2\fenabled\2\vkeymap\0\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitlinker.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["kitty-scrollback.nvim"] = {
    commands = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21kitty-scrollback\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/opt/kitty-scrollback.nvim",
    url = "https://github.com/mikesmithgh/kitty-scrollback.nvim"
  },
  ["nest.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nest.nvim",
    url = "https://github.com/connorgmeehan/nest.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expand¢\2\0\1\4\3\t\0'6\1\0\0'\3\1\0B\1\2\0029\2\2\1B\2\1\2\15\0\2\0X\3\3€9\2\3\1B\2\1\1X\2\28€-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\4€-\2\0\0009\2\5\2B\2\1\1X\2\19€-\2\1\0009\2\6\2B\2\1\2\15\0\2\0X\3\4€-\2\1\0009\2\a\2B\2\1\1X\2\n€-\2\2\0B\2\1\2\15\0\2\0X\3\4€-\2\0\0009\2\b\2B\2\1\1X\2\2€\18\2\0\0B\2\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisible\vaccept\15is_visible\23copilot.suggestion\frequire–\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\21locally_jumpable\21select_prev_item\fvisible“\1\0\0\t\0\6\0\0214\0\0\0006\1\0\0006\3\1\0009\3\2\0039\3\3\3B\3\1\0A\1\0\4X\4\a€6\6\1\0009\6\2\0069\6\4\6\18\b\5\0B\6\2\2+\a\2\0<\a\6\0E\4\3\3R\4÷\1276\1\1\0009\1\5\1\18\3\0\0D\1\2\0\rtbl_keys\21nvim_win_get_buf\19nvim_list_wins\bapi\bvim\vipairsj\0\2\4\0\4\0\0065\2\1\0009\3\2\0009\3\3\0038\2\3\2=\2\0\1L\1\2\0\tname\vsource\1\0\4\tpath\v[Path]\vbuffer\n[Buf]\rnvim_lsp\n[LSP]\fluasnip\v[Snip]\tmenuÌ\b\1\0\r\0007\0`6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\6\0005\6\5\0=\6\a\0055\6\t\0003\a\b\0=\a\n\6=\6\v\0055\6\15\0009\a\f\0009\a\r\a9\a\14\aB\a\1\2=\a\a\0069\a\f\0009\a\r\a9\a\14\aB\a\1\2=\a\16\6=\6\r\0059\6\17\0009\6\18\0069\6\19\0065\b\22\0009\t\17\0003\v\20\0005\f\21\0B\t\3\2=\t\23\b9\t\17\0003\v\24\0005\f\25\0B\t\3\2=\t\26\b9\t\17\0009\t\27\tB\t\1\2=\t\28\b9\t\17\0009\t\29\tB\t\1\2=\t\30\b9\t\17\0009\t\31\t5\v\"\0009\f \0009\f!\f=\f#\vB\t\2\2=\t$\b9\t\17\0009\t%\t)\vüÿB\t\2\2=\t&\b9\t\17\0009\t%\t)\v\4\0B\t\2\2=\t'\bB\6\2\2=\6\17\0059\6\f\0009\6(\0064\b\4\0005\t)\0>\t\1\b5\t*\0>\t\2\b5\t+\0>\t\3\b4\t\3\0005\n,\0005\v.\0003\f-\0=\f/\v=\v0\n>\n\1\tB\6\3\2=\6(\0055\0062\0003\a1\0=\a3\6=\0064\0055\0065\0=\0066\5B\3\2\0012\0\0€K\0\1\0\17experimental\1\0\1\15ghost_text\1\15formatting\vformat\1\0\1\vformat\0\0\voption\15get_bufnrs\1\0\1\15get_bufnrs\0\0\1\0\3\voption\0\rpriority\3ú\1\tname\vbuffer\1\0\2\tname\tpath\rpriority\3ô\3\1\0\2\tname\fluasnip\rpriority\3î\5\1\0\2\tname\rnvim_lsp\rpriority\3è\a\fsources\n<C-d>\n<C-u>\16scroll_docs\t<CR>\rbehavior\1\0\2\vselect\1\rbehavior\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\a\n<Tab>\0\n<C-e>\0\14<C-Space>\0\f<S-Tab>\0\n<C-u>\0\n<C-d>\0\t<CR>\0\1\3\0\0\6i\6s\0\vinsert\vpreset\fmapping\18documentation\1\0\2\15completion\0\18documentation\0\rbordered\vwindow\vconfig\fsnippet\vexpand\1\0\1\vexpand\0\0\15completion\1\0\a\vwindow\0\15formatting\0\fsnippet\0\17experimental\0\fmapping\0\15completion\0\fsources\0\1\0\2\16completeopt\26menu,menuone,noinsert\17autocomplete\1\nsetup\0\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-fzf",
    url = "https://github.com/vijaymarupudi/nvim-fzf"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/one-nvim",
    url = "https://github.com/Th3Whit3Wolf/one-nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["vim-ExtractMatches"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-ExtractMatches",
    url = "https://github.com/inkarkat/vim-ExtractMatches"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-helm"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-helm",
    url = "https://github.com/towolf/vim-helm"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-indent-object",
    url = "https://github.com/michaeljsmith/vim-indent-object"
  },
  ["vim-ingo-library"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-ingo-library",
    url = "https://github.com/inkarkat/vim-ingo-library"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-log-highlighting"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-log-highlighting",
    url = "https://github.com/MTDL9/vim-log-highlighting"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-rubyblock"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/opt/vim-textobj-rubyblock",
    url = "https://github.com/nelstrom/vim-textobj-rubyblock"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-yankstack"] = {
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/vim-yankstack",
    url = "https://github.com/maxbrunsfeld/vim-yankstack"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/a.volozhanin/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nÐ\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20€6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2€+\2\1\0X\3\1€+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expand¢\2\0\1\4\3\t\0'6\1\0\0'\3\1\0B\1\2\0029\2\2\1B\2\1\2\15\0\2\0X\3\3€9\2\3\1B\2\1\1X\2\28€-\2\0\0009\2\4\2B\2\1\2\15\0\2\0X\3\4€-\2\0\0009\2\5\2B\2\1\1X\2\19€-\2\1\0009\2\6\2B\2\1\2\15\0\2\0X\3\4€-\2\1\0009\2\a\2B\2\1\1X\2\n€-\2\2\0B\2\1\2\15\0\2\0X\3\4€-\2\0\0009\2\b\2B\2\1\1X\2\2€\18\2\0\0B\2\1\1K\0\1\0\0À\1À\2À\rcomplete\19expand_or_jump\31expand_or_locally_jumpable\21select_next_item\fvisible\vaccept\15is_visible\23copilot.suggestion\frequire–\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\21locally_jumpable\21select_prev_item\fvisible“\1\0\0\t\0\6\0\0214\0\0\0006\1\0\0006\3\1\0009\3\2\0039\3\3\3B\3\1\0A\1\0\4X\4\a€6\6\1\0009\6\2\0069\6\4\6\18\b\5\0B\6\2\2+\a\2\0<\a\6\0E\4\3\3R\4÷\1276\1\1\0009\1\5\1\18\3\0\0D\1\2\0\rtbl_keys\21nvim_win_get_buf\19nvim_list_wins\bapi\bvim\vipairsj\0\2\4\0\4\0\0065\2\1\0009\3\2\0009\3\3\0038\2\3\2=\2\0\1L\1\2\0\tname\vsource\1\0\4\tpath\v[Path]\vbuffer\n[Buf]\rnvim_lsp\n[LSP]\fluasnip\v[Snip]\tmenuÌ\b\1\0\r\0007\0`6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\6\0005\6\5\0=\6\a\0055\6\t\0003\a\b\0=\a\n\6=\6\v\0055\6\15\0009\a\f\0009\a\r\a9\a\14\aB\a\1\2=\a\a\0069\a\f\0009\a\r\a9\a\14\aB\a\1\2=\a\16\6=\6\r\0059\6\17\0009\6\18\0069\6\19\0065\b\22\0009\t\17\0003\v\20\0005\f\21\0B\t\3\2=\t\23\b9\t\17\0003\v\24\0005\f\25\0B\t\3\2=\t\26\b9\t\17\0009\t\27\tB\t\1\2=\t\28\b9\t\17\0009\t\29\tB\t\1\2=\t\30\b9\t\17\0009\t\31\t5\v\"\0009\f \0009\f!\f=\f#\vB\t\2\2=\t$\b9\t\17\0009\t%\t)\vüÿB\t\2\2=\t&\b9\t\17\0009\t%\t)\v\4\0B\t\2\2=\t'\bB\6\2\2=\6\17\0059\6\f\0009\6(\0064\b\4\0005\t)\0>\t\1\b5\t*\0>\t\2\b5\t+\0>\t\3\b4\t\3\0005\n,\0005\v.\0003\f-\0=\f/\v=\v0\n>\n\1\tB\6\3\2=\6(\0055\0062\0003\a1\0=\a3\6=\0064\0055\0065\0=\0066\5B\3\2\0012\0\0€K\0\1\0\17experimental\1\0\1\15ghost_text\1\15formatting\vformat\1\0\1\vformat\0\0\voption\15get_bufnrs\1\0\1\15get_bufnrs\0\0\1\0\3\voption\0\rpriority\3ú\1\tname\vbuffer\1\0\2\tname\tpath\rpriority\3ô\3\1\0\2\tname\fluasnip\rpriority\3î\5\1\0\2\tname\rnvim_lsp\rpriority\3è\a\fsources\n<C-d>\n<C-u>\16scroll_docs\t<CR>\rbehavior\1\0\2\vselect\1\rbehavior\0\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\a\n<Tab>\0\n<C-e>\0\14<C-Space>\0\f<S-Tab>\0\n<C-u>\0\n<C-d>\0\t<CR>\0\1\3\0\0\6i\6s\0\vinsert\vpreset\fmapping\18documentation\1\0\2\15completion\0\18documentation\0\rbordered\vwindow\vconfig\fsnippet\vexpand\1\0\1\vexpand\0\0\15completion\1\0\a\vwindow\0\15formatting\0\fsnippet\0\17experimental\0\fmapping\0\15completion\0\fsources\0\1\0\2\16completeopt\26menu,menuone,noinsert\17autocomplete\1\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'KittyScrollbackGenerateKittens', function(cmdargs)
          require('packer.load')({'kitty-scrollback.nvim'}, { cmd = 'KittyScrollbackGenerateKittens', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'kitty-scrollback.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('KittyScrollbackGenerateKittens ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'KittyScrollbackCheckHealth', function(cmdargs)
          require('packer.load')({'kitty-scrollback.nvim'}, { cmd = 'KittyScrollbackCheckHealth', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'kitty-scrollback.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('KittyScrollbackCheckHealth ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-textobj-rubyblock'}, { ft = "ruby" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au User KittyScrollbackLaunch ++once lua require("packer.load")({'kitty-scrollback.nvim'}, { event = "User KittyScrollbackLaunch" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
