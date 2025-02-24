-- 保存折叠记录，在某些独立的窗口会报错
-- vim.cmd 'au BufWinLeave * silent mkview'
-- vim.cmd 'au BufWinEnter * silent loadview'

-- 打开文件时进入上次编辑的位置
-- vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- fcitx5在normal模式时自动切换为英文输入法,摘自fcitx5的archwiki
vim.cmd([[
autocmd InsertLeave * :silent !fcitx5-remote -c
autocmd BufCreate *  :silent !fcitx5-remote -c 
autocmd BufEnter *  :silent !fcitx5-remote -c 
autocmd BufLeave *  :silent !fcitx5-remote -c
]])
-- 意为:
-- 当 进入插入模式 时 触发shell命令 fcitx-remote -c 关闭输入法，改为英文输入
-- 当 创建Buf 时 触发shell命令 fcitx-remote -c 关闭输入法，改为英文输入
-- 当 进入Buf 时 触发shell命令 fcitx-remote -c 关闭输入法, 改为英文输入
-- 当 离开Buf 时 触发shell命令 fcitx-remote -c 关闭输入法, 改为英文输入

-- 开启高亮复制
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
