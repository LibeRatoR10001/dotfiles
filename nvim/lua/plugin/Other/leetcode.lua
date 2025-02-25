return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  opts = {
    arg = "lc",
    cn = { -- leetcode.cn
      enabled = true,
      translator = true,
      translate_problems = true,
    },
  },
}
