-- Bootstrap lazy.nvim plugin manager installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed, if not clone it from GitHub
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
    })

    -- Handle git clone errors and exit gracefully if installation fails
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

-- Add lazy.nvim to Neovim's runtime path so it can be loaded
vim.opt.runtimepath:prepend(lazypath)

-- Setup and configure lazy.nvim plugin manager
require("lazy").setup({
    -- Configuration options for lazy.nvim behavior
    opts = {
        defaults = {
            lazy = true,    -- Load plugins lazily by default for faster startup
            version = false, -- Don't pin plugins to specific versions
        },
        -- Disable LuaRocks integration (Lua package manager)
        rocks = {
            enabled = false,
            hererocks = false,
        },
    },

    -- Plugin specifications: tell lazy.nvim to load plugins from 'lua/plugins.lua'
    spec = {
        { import = "plugins" },
    },

    -- Automatic plugin update checking configuration
    checker = {
        enabled = true,     -- Enable automatic update checking
        notify = false,     -- Don't show notifications for available updates
        frequency = 3600,   -- Check for updates every hour (3600 seconds)
    },

    -- Auto-installation settings for missing plugins
    install = {
        missing = true,     -- Automatically install missing plugins on startup
        -- Fallback colorschemes to try if primary colorscheme fails to load
        colorscheme = { "gruvbox"},
    },

    -- UI customization for lazy.nvim's interface
    ui = {
        border = "rounded",                    -- Use rounded borders for windows
        size = { width = 0.8, height = 0.8 }, -- Window size as percentage of screen
    },

    -- Performance optimizations to speed up Neovim startup
    performance = {
        rtp = {
            -- Disable built-in plugins that aren't commonly used to reduce startup time
            disabled_plugins = {
                "gzip",           -- Gzip file support
                "tarPlugin",      -- Tar archive support
                "tohtml",         -- Convert buffer to HTML
                "zipPlugin",      -- Zip archive support
                "netrw",          -- Built-in file explorer
                "netrwPlugin",    -- Netrw plugin components
                "matchit",        -- Extended % matching
                "matchparen",     -- Highlight matching parentheses
                "shada_plugin",   -- Session data plugin
                "spellfile_plugin", -- Spell file management
                "rplugin",        -- Remote plugin support
                "shada",          -- Session data
                "tutor",          -- Built-in tutorial
            },
        },
        -- Enable plugin caching for faster subsequent loads
        cache = {
            enabled = true,
        },
    },

    -- Automatic detection of configuration file changes
    change_detection = {
        enabled = true,  -- Watch for config changes and reload lazy.nvim
        notify = false,  -- Don't show notifications when changes are detected
    },
})
