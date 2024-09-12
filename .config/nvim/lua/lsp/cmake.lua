require('lspconfig').cmake.setup({
  cmd = { 'cmake-language-server' },
  filetypes = { 'cmake' },
  init_options = {
    buildDirectory = 'build',
  },
  -- root_dir = function(fname)
  --   return util.root_pattern('.git', 'compile_commands.json', 'build')(fname)
  --     or util.path.dirname(fname)
  -- end,
})
