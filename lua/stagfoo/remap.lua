local keymaps = require('stagfoo.keymaps')
local opts = { noremap = true, silent = true }

-- Plugin keymaps
vim.api.nvim_set_keymap('n', keymaps.searching.file_picker, ':NnnPicker<CR>', opts)
vim.api.nvim_set_keymap('n', keymaps.searching.file_sidebar, ':NnnExplorer<CR>', opts)

-- LSP keymaps
vim.api.nvim_set_keymap("n", keymaps.lsp.format, "", { noremap = true, silent = true, callback = vim.lsp.buf.format, desc = "Format buffer" })
vim.api.nvim_set_keymap('n', keymaps.lsp.quick_fix, ':copen<CR>', { noremap = true, silent = true, desc = "Open quickfix list" })

-- General settings
vim.api.nvim_exec('set nohlsearch', true)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard:append('unnamedplus')
vim.wo.relativenumber = true

-- Video Game Keymaping
-- maping is MODE, Left Hand (lhs) and Right Hand RHS, then opts
-- Remap movement keys to 'w', 'a', 's', 'd'
vim.api.nvim_set_keymap('n', keymaps.movement.up, 'k', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.up, 'k', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.up, 'k', opts)

vim.api.nvim_set_keymap('n', keymaps.movement.left, 'h', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.left, 'h', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.left, 'h', opts)

vim.api.nvim_set_keymap('n', keymaps.movement.down, 'j', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.down, 'j', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.down, 'j', opts)

vim.api.nvim_set_keymap('n', keymaps.movement.right, 'l', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.right, 'l', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.right, 'l', opts)

-- Remap word movement
vim.api.nvim_set_keymap('n', keymaps.movement.end_of_word, 'e', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.end_of_word, 'e', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.end_of_word, 'e', opts)

vim.api.nvim_set_keymap('n', keymaps.movement.start_of_word, 'b', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.start_of_word, 'b', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.start_of_word, 'b', opts)

-- Apply additional movement keymaps
vim.api.nvim_set_keymap('n', keymaps.movement.up_one_screen, '<C-b>', opts)
vim.api.nvim_set_keymap('n', keymaps.movement.down_one_screen, '<C-f>', opts)
vim.api.nvim_set_keymap('n', keymaps.movement.start_of_file, 'gg', opts)
vim.api.nvim_set_keymap('n', keymaps.movement.end_of_file, 'G', opts)
vim.api.nvim_set_keymap('n', keymaps.movement.start_of_line, '^', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.start_of_line, '^', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.start_of_line, '^', opts)
vim.api.nvim_set_keymap('n', keymaps.movement.end_of_line, '$', opts)
vim.api.nvim_set_keymap('v', keymaps.movement.end_of_line, '$', opts)
vim.api.nvim_set_keymap('o', keymaps.movement.end_of_line, '$', opts)
vim.api.nvim_set_keymap('n', keymaps.movement.first_non_space_char, '^', opts)

-- Remap paragraph movement
vim.api.nvim_set_keymap('n', 'S', '}', opts)
vim.api.nvim_set_keymap('v', 'S', '}', opts)
vim.api.nvim_set_keymap('n', 'W', '{', opts)
vim.api.nvim_set_keymap('v', 'W', '{', opts)

-- Remap original 'd' (delete) to 'x'
vim.api.nvim_set_keymap('n', keymaps.editing.delete, 'd', opts)
vim.api.nvim_set_keymap('v', keymaps.editing.delete, 'd', opts)
vim.api.nvim_set_keymap('o', keymaps.editing.delete, 'd', opts)

-- Remap 'i' (word jump) to 'e'
vim.api.nvim_set_keymap('n', keymaps.modes.insert, 'i', opts)
vim.api.nvim_set_keymap('v', keymaps.modes.insert, 'i', opts)
vim.api.nvim_set_keymap('o', keymaps.modes.insert, 'i', opts)

-- Map 'E' to insert a new line above the current line
vim.api.nvim_set_keymap('n', keymaps.editing.new_line_under_cursor, 'O', opts)
vim.api.nvim_set_keymap('v', keymaps.editing.new_line_under_cursor, 'O', opts)
vim.api.nvim_set_keymap('o', keymaps.editing.new_line_under_cursor, 'O', opts)

-- Custom Commanded
vim.api.nvim_create_user_command('FormatJSON', ':!jq .', {})


local lasso = require('lasso')
lasso.setup{
    -- marks_tracker_path = 'custom/path/to/marks/tracker'
}

-- Mark current file
vim.keymap.set('n', vim.g.mapleader..'m', function() lasso.mark_file() end)

-- Go to marks tracker (editable, use `gf` to go to file under cursor)
vim.keymap.set('n', vim.g.mapleader..'M', function() lasso.open_marks_tracker() end)

-- Open lasso marks in telescope
vim.keymap.set("n", "<S-i>", function() require("stagfoo.telescope_lasso").lasso_picker() end, { desc = "Lasso Telescope" })

-- Jump to n-th marked file (n-th line of marks tracker)
vim.keymap.set('n', vim.g.mapleader..'1', function() lasso.open_marked_file(1) end)
vim.keymap.set('n', vim.g.mapleader..'2', function() lasso.open_marked_file(2) end)
vim.keymap.set('n', vim.g.mapleader..'3', function() lasso.open_marked_file(3) end)
vim.keymap.set('n', vim.g.mapleader..'4', function() lasso.open_marked_file(4) end)


function OpenInTmuxVSplit()
  local current_file = vim.fn.expand('%:p')
  if current_file == '' then
    vim.notify("No file to open.", vim.log.levels.WARN)
    return
  end
  local cmd = "tmux split-window -v 'nvim " .. vim.fn.shellescape(current_file) .. "'"
  vim.fn.system(cmd)
end

vim.keymap.set('n', '<leader>tf', OpenInTmuxVSplit, { desc = "Open file in tmux vsplit" })
