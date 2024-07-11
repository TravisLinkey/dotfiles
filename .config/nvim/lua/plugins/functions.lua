vim.api.nvim_create_user_command("Tag", function()
  local command = "bash ~/dotfiles/Scripts/printer.sh"

  local append_data = function(_, data)
    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
    if data then
      vim.api.nvim_buf_set_lines(0, r + 2, r + 10, false, data)
    end
  end
  vim.fn.jobstart(command, {
    stdout_buffered = true,
    on_stdout = append_data,
  })
end, {})

vim.api.nvim_create_user_command("New", function()
  local filename = vim.split(vim.fn.input "Filename: ", " ")
  local command = "touch ~/Documents/Obsidian/Travis/obsidian/0\\ -\\ TODO/" .. table.concat(filename, "\\ ")

  vim.fn.jobstart(command)
end, {})

vim.api.nvim_create_user_command("Leetcode", function()
  local command = "bash ~/dotfiles/Scripts/leetcode.sh"

  local append_data = function(_, data)
    local r, _ = unpack(vim.api.nvim_win_get_cursor(0))
    if data then
      vim.api.nvim_buf_set_lines(0, r + 2, r + 15, false, data)
    end
  end
  vim.fn.jobstart(command, {
    stdout_buffered = true,
    on_stdout = append_data,
  })
end, {})

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

-- Function to move a file
local function move_file(src, dest)
  local cmd = string.format('mv %s %s', vim.fn.shellescape(src), vim.fn.shellescape(dest))
  local result = vim.fn.system(cmd)

  if vim.v.shell_error == 0 then
    print("File moved successfully")
  else
    print("Error: " .. result)
  end
end

-- Custom picker to select the source file
local function select_file(prompt_title, cwd, callback)
  pickers.new({}, {
    prompt_title = prompt_title,
    finder = finders.new_oneshot_job({ 'find', cwd, '-type', 'f' }, { cwd = cwd }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        callback(selection[1])
      end)
      return true
    end,
  }):find()
end

-- Custom picker to select the destination directory
local function select_directory(prompt_title, cwd, callback)
  pickers.new({}, {
    prompt_title = prompt_title,
    finder = finders.new_oneshot_job({ 'find', cwd, '-type', 'd' }, { cwd = cwd }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        callback(selection[1])
      end)
      return true
    end,
  }):find()
end

-- Command to move file using Telescope
vim.api.nvim_create_user_command('TelescopeMoveFile', function()
  local cwd = vim.fn.expand('%:p:h')

  select_file("Select File to Move", cwd, function(src_file)
    select_directory("Select Destination Directory", cwd, function(dest_dir)
      move_file(src_file, dest_dir)
    end)
  end)
end, {})

return {}
