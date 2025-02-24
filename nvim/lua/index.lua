require("lazy").setup({
  spec = {
    ---========
    ---UI
    ---========
    -- 颜色主题
    require("plugin.Ui.colortheme"),
    -- lualine状态栏
    require("plugin.Ui.lualine"),
    -- indent rainbow
    require("plugin.Ui.indent"),
    -- bufferline
    require("plugin.Ui.bufferline"),
    -- noice
    require("plugin.Ui.noice"),
    -- dashboard
    -- require("plugin.Ui.alpha"),
    ---========
    ---Editor
    ---========
    -- which-key
    require("plugin.Editor.which-key"),
    -- explorer
    -- require("plugin.Editor.neo-tree"),
    -- flash
    -- require("plugin.Editor.flash"),
    -- gitsigns
    require("plugin.Editor.gitsigns"),
    -- todo-comment
    require("plugin.Editor.todo-comment"),
    ---========
    ---Coding
    ---========
    -- blinkcmp
    require("plugin.Coding.blink-cmp"),
    -- lspconfig
    require("plugin.Coding.nvim-lspconfig"),
    -- treesitter
    require("plugin.Coding.Treesitter"),
    -- formatter
    require("plugin.Coding.formatter"),
    -- linter
    -- terminal
    require("plugin.Coding.terminal"),
    --========
    --Utils
    --========
    -- 启动界面
    require("plugin.Utils.Snacks"),
    -- mini tools
    require("plugin.Utils.mini"),
    --========
    --Other
    --========
    -- latex
    require("plugin.Other.vimtex"),
    -- markdown
    require("plugin.Other.markdown"),
  },
})
