return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            local builtin = require("telescope.builtin")

            -- Keymaps for telescope builtins
            vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Telescope Find Files" })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope Live Grep" })
        end,
    },

    {
        'nvim-telescope/telescope-ui-select.nvim',

        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = { ".git/" }, -- Ignore .git folders globally
                    hidden = true,                      -- Show hidden files in all pickers by default
                },
                pickers = {
                    find_files = {
                        hidden = true,                 -- Specifically show hidden files for find_files picker
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}) -- Dropdown theme for ui-select
                    },
                },
            })

            -- Load the ui-select extension for nicer vim.ui.select interface
            require("telescope").load_extension("ui-select")
        end,
    },
}

