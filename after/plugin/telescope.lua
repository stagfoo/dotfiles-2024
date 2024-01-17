-- Import the necessary Telescope functions
local builtin = require('telescope.builtin')
local fb_actions = require "telescope._extensions.file_browser.actions"

-- Key mappings for Telescope
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>gf', function() 
  builtin.grep_string({ search = vim.fn.input('Grep > ') })
end)

-- Set up file_browser key mappings
vim.keymap.set("n", "<space>fb", function()
  require("telescope").extensions.file_browser.file_browser()
end)

-- Check if nvim was started with a directory argument
local function open_telescope_on_directory()

  if #args == 1 and vim.fn.isdirectory(args[1]) == 1 then
    -- open telescope find_files
     require("telescope").extensions.file_browser.file_browser()
  end
end



-- Telescope setup with file_browser extension
require("telescope").setup {
  extensions = {
    file_browser = {
      path = vim.loop.cwd(),
      cwd = vim.loop.cwd(),
      cwd_to_path = false,
      grouped = false,
      files = true,
      add_dirs = true,
      depth = 1,
      auto_depth = false,
      select_buffer = false,
      hidden = { file_browser = false, folder_browser = false },
      respect_gitignore = vim.fn.executable "fd" == 1,
      no_ignore = false,
      follow_symlinks = false,
      browse_files = require("telescope._extensions.file_browser.finders").browse_files,
      browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
      hide_parent_dir = false,
      collapse_dirs = false,
      prompt_path = false,
      quiet = false,
      dir_icon = "📁",
      dir_icon_hl = "Default",
      display_stat = { date = true, size = true, mode = true },
      hijack_netrw = false,
      use_fd = true,
      git_status = true,
      mappings = {
        ["i"] = {
          ["<A-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<A-r>"] = fb_actions.rename,
          ["<A-m>"] = fb_actions.move,
          ["<A-y>"] = fb_actions.copy,
          ["<A-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-g>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
          ["<bs>"] = fb_actions.backspace,
        },
        ["n"] = {
          ["c"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["m"] = fb_actions.move,
          ["y"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["o"] = fb_actions.open,
          ["g"] = fb_actions.goto_parent_dir,
          ["e"] = fb_actions.goto_home_dir,
          ["w"] = fb_actions.goto_cwd,
          ["t"] = fb_actions.change_cwd,
          ["f"] = fb_actions.toggle_browser,
          ["h"] = fb_actions.toggle_hidden,
          ["s"] = fb_actions.toggle_all,
        },
      },
    },
  },
}

-- ### START: ADD THIS CODE ###

-- This function opens Telescope, but overrides the open action to use tmux
local function find_and_open_in_tmux()
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  require('telescope.builtin').find_files({
    attach_mappings = function(prompt_bufnr, map)
      -- This function runs when you press <CR> on a selection
      local function open_in_new_tmux_window()
        -- First, close the Telescope floating window
        actions.close(prompt_bufnr)

        -- Get the full path of the file you selected
        local selection = action_state.get_selected_entry()
       if not selection then return end -- Exit if nothing is selected
        local file_path = selection.value

        -- Construct and run the tmux command
        local cmd = string.format("tmux new-window \"nvim '%s'\"", file_path)
        vim.fn.system(cmd)
      end

      -- Remap <CR> in insert and normal mode to our new function
      map('i', '<C-n>', open_in_new_tmux_window)
      map('n', '<C-n>', open_in_new_tmux_window)

      return true
    end,
  })
end

-- Create a new keymap for this tmux functionality
vim.keymap.set('n', '<leader>tf', find_and_open_in_tmux, { desc = '[T]mux [F]ind File' })

-- ### END: ADD THIS CODE ###


-- Import the necessary Telescope functions
local builtin = require('telescope.builtin')
-- ... (the rest of your file remains exactly the same) ...

-- Load the Telescope file_browser extension
require('telescope').load_extension('file_browser')

