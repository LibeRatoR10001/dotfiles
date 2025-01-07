-- 主键为space
vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', 'J', '5j')
keymap.set('n', 'K', '5k')
-- leader + p 不粘贴删除的
keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

-- ctrl+a 全选
keymap.set('n', '<C-a>', 'ggVG')

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

-- Alt上下>移动代码块
keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==')
keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==')
keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi')
keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi')
keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv")
keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv")
