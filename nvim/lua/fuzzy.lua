-- local tl = require('telescope')

-- tl.load_extension('fzf')

local fzf = require('fzf-lua')
local fzf_path = require('fzf-lua.path')
local fzf_config = require('fzf-lua.config')

local M = { actions = {} }

function M.actions.dir_tcd(selected)
  print(selected[1])
  path = '~/projects/' .. selected[1]
  print(path)
  return vim.cmd('tcd ' .. path)
end

function M.git_or_files(opts)
  if not opts then opts = {} end

  if fzf_path.is_git_repo(opts.cwd, true) then
    return fzf.git_files(opts) 
  else 
    return fzf.files(opts)
  end
end

function M.ls(cwd, opts)
  if not opts then opts = {} end

  return fzf.files({ 
    cwd = cwd,
    fd_opts = '-d 1',
    unpack(opts)
  })
end

function M.projects(opts)
  if not opts then opts = {} end

  return fzf.files({
    cwd = '~/projects',
    fd_opts = '-d 1',
    file_icons = false,
    actions = {
      ['default'] = { M.actions.dir_tcd },
    },
    unpack(opts)
  })
end

function M.projects_files(opts)
  if not opts then opts = {} end

  return fzf.files({
    cwd = '~/projects',
    unpack(opts)
  })
end

function M.ed_files(opts)
  if not opts then opts = {} end

  return fzf.files({ 
    cwd = vim.fn.expand('%:p:h'),
    unpack(opts)
  })
end

function M.vim_configs(opts)
  if not opts then opts = {} end

  return fzf.files({
    cwd = '~/.config/nvim',
    fd_opts = '-E plugged -E plugin',
    unpack(opts)
  })
end

function M.gems(opts)
  if not opts then opts = {} end

  return fzf.files({
    cwd = vim.env.GEM_HOME,
    unpack(opts)
  })
end

function M.gems_grep(opts)
  if not opts then opts = {} end

  return fzf.grep({
    cwd = vim.env.GEM_HOME,
    input_prompt = 'GrepGems> ',
    unpack(opts)
  })
end

-- FZF

fzf.setup {
  winopts = {
    fullscreen = true,
    -- border = 'none',
    hl = {
    },
    preview = {
      default = 'bat', -- faster than builtin
      wrap = 'nowrap',
      flip_columns = 150,
      horizontal = 'right:50%',
      vertical = 'up:45%',
    },
    previewers = {
      bat = {
        theme = 'gruvbox-dark' -- (bat --list-themes)
      },
    },
  },
  fzf_opts = {
    ['--layout'] = 'reverse',
  },
  files = {
    fd_opts =
      [[--color never --type f --hidden --follow ]] ..
      [[--exclude .git --exclude '*.pyc']],
  },
}

return M
