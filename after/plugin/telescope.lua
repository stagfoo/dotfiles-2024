-- Import the necessary Telescope functions
local builtin = require('telescope.builtin')

-- Key mappings for Telescope
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>gf', function() 
  builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

-- Telescope setup
require("telescope").setup {
  defaults = {
    find_files = {
      hidden = true,
    },
    grep_string = {
      additional_args = { "--hidden" },
    },
  },
}








