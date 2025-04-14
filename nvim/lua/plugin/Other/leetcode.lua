return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    arg = "lc",
    cn = { -- leetcode.cn
      enabled = true,
      translator = true,
      translate_problems = true,
    },
    injector = {
      ["python3"] = {
        before = true,
      },
      ["cpp"] = {
        before = { "#include <bits/stdc++.h>", "using namespace std;" },
        after = "int main() {}",
      },
      ["java"] = {
        before = "import java.util.*;",
      },
    },
  },
}
