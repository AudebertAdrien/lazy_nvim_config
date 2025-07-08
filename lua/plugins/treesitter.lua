return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require('nvim-treesitter.configs').setup({
            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- List of parsers to install or "all"
            ensure_installed = {
                "c_sharp",
                "sql",
                "rust",
                "lua",
                "python",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "bash",
                "json",
                "markdown",
                "yaml",
                "bash",
                "ssh_config",
                "make",
                "nginx",
                "vim",
                "vimdoc"
            },

            -- Install parsers synchronously (only recommended for a few parsers)
            sync_install = false,

            -- Parsers to ignore installing
            ignore_install = {},

            -- Syntax highlighting configuration
            highlight = {
                enable = true,                              -- Enable Treesitter-based syntax highlighting
                additional_vim_regex_highlighting = false,  -- Disable Vim regex highlighting for performance

                -- Disable Treesitter highlight for large files (over 100 KB)
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                    return false
                end,
            },

            -- Enable Treesitter-based indentation
            indent = {
                enable = true,
            },

            -- Optional: Incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        })
    end,
}

