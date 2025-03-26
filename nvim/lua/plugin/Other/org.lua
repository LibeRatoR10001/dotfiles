return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/Org/**/*",
        org_default_notes_file = "~/Org/default.org",
        org_highlight_latex_and_related = "entities", -- 高亮 LaTeX
      })
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
  {
    "chipsenkbeil/org-roam.nvim",
    tag = "0.1.1",
    dependencies = {
      {
        "nvim-orgmode/orgmode",
        tag = "0.3.7",
      },
    },
    config = function()
      require("org-roam").setup({
        directory = "~/Org",
        -- -- optional
        -- org_files = {
        -- "~/Org",
        -- "~/some/folder/*.org",
        --   -- "~/a/single/org_file.org",
        -- },
        bindings = {
          prefix = "<LocalLeader>m",
        },
      })
    end,
  },
}
