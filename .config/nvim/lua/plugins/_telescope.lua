return
{
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          path_display = { "smart" },
          layout_strategy = "horizontal",
          preview = {
            -- Avoid ft_to_lang nil error with newer nvim-treesitter (telescope#3487)
            treesitter = false,
          },
          layout_config = {
            horizontal = {
              preview_width = 0.50,
              -- Show preview even in narrower windows (default 120 hides it below 120 cols)
              preview_cutoff = 40,
            },
          },
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
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          preview = { treesitter = false },
        },
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
