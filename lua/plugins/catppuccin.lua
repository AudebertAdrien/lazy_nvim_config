return  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,

    config = function ()
        -- Catppuccin Theme Setup
        -- Configure appearance settings such as color flavor, background, terminal colors, and styles.
        require("catppuccin").setup({
            flavour = "macchiato",  -- Theme flavor options: latte, frappe, macchiato, mocha
            background = {          -- Set background for light and dark modes
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false, -- Disable setting the background color (transparent mode)
            show_end_of_buffer = false,     -- Hide '~' characters after the end of the buffer
            term_colors = false,            -- Enable terminal colors (affects `g:terminal_color_0` etc.)

            dim_inactive = {                -- Dim the background of inactive windows
                enabled = false,            -- Disable by default
                shade = "dark",             -- Dim using a darker shade
                percentage = 0.15,          -- Shade intensity for dimming
            },

            -- Font styles
            no_italic = false,              -- Do not force-disable italics
            no_bold = false,                -- Do not force-disable bold text
            no_underline = false,           -- Do not force-disable underlines

            -- General highlight group styles
            styles = {
                comments = { "italic" },     -- Set comments to italic
                conditionals = { "italic" }, -- Apply italics to conditionals
                loops = {},                  -- Default style for loops
                functions = {},              -- Default style for functions
                keywords = {},               -- Default style for keywords
                strings = {},                -- Default style for strings
                variables = {},              -- Default style for variables
                numbers = {},                -- Default style for numbers
                booleans = {},               -- Default style for booleans
                properties = {},             -- Default style for properties
                types = {},                  -- Default style for types
                operators = {},              -- Default style for operators
            },

            -- Color overrides and custom highlights
            color_overrides = {},            -- Override specific colors (e.g., { Comment = "#FF0000" })
            custom_highlights = {},          -- Define custom highlights for specific groups

            -- Plugin integrations for consistent theme
            integrations = {
                cmp = true,                  -- Integrate with nvim-cmp
                gitsigns = true,             -- Integrate with gitsigns
                nvimtree = true,             -- Integrate with nvim-tree
                treesitter = true,           -- Integrate with Treesitter
                notify = false,              -- Disable integration with nvim-notify
                mini = {                     -- Mini.nvim plugin integrations
                    enabled = true,          -- Enable integration with mini plugins
                    indentscope_color = "",  -- Set indentscope color
                },
            },
        })

         -- Load the color scheme after setup
        vim.cmd.colorscheme "catppuccin"
    end
}
