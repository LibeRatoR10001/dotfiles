local keymap = vim.keymap
-- 上下一个错误
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)

local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  end,
})
