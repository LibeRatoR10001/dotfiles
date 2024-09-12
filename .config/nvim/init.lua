local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  {
    'stevearc/conform.nvim', -- 格式化
    opts = {},
  },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'mg979/vim-visual-multi', -- 多行选中
  'MattesGroeger/vim-bookmarks', -- 书签
  'tom-anders/telescope-vim-bookmarks.nvim',
  -- 自动补全
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  -- lint
  'mfussenegger/nvim-lint',

  -- 语法高亮
  'nvim-treesitter/nvim-treesitter',

  -- 内置终端
  { 'akinsho/toggleterm.nvim', version = '*', config = true },

  -- 显示缩进
  { 'echasnovski/mini.nvim', version = '*' },
  -- 注释
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  -- TODO 注释
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  'nvim-lualine/lualine.nvim',
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
})

require('config/base')
require('config/keymap')
require('config/color')

require('plugin/catppuccin')
require('plugin/mason')
require('plugin/lsp')
require('plugin/conform')
require('plugin/tree')
require('plugin/telescope')
require('plugin/bookmark')
require('plugin/lint')
require('plugin/cmp')
require('plugin/treesitter')
require('plugin/term')
require('plugin/indent')
require('plugin/comment')
require('plugin/lualine')
require('plugin/dashboard')

require('lsp/lua')
require('lsp/c')
require('lsp/cmake')
require('lsp/python')

-- noevide 配置
if vim.g.neovide then
  -- 透明度
  vim.g.neovide_transparency = 0.8
  -- 刷新率
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
end
