return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function()
        -- Catppuccin Theme Setup
        require("catppuccin").setup({
            flavour = "macchiato",  -- Options: latte, frappe, macchiato, mocha
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false,
            term_colors = false,

            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },

            no_italic = false,
            no_bold = false,
            no_underline = false,

            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },

            -- Customize colors if needed, example:
            -- color_overrides = { mocha = { base = "#1e1e2e" } },
            color_overrides = {},
            custom_highlights = {},

            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "", -- You could set this to a hex color if you want
                },
                -- Additional popular plugin integrations:
                telescope = true,
                dashboard = true,
                markdown = true,
                mason = true,
                lsp_trouble = true,
            },
        })

        -- Apply the colorscheme
        vim.cmd.colorscheme("catppuccin")
    end,
}
