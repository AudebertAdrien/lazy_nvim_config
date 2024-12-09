return  {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function ()
            local builtin = require("telescope.builtin")

            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function ()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                defaults = {
                    file_ignore_patterns = { ".git/" },  -- Adjust to ignore certain folders if needed
                    hidden = true,                      -- Enable hidden file search
                },
                pickers = {
                    find_files = {
                    hidden = true,                    -- Include hidden files for find_files picker
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
