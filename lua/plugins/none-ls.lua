return {
	"nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {

                -- Formatter for lua 
				null_ls.builtins.formatting.stylua.with({
					extra_args = { "--quote-style", "AutoPreferDouble" },
				}),

                -- Formatter for JavaScript/TypeScript
                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "javascript", "typescript", "typescriptreact", "json", "css", "html"},
                }),

                require("none-ls.diagnostics.eslint_d"),
            },
		})

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
	end
}
