local M = {}

-- Keymaps for Comment.nvim plugin
M.comment = {
  line_toggler = '<leader>/',
  block_toggler = '<leader>?',
}

M.config = {
  reload = '<leader>rc'
}

-- This table seems to be for file-finding and plugins like Telescope/Harpoon
M.searching = {
  find_files = '<leader>ff',
  file_picker = '<leader>pv',
  file_sidebar = '<leader>tree',
  
  open_tmux = '<C-n>',
  search_open_tmux = '<leader>tf',
}

--[[ NEW: Keymaps for in-file search actions ]]
M.search_actions = {
  search_forward = '/',
  search_backward = '?',
  next_occurrence = 'n',
  prev_occurrence = 'N',
  search_word_under_cursor = '*',
  search_word_under_cursor_back = '#',
}

--[[ NEW: Keymaps for block and paragraph movement ]]
M.block_movement = {
  next_paragraph = '}',
  prev_paragraph = '{',
  jump_matching_bracket = '%',
}

M.lsp = {
  format = '<leader>f',
  quick_fix = '<leader>qf',
  confirm = '<Tab>',
  complete = '<C-Space>',
  jump = 'J',
  type_info = 'I',
  problems = 'L',
  prev_problems = '[d',
  next_problems = ']d',
  code_actions = '<leader>hh',
}

M.modes = {
  insert= 'e',
  macro = 'Q'
}

M.editing = {
  delete = 'x',
  new_line_under_cursor = 'E'
}

M.movement = {
  up = 'w',
  up_one_screen = '<C-w>',
  start_of_file = '<leader>ww',
  left = 'a',
  start_of_line = 'A',
  down = 's',
  down_one_screen = '<C-s>',
  end_of_file = '<leader>ss',
  end_of_line = 'D',
  right = 'd',
  first_non_space_char = '<leader>dd',
  end_of_word = 'f',
  start_of_word = 'F',
}

return M


