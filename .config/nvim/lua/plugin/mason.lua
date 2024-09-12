require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})
require('mason-tool-installer').setup({
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'eslint_d',
    'prettierd',
    'clangd',
    'clang-format',
    'cmake-language-server',
    'cmakelint',
    'rust-analyzer',
    'pyright',
    'ruff',
  },
})
