-- cli/ansible-doc.lua
local M = {}

-- Function to run ansible-doc for the current word under the cursor
M.ansible_doc_search = function()
  local module_name = vim.fn.expand("<cword>")  -- Capture the word under the cursor (Ansible module)
  local handle = io.popen("ansible-doc " .. module_name)  -- Run ansible-doc command
  local result = handle:read("*a")  -- Capture output
  handle:close()

  return vim.split(result, "\n")  -- Return the output split into lines
end

-- Function to display the output in Telescope floating window
M.ansible_doc_view = function()
  local results = M.ansible_doc_search()  -- Get ansible-doc output
  require('telescope.pickers').new({}, {
    prompt_title = "Ansible Documentation",
    finder = require('telescope.finders').new_table {
      results = results,
    },
    sorter = require('telescope.config').values.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", require('telescope.actions').close)  -- Press Enter to close window
      map("n", "<CR>", require('telescope.actions').close)
      return true
    end,
  }):find()
end

return M

