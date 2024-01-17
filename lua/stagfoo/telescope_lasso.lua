local telescope_actions = require "telescope.actions"
local telescope_builtin = require "telescope.builtin"

local function get_lasso_marks()
  local marks_path = vim.fn.stdpath("data") .. "/lasso/marks_tracker"
  local file = io.open(marks_path, "r")
  if not file then
    return {}
  end
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  file:close()
  return lines
end

local function telescope_lasso()
  local marks = get_lasso_marks()
  if #marks == 0 then
    vim.notify("No lasso marks found.", vim.log.levels.INFO)
    return
  end

  telescope_builtin.find_files {
    attach_mappings = function(prompt_bufnr, map)
      telescope_actions.select_default:replace(function()
        telescope_actions.close(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        vim.cmd("edit " .. selection.value)
      end)
      return true
    end,
    find_command = { "echo", unpack(marks) },
  }
end

return {
  lasso_picker = telescope_lasso,
}
