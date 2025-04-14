return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    config = function()
      local Path = require("plenary.path")
      local function project_root()
        -- 优先检测 Git
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel 2>/dev/null")[1]
        if git_root ~= "" then
          return git_root
        end
        return vim.fn.getcwd()
      end
      local function project_name()
        local path = project_root()
        return vim.fn.fnamemodify(path, ":t")
      end
      require("orgmode").setup({
        org_agenda_files = {
          "~/org/inbox.org",
          "~/org/note.org",
          "~/org/projects.org",
          "~/org/schedule.org",
          "~/org/tasks.org",
        },
        org_highlight_latex_and_related = "entities", -- 高亮 LaTeX
        mappings = {
          prefix = "<leader>k",
        },
        org_capture_templates = {
          t = {
            description = "Task",
            target = "~/org/tasks.org",
            headline = "Todo",
            template = "* TODO %?\nDEADLINE: %^T\n",
          },
          s = {
            description = "Schedule",
            target = "~/org/schedule.org",
            headline = "Schedule",
            template = "* TODO %?\nSCHEDULED: %^T\n",
          },
          i = {
            description = "Idea",
            target = "~/org/inbox.org",
            headline = "Inbox",
            template = "* %?\n%T",
          },
          n = {
            description = "Roam Note",
            target = "~/org/note.org",
            headline = "Quick Notes",
            template = "* %?\n%a",
          },
          p = {
            description = "Centralized templates for projects",
            subtemplates = {
              t = {
                description = "Project todo",
                target = "~/org/projects.org",
                headline = project_name(),
                -- regexp = "^\\*\\* Tasks",
                template = "*** TODO %?\n%a",
              },
              n = {
                description = "Project notes",
                target = "~/org/projects.org",
                headline = project_name(),
                template = "*** Notes %U %?\n%a",
              },
              c = {
                description = "Project changelog",
                target = "~/org/projects.org",
                headline = project_name(),
                template = "*** Change %U %?\n%a",
              },
            },
          },
          -- l = {
          --   description = "Templates for projects",
          --   subtemplates = {
          --     t = {
          --       description = "Project-local todo",
          --       target = project_root() .. "todo.org",
          --       headline = "Inbox",
          --       template = "* TODO %?\n%a",
          --     },
          --     n = {
          --       description = "Project-local notes",
          --       target = project_root() .. "/notes.org",
          --       headline = "Inbox",
          --       template = "* %U %?\n%a",
          --     },
          --     c = {
          --       description = "Project-local changelog",
          --       target = project_root() .. "/changelog.org",
          --       headline = "Unreleased",
          --       template = "* %U %?\n%a",
          --     },
          --   },
          -- },
        },
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
        directory = "~/org/roam",
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
  {
    "danilshvalov/org-modern.nvim",
    config = function()
      local Menu = require("org-modern.menu")

      require("orgmode").setup({
        ui = {
          menu = {
            handler = function(data)
              Menu:new({
                window = {
                  margin = { 1, 0, 1, 0 },
                  padding = { 0, 1, 0, 1 },
                  title_pos = "center",
                  border = "single",
                  zindex = 1000,
                },
                icons = {
                  separator = "➜",
                },
              }):open(data)
            end,
          },
        },
      })
    end,
  },
}
