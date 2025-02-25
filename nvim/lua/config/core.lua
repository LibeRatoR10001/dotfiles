-- 开启左侧数字
vim.o.number = true
-- 始终隐藏字符（不依赖语法高亮）,在 Markdown 文件中，粗体、斜体等标记字符可能会被隐藏
vim.opt.conceallevel = 2
-- 使用相对数
vim.o.relativenumber = true
-- 高亮当前行
vim.o.cursorline = true
-- 一行不能完全显示时自动换行
vim.o.wrap = true
-- 在最后一行显示一些内容
vim.o.showcmd = true
-- 命令模式显示补全菜单
vim.o.wildmenu = true
-- /搜索时忽略大小写
vim.o.ignorecase = true
-- /搜索时智能大小写
vim.o.smartcase = true
-- 共享系统剪切
vim.o.clipboard = "unnamedplus"
-- 设置<tab>键
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
-- 随文件自动更改当前路径
vim.o.autochdir = true
-- 在光标上方和下方保留的最小屏幕行数
vim.o.scrolloff = 4
-- 自动缩进
vim.o.smartindent = true
-- 100毫秒没有输入文件将会自动保存交换文件
vim.o.updatetime = 100
-- 开启鼠标
vim.o.mouse = "a"
-- 开启颜色
vim.o.termguicolors = true
-- 将updatetime设置为较低的值以提高性能
vim.opt.updatetime = 200

-- 设置编码格式
vim.o.fileencodings = "utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1"
vim.o.enc = "utf8"

-- 保存修改历史
vim.o.swapfile = true
vim.o.undofile = true

-- noevide 配置
if vim.g.neovide then
  -- 标题栏颜色 only windows
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  vim.g.neovide_title_text_color = "white"
  -- Floating Blur Amount
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  -- Floating Shadow
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  -- 透明度
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_normal_opacity = 0.8

  -- 刷新率
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  -- 字体
  -- vim.o.guifont = "ComicMonoNF,Source Han Sans CN:h12"
  -- Gammar 对比度 仿Alacritty
  -- vim.g.neovide_text_gamma = 0.8
  -- vim.g.neovide_text_contrast = 0.1
  -- 退出neovim而不是neovide
  vim.g.neovide_detach_on_quit = "always_detach"
  -- 光标设置
  -- 闪烁
  vim.g.neovide_cursor_smooth_blink = true
  -- 粒子
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
