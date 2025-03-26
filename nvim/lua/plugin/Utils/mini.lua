return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.pairs").setup({
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    })
    require("mini.comment").setup()
    -- local gen_loader = require("mini.snippets").gen_loader
    -- require("mini.snippets").setup({
    --   snippets = {
    --     -- Load custom file with global snippets first (adjust for Windows)
    --     gen_loader.from_file("~/.config/nvim/snippets/global.json"),
    --
    --     -- Load snippets based on current language by reading files from
    --     -- "snippets/" subdirectories from 'runtimepath' directories.
    --     gen_loader.from_lang(),
    --   },
    -- })
    require("mini.surround").setup({
      mappings = {
        add = "Sa", -- Add surrounding in Normal and Visual modes
        delete = "Sd", -- Delete surrounding
        find = "Sf", -- Find surrounding (to the right)
        find_left = "SF", -- Find surrounding (to the left)
        highlight = "Sh", -- Highlight surrounding
        replace = "Sr", -- Replace surrounding
        update_n_lines = "Sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    })
  end,
}
