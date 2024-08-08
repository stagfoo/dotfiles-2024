
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_exec('set nohlsearch', true)
vim.api.nvim_set_keymap('n', '<leader>rc', [[:lua dofile(vim.fn.stdpath('config') .. '/init.lua')<CR>]], { noremap = true, silent = true })

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard:append('unnamedplus')
 vim.wo.relativenumber = true


-- Options for the key mapping
local opts = { noremap = true, silent = true }

-- Function to apply preferred code actions
local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
  end

vim.keymap.set('n', '<leader>qf', quickfix, opts)


-- Duplicate current file
local function duplicate_file()
    local filepath = vim.fn.expand('%:p')
    local filedir = vim.fn.expand('%:p:h')
    local filename = vim.fn.expand('%:t:r')
    local fileext = vim.fn.expand('%:e')

    local new_filepath = string.format('%s/%s_copy%s', filedir, filename, fileext ~= '' and '.' .. fileext or '')
    
    vim.cmd('write ' .. new_filepath)
    print('File duplicated to: ' .. new_filepath)
end

-- Map the function to a key combination (optional)
vim.api.nvim_set_keymap('n', '<leader>df', ':lua duplicate_file()<CR>', { noremap = true, silent = true })
vim.keymap.set("i", "<ctrl+l>", "<cmd>EmojiPicker<cr>")



-- Video Game Keymaping
--
-- Remap movement keys to 'w', 'a', 's', 'd'
vim.api.nvim_set_keymap('n', 'w', 'k', opts)
vim.api.nvim_set_keymap('v', 'w', 'k', opts)
vim.api.nvim_set_keymap('o', 'w', 'k', opts)

vim.api.nvim_set_keymap('n', 'a', 'h', opts)
vim.api.nvim_set_keymap('v', 'a', 'h', opts)
vim.api.nvim_set_keymap('o', 'a', 'h', opts)

vim.api.nvim_set_keymap('n', 's', 'j', opts)
vim.api.nvim_set_keymap('v', 's', 'j', opts)
vim.api.nvim_set_keymap('o', 's', 'j', opts)

vim.api.nvim_set_keymap('n', 'd', 'l', opts)
vim.api.nvim_set_keymap('v', 'd', 'l', opts)
vim.api.nvim_set_keymap('o', 'd', 'l', opts)

-- Remap original 'd' (delete) to 'x'
vim.api.nvim_set_keymap('n', 'x', 'd', opts)
vim.api.nvim_set_keymap('v', 'x', 'd', opts)
vim.api.nvim_set_keymap('o', 'x', 'd', opts)

-- Remap 'i' (word jump) to 'e'
vim.api.nvim_set_keymap('n', 'e', 'i', opts)
vim.api.nvim_set_keymap('v', 'e', 'i', opts)
vim.api.nvim_set_keymap('o', 'e', 'i', opts)

-- Remap 'h' (left) to 'a'
vim.api.nvim_set_keymap('n', 'a', 'h', opts)
vim.api.nvim_set_keymap('v', 'a', 'h', opts)
vim.api.nvim_set_keymap('o', 'a', 'h', opts)

-- Remap 'j' (down) to 's'
vim.api.nvim_set_keymap('n', 's', 'j', opts)
vim.api.nvim_set_keymap('v', 's', 'j', opts)
vim.api.nvim_set_keymap('o', 's', 'j', opts)

-- Remap 'k' (up) to 'w'
vim.api.nvim_set_keymap('n', 'w', 'k', opts)
vim.api.nvim_set_keymap('v', 'w', 'k', opts)
vim.api.nvim_set_keymap('o', 'w', 'k', opts)

-- Remap 'l' (right) to 'd'
vim.api.nvim_set_keymap('n', 'd', 'l', opts)
vim.api.nvim_set_keymap('v', 'd', 'l', opts)
vim.api.nvim_set_keymap('o', 'd', 'l', opts)

-- Remap 'r' (redo) to 'R'
vim.api.nvim_set_keymap('n', 'R', '<C-r>', opts)
vim.api.nvim_set_keymap('v', 'R', '<C-r>', opts)
vim.api.nvim_set_keymap('o', 'R', '<C-r>', opts)

-- Remap 'q' (record macro) to 'Q'
vim.api.nvim_set_keymap('n', 'Q', 'q', opts)
vim.api.nvim_set_keymap('v', 'Q', 'q', opts)
vim.api.nvim_set_keymap('o', 'Q', 'q', opts)

-- Remap 'e' (end of word) to 'f'
vim.api.nvim_set_keymap('n', 'f', 'e', opts)
vim.api.nvim_set_keymap('v', 'f', 'e', opts)
vim.api.nvim_set_keymap('o', 'f', 'e', opts)

-- Map 'Space' to insert a new line below the current line
-- vim.api.nvim_set_keymap('n', '<space>', 'o', opts)
-- vim.api.nvim_set_keymap('v', '<space>', 'o', opts)
-- vim.api.nvim_set_keymap('o', '<space>', 'o', opts)

-- Map 'Shift+Space' to insert a new line above the current line
vim.api.nvim_set_keymap('n', 'E', 'O', opts)
vim.api.nvim_set_keymap('v', 'E', 'O', opts)
vim.api.nvim_set_keymap('o', 'E', 'O', opts)


-- Map 'q' to 'Esc' in insert mode
-- vim.api.nvim_set_keymap('i', '<Tab>', '<Esc>', opts)


-- TODO setup clipboard sharing

-- vim.api.nvim_command("autocmd BufWritePost * Neoformat")



-- Telescope

-- Harpoon
