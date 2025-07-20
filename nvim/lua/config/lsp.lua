function inlay_hint_toggle()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

vim.o.foldmethod = "expr"

local servers = {
  "arduino_language_server",
  "clangd",
  -- "cmake",
  "dotls",
  "gopls",
  "lua_ls",
  "neocmake",
  "pyright",
  "rust_analyzer",
  -- "slint_lsp",
  "textlab",
  "tinymist",
  "tombi",
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    vim.keymap.set("n", "gd", function()
      local params = vim.lsp.util.make_position_params(0, "utf-8")
      vim.lsp.buf_request(0, "textDocument/definition", params, function(_, result, _, _)
        if not result or vim.tbl_isempty(result) then
          vim.notify("No definition found", vim.log.levels.INFO)
        else
          require("snacks").picker.lsp_definitions()
        end
      end)
    end, { buffer = event.buf, desc = "LSP: Goto Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: Goto Declaration" })
    vim.keymap.set("n", "grr", function()
      require("snacks").picker.lsp_references()
    end, { buffer = event.buf, desc = "LSP: Goto References" })

    vim.keymap.set("n", "grk", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Document" })
    vim.keymap.set("n", "grh", inlay_hint_toggle, { desc = "LSP: Toggle inlay_hint" })

    vim.diagnostic.config({
      float = { severity_sort = true },
      severity_sort = true,
      virtual_lines = { current_line = true },
      virtual_text = {
        spacing = 4,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = " ",
        },
      },
    })
    --folding
    local win = vim.api.nvim_get_current_win()
    if client and client:supports_method("textDocument/foldingRange") then
      vim.wo[win].foldexpr = "v:lua.vim.lsp.foldexpr()"
    else
      vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
    vim.wo[win].foldlevel = 99
    vim.wo[win].foldenable = true

    -- inlay_hint
    if
      client
      and (
        client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint)
        or client.server_capabilities.inlayHintProvider
      )
    then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- offload upon detachment
    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
      end,
    })
  end,
})
