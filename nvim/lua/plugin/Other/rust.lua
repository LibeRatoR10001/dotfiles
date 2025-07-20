return {
  {
    "saecki/crates.nvim",
    -- tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      local crates = require("crates")
      crates.setup({
        -- neoconf = {
        --   enabled = true,
        -- },
        lsp = {
          enabled = true,
          -- on_attach = function(client, bufnr)
          --   if client.server_capabilities.inlayHintProvider then
          --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          --   end
          -- end,
          actions = true,
          completion = true,
          hover = true,
        },
        completion = {
          -- blink = {
          --   enabled = true,
          -- },
          coq = {
            enabled = true,
            name = "crates.nvim",
          },
          crates = {
            enabled = true, -- disabled by default
            max_results = 8, -- The maximum number of search results to display
            min_chars = 3, -- The minimum number of charaters to type before completions begin appearing
          },
        },
      })
      local opts = { silent = true }
      vim.keymap.set("n", "<leader>cv", ":Crates show_versions_popup<CR>:Crates focus_popup<CR>", opts)
      vim.keymap.set("n", "<leader>cf", ":Crates show_features_popup<CR>:Crates focus_popup<CR>", opts)
      vim.keymap.set("n", "<leader>cd", ":Crates show_dependencies_popup<CR>:Crates focus_popup<CR>", opts)

      vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
      vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
      vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
      vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
      vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
      vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

      vim.keymap.set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, opts)
      vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, opts)

      vim.keymap.set("n", "<leader>cH", crates.open_homepage, opts)
      vim.keymap.set("n", "<leader>cR", crates.open_repository, opts)
      vim.keymap.set("n", "<leader>cD", crates.open_documentation, opts)
      vim.keymap.set("n", "<leader>cC", crates.open_crates_io, opts)
      vim.keymap.set("n", "<leader>cL", crates.open_lib_rs, opts)
    end,
  },
  -- {
  --   "cordx56/rustowl",
  --   version = "*", -- Latest stable version
  --   build = "cargo binstall rustowl",
  --   lazy = false, -- This plugin is already lazy
  --   opts = {
  --     client = {
  --       on_attach = function(_, buffer)
  --         vim.keymap.set("n", "<leader>r", function()
  --           require("rustowl").toggle(buffer)
  --         end, { buffer = buffer, desc = "Toggle RustOwl" })
  --       end,
  --     },
  --   },
  -- },
}
