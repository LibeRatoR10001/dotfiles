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
    -- colorizer
    require("plugin.Ui.colorizer"),
    ---========
    ---Editor
    ---========
    -- which-key
    require("plugin.Editor.which-key"),
    -- explorer
    -- require("plugin.Editor.neo-tree"),
    require("plugin.Editor.oil"),
    -- flash
    -- require("plugin.Editor.flash"),
    -- gitsigns
    require("plugin.Editor.gitsigns"),
    -- todo-comment
    require("plugin.Editor.todo-comment"),
    -- telescope
    -- require("plugin.Editor.telescope"),
    ---========
    ---Coding
    ---========
    -- blinkcmp
    require("plugin.Coding.blink-cmp"),
    -- lspconfig
    require("plugin.Coding.nvim-lspconfig"),
    -- mason
    -- require("plugin.Coding.mason"),
    -- treesitter
    require("plugin.Coding.Treesitter"),
    -- formatter
    require("plugin.Coding.formatter"),
    -- linter
    require("plugin.Coding.linter"),
    -- terminal
    require("plugin.Coding.terminal"),
    -- debugger
    require("plugin.Coding.dap"),
    -- snippets
    require("plugin.Coding.snippets"),
    --========
    --Utils
    --========
    -- 启动界面
    require("plugin.Utils.Snacks"),
    -- mini tools
    require("plugin.Utils.mini"),
    -- go extension for dap
    -- require("plugin.Utils.go-debug"),
    --========
    --Other
    --========
    -- latex
    require("plugin.Other.vimtex"),
    -- markdown
    require("plugin.Other.markdown"),
    -- flutter
    require("plugin.Other.flutter"),
    -- leetcode
    require("plugin.Other.leetcode"),
    -- LLM
    -- require("plugin.Other.llm"),
    -- Org
    -- require("plugin.Other.org"),
    -- rust crate
    require("plugin.Other.rust"),
  },
})
