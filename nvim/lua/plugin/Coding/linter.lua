return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- Event to trigger linters
    events = { "BufEnter", "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      fish = { "fish" },
      -- c = { "clangtidy" },
      -- cpp = { "clangtidy" },
      go = { "golangcilint" },
      python = { "ruff" },
      -- rust = { "clippy" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
      -- ["*"] = { "typos" },
    },
    linters = {
      -- -- Example of using selene only when a selene.toml file is present
      -- selene = {
      --   -- `condition` is another LazyVim extension that allows you to
      --   -- dynamically enable/disable linters based on the context.
      --   condition = function(ctx)
      --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
      -- ruff = {
      --   cmd = "ruff",
      --   --   args = { "check", "--line-length=128", "--extend-select=ALL" },
      -- },
    },
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft
    -- lint.linters = opts.linters
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd(opts.events, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
