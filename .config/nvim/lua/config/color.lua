-- vim.g.tokyonight_diagnostic_line_highlight = 1
vim.cmd('colorscheme catppuccin')

-- 错误状态栏高亮
vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine',
  },
  {
    name = 'DiagnosticSignWarn',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarnLine',
  },
  {
    name = 'DiagnosticSignInfo',
    texthl = 'DiagnosticSignInfo',
    linehl = 'InfoLine',
  },
  {
    name = 'DiagnosticSignHint',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine',
  },
})
