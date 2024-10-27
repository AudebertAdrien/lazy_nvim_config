return  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function ()
        require("neo-tree").setup({
            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    visible = true,  -- Set to `true` to show hidden files
                    hide_dotfiles = false,  -- Set to `false` to show dotfiles (e.g., .gitignore)
                    hide_gitignored = false,  -- Set to `false` to show git-ignored files
                }
            }
        })

        vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })
    end
}
