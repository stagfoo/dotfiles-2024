vim.o.autoread = true

local auto_refresh_group = vim.api.nvim_create_augroup("AutoRefresh", { clear = true })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained" }, {
  group = auto_refresh_group,
  pattern = "*",
  callback = function()
    vim.cmd("checktime")
  end,
})
