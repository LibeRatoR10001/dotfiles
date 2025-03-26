return {

  "L3MON4D3/LuaSnip",
  lazy = true,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
      end,
    },
  },
  build = (not jit.os:find("Windows"))
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  opts = {
    history = true,
    delete_check_events = "TextChanged",
    enable_autosnippets = true,
  },
  config = function(_, opts)
    local ls = require("luasnip")
    if opts then
      require("luasnip").config.setup(opts)
    end
    vim.tbl_map(function(type)
      require("luasnip.loaders.from_" .. type).lazy_load()
    end, { "vscode", "snipmate", "lua" })
    require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets/lua" })
    vim.keymap.set({ "i" }, "<C-K>", function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
}
