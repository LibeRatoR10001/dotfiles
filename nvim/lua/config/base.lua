local opt = vim.opt
opt.number=true
opt.relativenumber=true

opt.scrolloff = 5
opt.sidescrolloff = 5
-- 高亮搜索
opt.hlsearch=true
opt.incsearch=true
-- 启用鼠标
opt.mouse:append('a')
opt.clipboard:append('unnamedplus')
-- 缩进
opt.tabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.autoindent=true
-- 搜索
opt.ignorecase=true
opt.smartcase=true
-- 防止包裹一行
opt.wrap=false
-- 光标行
opt.cursorline=true
-- 终端真彩色
opt.termguicolors=true
-- 左侧多一列debug
opt.signcolumn="yes"
-- 新窗口
opt.splitright=true
opt.splitbelow=true

opt.swapfile=false
opt.autoread=true
vim.bo.autoread=true

-- 复制时文本高亮
vim.api.nvim_create_autocmd('TextYankPost',{
    callback=function()
        vim.highlight.on_yank({
              higroup="IncSearch",
              timeout=300
        })
    end
})
