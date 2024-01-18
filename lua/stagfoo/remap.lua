
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_exec('set nohlsearch', true)
vim.api.nvim_set_keymap('n', '<leader>rc', [[:lua dofile(vim.fn.stdpath('config') .. '/init.lua')<CR>]], { noremap = true, silent = true })


-- Telescope



-- Harpoon
