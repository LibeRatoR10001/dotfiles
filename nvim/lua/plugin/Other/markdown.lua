-- return {
--   "MeanderingProgrammer/render-markdown.nvim",
--   -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
--   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
--   dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
--   ---@module 'render-markdown'
--   ---@type render.md.UserConfig
--   opts = {},
--   lazy = true,
--   ft = { "markdown", "norg", "rmd", "org", "codecompanion", "rust" },
--   config = function()
--     require("render-markdown").setup({
--       completions = { blink = { enabled = true } },
--       latex = {
--         -- render_modes = true,
--         -- converter = "tectonic",
--       },
--     })
--   end,
-- }
-- For `plugins/markview.lua` users.
return {
  "OXY2DEV/markview.nvim",
  -- lazy = false,
  ft = { "markdown", "tex" },
  -- For blink.cmp's completion
  -- source
  dependencies = {
    { "saghen/blink.cmp", event = { "InsertEnter", "CmdlineEnter" } },
  },
  config = function()
    local headings_presets = require("markview.presets").headings
    local horizontal_rules_presets = require("markview.presets").horizontal_rules
    local tables_presets = require("markview.presets").tables
    require("markview").setup({
      markdown = {
        headings = headings_presets.simple,
        horizontal_rules = horizontal_rules_presets.double,
        tables = tables_presets.rounded,
      },
    })
  end,
}
