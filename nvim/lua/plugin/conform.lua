require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    json = { 'prettierd' },
    yaml = { 'prettierd' },
    markdown = { 'prettierd' },
    c = { 'clangd-format' },
    cpp = { 'clang-format' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
