return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "mupdf"

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
      build_dir = "build", -- 指定编译输出目录
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
  end,
}
