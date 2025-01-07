require('mason').setup({
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})
require('mason-tool-installer').setup({
    ensure_installed = {
        -- lua
        'lua-language-server',
        'stylua',
        -- html css js ts
        'eslint_d',
        'prettierd',
        -- c c++
        'clangd',
        'clang-format',
        -- cmake
        'cmake-language-server',
        'cmakelint',
        -- rust
        'rust-analyzer',
        -- python
        'pyright',
        'ruff',
    },
})
