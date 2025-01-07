require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'vim',
    'html',
    'css',
    'json',
    'javascript',
    'typescript',
    'c',
    'cpp',
    'rust',
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
})
