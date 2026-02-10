return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
          			hide_dotfiles = true,
				},
			},
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			-- Setup neo-tree
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						hide_dotfiles = true,
					},
				},
			})
			
			-- Keymap to open neo-tree
			vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
			
			-- Custom function to open terminal in neo-tree directory
			local function open_terminal_in_neo_tree_dir()
				local state = require("neo-tree.sources.manager").get_state("filesystem")
				if state and state.tree then
					local node = state.tree:get_node()
					if node then
						local path = node:get_id()
						
						local Terminal = require('toggleterm.terminal').Terminal
						
						-- Check if it's a directory
						if node.type == "directory" then
							-- Open terminal in the selected directory
							local term = Terminal:new({
								dir = path,
								direction = "horizontal"
							})
							term:toggle()
						else
							-- If it's a file, open terminal in its parent directory
							local parent_path = vim.fn.fnamemodify(path, ":h")
							local term = Terminal:new({
								dir = parent_path,
								direction = "horizontal"
							})
							term:toggle()
						end
					else
						print("No node selected in neo-tree")
					end
				else
					print("Neo-tree not open or no state available")
				end
			end
			
			-- Add keymap for terminal in neo-tree
			vim.keymap.set("n", "<leader>t", open_terminal_in_neo_tree_dir, { desc = "Open terminal in neo-tree directory" })
		end,
	},
}
