
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_exec('set nohlsearch', true)
vim.api.nvim_set_keymap('n', '<leader>rc', [[:lua dofile(vim.fn.stdpath('config') .. '/init.lua')<CR>]], { noremap = true, silent = true })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- vim.api.nvim_command("autocmd BufWritePost * Neoformat")



-- Telescope




-- Harpoon
