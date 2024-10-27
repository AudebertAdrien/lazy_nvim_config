-- Set leader key to space, used as a prefix for custom shortcuts
vim.g.mapleader = " "

-- Disable Ruby and Perl providers; ignore warnings if these providers are not needed
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Set Python 3 provider explicitly to avoid ambiguity between multiple installations
vim.g.python3_host_prog = '/usr/bin/python3'

-- Display absolute line numbers, with relative numbers for easy navigation
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable title and command display; set command height to 0 for a minimal UI
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0

-- Indentation settings:
vim.opt.tabstop = 4          -- A tab represents 4 spaces
vim.opt.softtabstop = 4          -- A tab represents 4 spaces
vim.opt.shiftwidth = 4       -- Auto-indent/outdent by 4 spaces
vim.opt.expandtab = true    -- Convert tabs to spaces 

vim.opt.smarttab = true      -- Insert correct amount of space when hitting Tab
vim.opt.smartindent = true   -- Smart indentation based on file structure
vim.opt.autoindent = true    -- Disable automatic indentation copying

-- Break indent for better readability in wrapped lines
vim.opt.breakindent = true

-- Backup settings:
vim.opt.backupdir = vim.fn.expand("~/.nvim-backup") -- Set backup directory location
vim.opt.backup = true                    -- Enable backup of files
vim.opt.writebackup = true               -- Enable write-backup before saving

-- Set escape key timeout to 0 for instant response
vim.o.ttimeoutlen = 0

-- Use system clipboard for copy-paste in Neovim
vim.o.clipboard = "unnamedplus"

-- Filetype-specific settings for YAML files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "yaml",
    callback = function()
        vim.opt_local.tabstop = 2          -- In YAML, a tab equals 2 spaces
        vim.opt_local.shiftwidth = 2       -- Indent/outdent by 2 spaces
        vim.opt_local.expandtab = true     -- Use spaces instead of tabs

        vim.opt.list = true                -- Enable visible representation of special characters
        vim.opt.listchars = {
            tab = '› ',                    -- Display tabs as '› '
            trail = '·',                   -- Show trailing spaces as dots
            extends = '>',                 -- Mark overflowed text with '>'
            precedes = '<',                -- Mark underflowed text with '<'
            space = '·'                    -- Display spaces as dots for easier visibility
        }
    end,
})
