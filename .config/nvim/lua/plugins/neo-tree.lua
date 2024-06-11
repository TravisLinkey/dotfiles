return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
          hide_dotfiles = false,
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
			vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		end,
	},
}
