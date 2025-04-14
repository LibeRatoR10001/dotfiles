-- 保存折叠记录，在某些独立的窗口会报错
-- vim.cmd 'au BufWinLeave * silent mkview'
-- vim.cmd 'au BufWinEnter * silent loadview'

-- 打开文件时进入上次编辑的位置
-- vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- fcitx5在normal模式时自动切换为英文输入法,摘自fcitx5的archwiki
vim.cmd([[
autocmd InsertLeave * :silent !fcitx5-remote -c
autocmd BufCreate *  :silent !fcitx5-remote -c 
autocmd BufEnter *  :silent !fcitx5-remote -c 
autocmd BufLeave *  :silent !fcitx5-remote -c
]])
-- 意为:
-- 当 进入插入模式 时 触发shell命令 fcitx-remote -c 关闭输入法，改为英文输入
-- 当 创建Buf 时 触发shell命令 fcitx-remote -c 关闭输入法，改为英文输入
-- 当 进入Buf 时 触发shell命令 fcitx-remote -c 关闭输入法, 改为英文输入
-- 当 离开Buf 时 触发shell命令 fcitx-remote -c 关闭输入法, 改为英文输入

-- 开启高亮复制
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- goimport
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

-- orgmode
vim.api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    vim.keymap.set("i", "<S-CR>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
      silent = true,
      buffer = true,
    })
  end,
})
