local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
    -- LuaRocks settings (disabled here)
    opts = {
        defaults = {
            lazy = true,
            version = false,
        },
        rocks = {
            enabled = false,
            hererocks = false,
        },
    },
    -- Plugin specifications: import from 'lua/plugins.lua'
    spec = {
        { import = "plugins" },
    },

    -- Automatic plugin updates
    checker = {
        enabled = true,
        notify = false,
        frequency = 3600, -- Check updates every hour
    },

    -- Auto-install missing plugins on startup
    install = {
        missing = true,
        colorscheme = { "gruvbox", "tokyonight", "catppuccin" }, -- Example fallback colorschemes
    },

    -- UI improvements for lazy.nvim
    ui = {
        border = "rounded",
        size = { width = 0.8, height = 0.8 },
    },

    -- Disable built-in plugins to speed up startup
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
                "netrw",
                "netrwPlugin",
                "matchit",
                "matchparen",
                "shada_plugin",
                "spellfile_plugin",
                "rplugin",
                "shada",
                "tutor",
            },
        },
        cache = {
            enabled = true,
        },
    },

    -- Detect config changes and reload lazy.nvim
    change_detection = {
        enabled = true,
        notify = false,
    },
})
