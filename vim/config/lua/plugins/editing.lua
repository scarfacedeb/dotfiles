return {
  "tpope/vim-repeat",           -- Utility plugin to improve .
  "tpope/vim-surround",         -- Surround targets: csb, cs", ds{, dsb
  "tpope/vim-abolish",          -- Better find-and-replace: Subvert; camelCase to snake case (crs)
  "tpope/vim-commentary",       -- Add comments: gcc
  "AndrewRadev/splitjoin.vim",  -- Convert between single line and multi line: gJ, gS
  "junegunn/vim-easy-align",    -- Easy align (ga)
  {
    "gbprod/yanky.nvim",        -- Yank ring with post-paste cycling (<Leader>p/<Leader>P)
    config = true,
  },
  "tpope/vim-unimpaired",       -- [q, ]q, [Q, ]Q and etc keybindings
  "tpope/vim-eunuch",           -- UNIX shell helpers (mkdir, mv, cp)

  -- Text objects
  "kana/vim-textobj-user",            -- Dependency to create custom text objects
  "michaeljsmith/vim-indent-object",  -- Add indent object (e.g. vii)
  { "nelstrom/vim-textobj-rubyblock", ft = "ruby" }, -- Add ruby block object

  -- Misc
  {
    "inkarkat/vim-ExtractMatches",
    dependencies = "inkarkat/vim-ingo-library",
  },
  "elzr/vim-json",
}
