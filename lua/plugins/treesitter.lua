return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "vim","javascript", "typescript", "html" , "css", "lua"},
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        })
    end
}
