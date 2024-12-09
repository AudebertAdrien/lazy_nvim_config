return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("neo-tree").setup({
            close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab

            window = {
                position = "left",
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    visible = true,          -- Set to `true` to show hidden files
                    hide_dotfiles = false,   -- Set to `false` to show dotfiles (e.g., .gitignore)
                    hide_gitignored = false, -- Set to `false` to show git-ignored files 
                },
                follow_current_file = {
                    enabled = true,          -- This will find and focus the file in the active buffer every time
                    leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
                use_libuv_file_watcher = true,
            },
            default_component_configs = {
                git_status = {
                     symbols = {
                          -- Change type
                          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                          deleted   = "✖",-- this can only be used in the git_status source
                          renamed   = "󰁕",-- this can only be used in the git_status source
                          -- Status type
                          untracked = "",
                          ignored   = "",
                          unstaged  = "",
                          staged    = "",
                          conflict  = "",
                    },
                },
            },
        })

        vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
        vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
    end
}
