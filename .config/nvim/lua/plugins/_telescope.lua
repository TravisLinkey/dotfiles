return
{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          -- Your other configuration here, if any
        },
        pickers = {
          find_files = {
            -- Using 'fd' command if available
            -- find_command = { 'fd', '--type', 'f', '--hidden', '--follow' }
            find_command = { 'fd', '--type', 'f', '--hidden', '--follow', '--no-ignore-vcs' }
            -- If you prefer to use `find`, use the line below instead:
            -- find_command = { 'find', '.', '-type', 'f', '-iname', '.*' }
          }
        }
      }

      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        pickers    = {
          live_grep = {
            file_ignore_patterns = { 'node_modules' }
          },
          find_files = {
            file_ignore_patterns = { 'node_modules' },
            hidden = true
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
