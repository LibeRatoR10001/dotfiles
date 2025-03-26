return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            -- 接受完整补全
            accept = "<A-A>",
            -- 接受一行
            accept_line = "<A-a>",
            -- 接受 n 行（提示输入数字）
            -- 例如，“A-z 2 CR”将接受 2 行
            accept_n_lines = "<A-z>",
            -- 切换到上一个补全项，或手动调用补全
            prev = "<A-[>",
            -- 切换到下一个补全项，或手动调用补全
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
        request_timeout = 3,
        n_completions = 1,
        context_window = 256,
        -- provider = "openai_compatible",
        provider = "openai_fim_compatible",
        provider_options = {
          openai_compatible = {
            api_key = "TERM",
            name = "Ollama",
            end_point = "http://localhost:11434/v1/chat/completions",
            model = "deepseek-coder",
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
          },
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            model = "qwen2.5-coder:1.5b",
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
          },
        },
      })
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = { "*" },
        callback = function()
          vim.cmd("Minuet virtualtext enable")
        end,
      })
    end,
  },
  { "nvim-lua/plenary.nvim" },
}
