local function mapkey(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end

local function mapcmd(key, cmd)
	vim.api.nvim_set_keymap("n", key, ":" .. cmd .. "<cr>", { noremap = true })
end

-- local function maplua(key, txt)
-- 	vim.api.nvim_set_keymap("n", key, ":lua " .. txt .. "<cr>", { noremap = true })
-- end

-- ===
-- === Basic Mappings
-- ===

-- leader键设置为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

mapkey("", "J", "5j")
mapkey("", "K", "5k")
mapkey("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
mapkey("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
mapkey("n", "<A-j>", ":m .+1<CR>==")
mapkey("n", "<A-k>", ":m .-2<CR>==")
mapkey("x", "<A-j>", ":m '>+1<CR>gv-gv")
mapkey("x", "<A-k>", ":m '<-2<CR>gv-gv")

-- 折叠
mapkey("", "<leader>o", "za")
mapkey("x", "<leader>o", "zf")
-- 读取保存的折叠
-- mapkey("", "<leader>a", ":loadview<cr>")

-- 打开lazygit,已用fm-nvim插件
-- mapcmd('<c-g>',':tabe<CR>:-tabmove<CR>:term lazygit')

-- ===
-- === Window management
-- ===

-- 在分屏之间移动
mapkey("n", "<C-h>", "<C-w>h")
mapkey("n", "<C-j>", "<C-w>j")
mapkey("n", "<C-k>", "<C-w>k")
mapkey("n", "<C-l>", "<C-w>l")

-- 使用方向键来调整窗口大小
mapcmd("<C-up>", "resize -5")
mapcmd("<C-down>", "resize +5")
mapcmd("<C-left>", "vertical resize-5")
mapcmd("<C-right>", "vertical resize+5")

-- 使用s + 新方向键 进行分屏
-- mapcmd("su", "set nosplitbelow<CR>:split<CR>:set splitbelow")
-- mapcmd("se", "set splitbelow<CR>:split")
-- mapcmd("sn", "set nosplitright<CR>:vsplit<CR>:set splitright")
-- mapcmd("si", "set splitright<CR>:vsplit")

-- 使分屏窗口上下分布
-- mapkey("", "sh", "<C-w>t<C-w>K")
-- 使分屏窗口左右分布
-- mapkey("", "sv", "<C-w>t<C-w>H")

-- 按 <SPACE> + q 关闭当前窗口下方的窗口
-- mapkey("", "<LEADER>q", "<C-w>j:q<CR>")

-- ===
-- === 批量缩进方法
-- ===
-- 操作为，esc从编辑模式退到命令模式，将光标移到需要缩进的行的行首，然后按shift+v，可以看到该行已被选中，且左下角提示为“可视”
-- 按键盘上的上下方向键，如这里按向下的箭头，选中所有需要批量缩进的行
-- 按shift+>,是向前缩进一个tab值，按shift+<，则是缩回一个tab值

mapkey("x", "<", "<gv")
mapkey("x", ">", ">gv")
-- mapkey("x", "<s-tab>", "<gv")
-- mapkey("x", "<tab>", ">gv")

-- 打开一个终端窗口
-- mapcmd("<LEADER>/", "set splitbelow<CR>:split<CR>:res +10<CR>:term")

-- 按两下空格跳转到占位符<++>,并进入插入模式
-- mapkey("", "<LEADER><LEADER>", "<Esc>/<++><CR>:nohlsearch<CR>c4l")

-- 拼写检查
-- mapcmd("<LEADER>sc", "set spell!")

-- 运行代码
-- vim.cmd([[
--  au filetype dart noremap r :wall<cr>:Telescope flutter commands<cr>
--  au filetype python noremap r :wall<cr>:set splitbelow<cr>:sp<cr>:term python %<cr>
--  au filetype go noremap r :wall<cr>:set splitbelow<cr>:sp<cr>:term go run %<cr>
--  au filetype markdown noremap r :MarkdownPreview<cr>
--  au filetype rust noremap r :wall<cr>:set splitbelow<cr>:sp<cr>:term cargo run<cr>
-- ]])

-- ===
-- === map function external environment
-- ===

-- 下面的函数给外部文件调用的
-- 使用示例如下
-- local map = require("config.keymap")
-- map:cmd('<space>p','PasteImg')
local map = {}
function map:key(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true })
end
function map:cmd(key, cmd)
	vim.api.nvim_set_keymap("n", key, ":" .. cmd .. "<cr>", { noremap = true })
end
function map:lua(key, txt)
	vim.api.nvim_set_keymap("n", key, ":lua " .. txt .. "<cr>", { noremap = true })
end

return map
