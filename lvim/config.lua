-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- vim
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

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
			arg = "lc",
			cn = { -- leetcode.cn
				enabled = true,
				translator = true,
				translate_problems = true,
			},
		},
	},
	{ "mg979/vim-visual-multi" },
	{
		"mrjones2014/nvim-ts-rainbow",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- latex
	{
		"vigoux/ltex-ls.nvim",
	},
}

-- alpha
-- NOTE:
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
lvim.builtin.lualine.style = "default"

-- project.nvim
lvim.builtin.project.manual_mode = true
lvim.builtin.project.patterns = { "CMakeLists.txt", "Cargo.toml", "pyrightconfig.json", "package.json", "pom.xml" }
lvim.builtin.project.exclude_dirs = { "~/.oh-my-zsh/", "~/.cargo/" }

-- telescope
lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "project")
end

-- rainbow parentheses
lvim.builtin.treesitter.rainbow.enable = true

-- lsp
lvim.lsp.installer.setup.automatic_installation = false

-- latex
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "ltex"
end, lvim.lsp.automatic_configuration.skipped_servers)
lvim.builtin.treesitter.highlight.disable("latex")
lvim.builtin.treesitter.ignore_install = { "latex" }
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "tex",
	callback = function()
		vim.cmd("syntax enable")
		vim.cmd("set syntax=tex")
	end,
})

-- formatter linter
local farmatters = require("lvim.lsp.null-ls.formatters")
local linters = require("lvim.lsp.null-ls.linters")
local code_actions = require("lvim.lsp.null-ls.code_actions")
farmatters.setup({
	{
		command = "prettier",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"html",
			"css",
			"json",
			"yaml",
			"markdown",
		},
	},
	{
		command = "stylua",
		filetypes = { "lua" },
	},
	{
		command = "cmake-format",
		filetypes = {
			"CMakeLists",
		},
	},
})
linters.setup({})
code_actions.setup({
	name = "proselint",
})
lvim.format_on_save.enabled = true

-- noice
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

-- 禁用
lvim.builtin.treesitter.ignore_install = { "kdl" }

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
	vim.g.neovide_detach_on_quit = "always_quit"

	-- 光标设置
	-- 闪烁
	vim.g.neovide_cursor_smooth_blink = true
	-- 粒子
	vim.g.neovide_cursor_vfx_mode = "railgun"
end
