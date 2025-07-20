--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("neocmake", {
  capabilities = capabilities,
})

return {
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake" },
  root_markers = { ".git", "build", "cmake" },
}
