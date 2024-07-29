return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        -- change keymap
        -- disable keymap
        keys[#keys + 1] = { "K", false }
    end,
}
