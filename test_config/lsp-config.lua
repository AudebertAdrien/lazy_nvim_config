return {
	{
	"williamboman/mason.nvim",

	config = function ()
		require("mason").setup()
	end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function ()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" , "ts_ls", "pyright"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function ()
			local lspconfig = require("lspconfig")
		-- Configuration pour lua_ls
			lspconfig.lua_ls.setup({
                enabled = false,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Évite les erreurs pour `vim` comme variable globale
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true), -- Charge les fichiers runtime de Neovim
						},
					},
				},
			})

            --[=====[ 
			-- Configuration pour tsserver (TypeScript et JavaScript)
			lspconfig.ts_ls.setup({
				settings = {
					javascript = {
						suggest = {
							autoImports = true,
						},
					},
					typescript = {
						suggest = {
							autoImports = true,
						},
					},
				},
			})
            --]=====]

			-- Configuration pour pyright (Python)
			lspconfig.pyright.setup({
				on_init = function(client)
					-- Configuration automatique de l'environnement virtuel pour Python
					local venv_path = os.getenv("VIRTUAL_ENV") or vim.fn.getcwd() .. "/venv"
					client.config.settings.python = {
						pythonPath = venv_path .. "/bin/python",
					}
					client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					return true
				end,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic", -- "off" pour désactiver complètement
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
						},
					},
				},
			})
            --lspconfig.lua_ls.setup({})
			--lspconfig.ts_ls.setup({})
			--lspconfig.pyright.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	},
}
