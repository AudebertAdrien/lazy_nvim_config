return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            enabled = false,
            sources = {
                -- Formatter for Lua
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--quote-style", "AutoPreferDouble" },
                }),

                -- Formatter for JavaScript/TypeScript
                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "javascript", "typescript", "typescriptreact", "json", "css", "html" },
                }),

                -- Diagnostics for JavaScript/TypeScript
                null_ls.builtins.diagnostics.eslint_d,
            },
        })

        -- Key mapping for formatting
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })
    end,
}
