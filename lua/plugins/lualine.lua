return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,            -- Show icons in statusline
                theme = 'catppuccin',            -- Use catppuccin theme for consistency
                component_separators = "",       -- No separators between components
                section_separators = "",         -- No separators between sections

                -- Disable lualine in these filetypes (empty means none)
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},               -- Filetypes to ignore focus (keep lualine active)

                always_divide_middle = true,    -- Separate left/right sections if enough space
                globalstatus = true,            -- Use a single global statusline (Neovim 0.7+)
                refresh = {                    -- Refresh rates (milliseconds)
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },

            -- Active window sections
            sections = {
                lualine_a = { 'mode' },         -- Mode (Normal, Insert, etc)
                lualine_b = {
                    'branch',                   -- Git branch name
                    {
                        'diagnostics',          -- Show diagnostics info (errors, warnings, etc)
                        sources = { 'nvim_diagnostic' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        colored = true,         -- Colorize by severity
                        update_in_insert = false, -- Do not update diagnostics in Insert mode (improves performance)
                    },
                },
                lualine_c = { 'filename' },     -- Current file name
                lualine_x = { 'filetype' },     -- File type
                lualine_y = { 'progress' },     -- Progress through the file (e.g., 45%)
                lualine_z = { 'location' },     -- Cursor location (line:column)
            },

            -- Inactive window sections (simplified for less distraction)
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },     -- Just show filename
                lualine_x = { 'location' },     -- Show cursor location
                lualine_y = {},
                lualine_z = {},
            },

            tabline = {},                      -- No custom tabline
            winbar = {},                       -- No custom winbar
            inactive_winbar = {},              -- No inactive winbar config
            extensions = {},                   -- No extra extensions loaded
        })
    end,
}

