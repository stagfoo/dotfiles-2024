
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_exec('set nohlsearch', true)

vim.api.nvim_set_keymap('n', '<leader>yf', ':!yarn run format<CR>', { noremap = true, silent = true })

-- Fern
vim.api.nvim_set_keymap('n', '<leader>sb', ':Fern %:h -drawer', { noremap = true, silent = true })
-- Telescope



-- Harpoon
