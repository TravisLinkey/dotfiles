vim.api.nvim_create_user_command("Note", function()
  local command = "bash ~/GDrive/Scripts/printer.sh"

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
