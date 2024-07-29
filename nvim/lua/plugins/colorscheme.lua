return {
    -- add theme
    { "Mofiqul/vscode.nvim" },
    { "navarasu/onedark.nvim" },
    { "folke/tokyonight.nvim" },

    -- Configure LazyVim to load theme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight",
        },
    },
}
