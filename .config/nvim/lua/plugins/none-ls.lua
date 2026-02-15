return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.formatting.stylua,
				-- Explicit filetypes so none-ls attaches to markdown (no LSP) and format works for <leader>gf
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript", "javascriptreact", "typescript", "typescriptreact",
						"json", "jsonc", "yaml", "html", "css", "scss", "markdown",
					},
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
