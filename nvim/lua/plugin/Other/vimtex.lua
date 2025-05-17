return {
  "lervag/vimtex",
  lazy = true, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  ft = "tex",
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk_engines = {
      ["_"] = "-pdf",
      ["pdflatex"] = "-pdf",
      ["dvipdfex"] = "-pdfdvi",
      ["lualatex"] = "-lualatex",
      ["xelatex"] = "-xelatex",
      ["context (pdftex)"] = "-pdf -pdflatex=texexec",
      ["context (luatex)"] = "-pdf -pdflatex=context",
      ["context (xetex)"] = "-pdf -pdflatex=texexec --xtx",
    }
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "build", -- 指定编译输出目录
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
      "LaTex Warning: Float too large for page",
      "contains only floats",
    }
  end,
}
