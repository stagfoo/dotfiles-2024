local nnn_auto_close_group = vim.api.nvim_create_augroup("NnnAutoClose", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
  group = nnn_auto_close_group,
  pattern = "*",
  callback = function()
    local prev_bufnr = vim.fn.bufnr('#')
    if prev_bufnr > 0 and vim.api.nvim_buf_is_valid(prev_bufnr) then
      local prev_buf_ft = vim.api.nvim_buf_get_option(prev_bufnr, 'filetype')
      if prev_buf_ft == 'nnn' then
        local current_bufnr = vim.api.nvim_get_current_buf()
        vim.api.nvim_create_autocmd("BufDelete", {
          buffer = current_bufnr,
          once = true,
          group = nnn_auto_close_group,
          callback = function()
            if vim.api.nvim_buf_is_valid(prev_bufnr) then
              vim.cmd("bdelete! " .. prev_bufnr)
            end
          end,
        })
      end
    end
  end,
})
