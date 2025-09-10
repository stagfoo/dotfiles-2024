local M = {}

M.kaomojis = {
  "(*´▽`*)",
  "∑d(°∀°d)",
  "( ᴗзᴗ)",
}

function M.open()
  require('telescope.pickers').new({}, {
    prompt_title = 'Kaomoji Picker',
    finder = require('telescope.finders').new_table {
      results = M.kaomojis,
    },
    sorter = require('telescope.sorters').get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      local actions = require('telescope.actions')
      map('i', '<CR>', function(bufnr)
        local selection = require('telescope.actions.state').get_selected_entry()
        actions.close(bufnr)
        vim.api.nvim_put({ selection[1] }, 'c', false, true)
      end)
      return true
    end,
  }):find()
end

return M
