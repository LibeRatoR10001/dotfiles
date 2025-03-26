return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
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
      gopls = {
        settings = {
          gopls = {
            staticcheck = true,
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      ltex = {},
      lua_ls = {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
              path ~= vim.fn.stdpath("config")
              and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
            then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              },
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            },
          })
        end,
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
            inlayHints = {
              variableTypes = true,
              functionReturnTypes = true,
            },
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
        -- on_attach = function(client, bufnr)
        --   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        -- end,
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
    local function on_attach(client, bufnr)
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      config.on_attach = on_attach
      lspconfig[server].setup(config)
    end
  end,
}
