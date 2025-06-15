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
            close_if_last_window = true,
            filesystem = {
                window = {
                  position = "left",
                  width = 30,
                  height = 40,
                },
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = { enabled = true, leave_dirs_open = true },
                use_libuv_file_watcher = true,
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                        added = "",
                        modified = "",
                        deleted = "✖",
                        renamed = "󰁕",
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
            },
        })

        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function(data)
                -- Only open Neo-tree if started with a directory
                if vim.fn.isdirectory(data.file) == 1 then
                    vim.cmd.cd(data.file)
                    require("neo-tree.command").execute({ toggle = true, dir = data.file })
                end
            end,
        })

        vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>e', ':Neotree toggle float<CR>', { noremap = true, silent = true, desc = "Toggle Neo-tree Float" })
    end
}

