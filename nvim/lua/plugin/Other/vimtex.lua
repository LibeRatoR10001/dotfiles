return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "mupdf"

    -- vim.g.vimtex_compiler_latexmk_engines = {
    --
    -- }
  end,
}
