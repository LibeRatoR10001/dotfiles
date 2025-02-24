return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<CR>"] = { "accept", "fallback" },

      ["<S-tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<tab>"] = { "select_next", "snippet_forward", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      -- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
      keyword = { range = "full" },
      -- 选择补全项目时显示文档(0.5秒延迟)
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      -- 不预选第一个项目，选中后自动插入该项目文本
      list = { selection = { preselect = false, auto_insert = true } },
    },
    enabled = function()
      return not vim.tbl_contains({
        -- "lua",
        -- "markdown"
      }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
    end,
    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "buffer", "lsp", "path", "snippets", "markdown" },
      providers = {
        -- score_offset设置优先级数字越大优先级越高
        buffer = { score_offset = 4 },
        path = { score_offset = 3 },
        lsp = { score_offset = 2 },
        snippets = { score_offset = 1 },
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
