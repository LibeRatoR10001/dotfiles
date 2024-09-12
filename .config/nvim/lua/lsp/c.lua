local lspconfig = require('lspconfig')
lspconfig.clangd.setup({
  cmd = {
    'clangd',
    '--header-insertion=never',
    '--query-driver=/opt/homebrew/opt/llvm/bin/clang',
    '--all-scopes-completion',
    '--completion-style=detailed',
  },
  filetypes = {
    'c',
    'cpp',
    'objc',
    'objcpp',
  },
})
