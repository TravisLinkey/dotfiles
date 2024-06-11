return {
  {
    "akinsho/toggleterm.nvim",
    version = " * ",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          else
            return 20
          end
        end,
        open_mapping = [[<c-\>]], -- Keybinding to open and close the terminal
        hide_numbers = true,  -- Hide the number column in terminal buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,   -- The degree by which to darken the terminal colour, `1` will darken by 20%
        start_in_insert = true,
        insert_mappings = true, -- Whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "horizontal", -- 'vertical' or 'tab' are also options
        close_on_exit = true, -- Close the terminal window when the process exits
        shell = vim.o.shell,  -- Change the default shell
      })
    end,
  },
}
