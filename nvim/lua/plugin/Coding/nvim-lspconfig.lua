return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  -- example using `opts` for defining servers
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          -- "--header-insertion=never",
          "--clang-tidy",
          "--query-driver=clang",
          "--all-scopes-completion",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      },
      cmake = {},
      gopls = {},
      ltex = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
              keywordSnippet = "Disable",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      },
      pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- autoSearchPaths = true,
              -- diagnosticMode = "workspace",
              -- useLibraryCodeForTypes = true,
              ignore = { "*" },
            },
          },
        },
      },
      -- ruff = {
      --   cmd = { "ruff", "check" },
      --   filetypes = { "python" },
      -- },
      rust_analyzer = {
        completion = {
          capable = {
            snippets = "add_parenthesis",
          },
        },
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end,
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
