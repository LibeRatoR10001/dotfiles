-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim

-- keybind
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.keys.normal_mode["J"] = "5j"
lvim.keys.normal_mode["K"] = "5k"

-- transparent
lvim.transparent_window = true

-- customer plugin
lvim.plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
      arg = "lc"
    },
  },
  {'mg979/vim-visual-multi'},
  {
  "mrjones2014/nvim-ts-rainbow",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    -- event = "BufWinEnter",
    -- init = function()
    --   vim.cmd [[packadd telescope.nvim]]
    -- end,
  },
}

-- alpha

-- "                                                                          ",
-- "    ██╗     ██╗   ██╗███╗   ██╗ █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗    ",
-- "    ██║     ██║   ██║████╗  ██║██╔══██╗██╔══██╗██║   ██║██║████╗ ████║    ",
-- "    ██║     ██║   ██║██╔██╗ ██║███████║██████╔╝██║   ██║██║██╔████╔██║    ",
-- "    ██║     ██║   ██║██║╚██╗██║██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║    ",
-- "    ███████╗╚██████╔╝██║ ╚████║██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║    ",
-- "    ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    ",

-- colorschemes
lvim.colorscheme = "tokyonight-moon"

-- statusline
lvim.builtin.lualine.style = 'default'

-- project.nvim
lvim.builtin.project.manual_mode = true
lvim.builtin.project.patterns = { "CMakeLists.txt", "Cargo.toml", "pyrightconfig.json", "package.json", "pom.xml"}
lvim.builtin.project.exclude_dirs = { "~/.oh-my-zsh/", "~/.cargo/"}

-- telescope 
lvim.builtin.telescope.on_config_done = function (telescope)
  pcall(telescope.load_extension, "project")
end

-- rainbow parentheses
lvim.builtin.treesitter.rainbow.enable = true

-- noevide 配置
if vim.g.neovide then
	-- 透明度
	vim.g.neovide_transparency = 0.8
	-- 刷新率
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_refresh_rate_idle = 5
  -- 字体
  vim.o.guifont = "ComicMonoNF,Source Han Sans CN:h12"
  -- Gammar 对比度 仿Alacritty
  -- vim.g.neovide_text_gamma = 0.8
  -- vim.g.neovide_text_contrast = 0.1
  -- 退出neovim而不是neovid
  vim.g.neovide_detach_on_quit = 'always_quit'

  -- 光标设置
  -- 闪烁
  vim.g.neovide_cursor_smooth_blink = true
  -- 粒子
  vim.g.neovide_cursor_vfx_mode = "railgun"
end
