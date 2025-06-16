-- Set leader keys (used for custom shortcuts)
vim.g.mapleader = " "

-- Disable unnecessary language providers to improve startup time
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Explicitly set the Python 3 provider path (used by plugins like treesitter, LSP, etc.)
vim.g.python3_host_prog = '/usr/bin/python3'

-- Disable netrw (built-in file explorer) to use a plugin like nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers: show absolute for current line, relative for the rest
vim.opt.number = true
vim.opt.relativenumber = true

-- UI preferences
vim.opt.title = true             -- Show file name in window title
vim.opt.showcmd = true           -- Show (partially typed) commands
vim.opt.cmdheight = 0            -- Minimal height for the command line (requires Neovim 0.9+)

-- Better search behavior
vim.opt.hlsearch = true          -- Highlight all matches
vim.opt.incsearch = true         -- Show matches as you type
vim.opt.ignorecase = true        -- Case-insensitive search...
vim.opt.smartcase = true         -- ...unless uppercase letters are used

-- Indentation and tabs
vim.opt.tabstop = 4              -- A tab equals 4 spaces visually
vim.opt.softtabstop = 4          -- How many spaces a <Tab> counts for while editing
vim.opt.shiftwidth = 4           -- Indentation width for auto-indent and << >>
vim.opt.expandtab = true         -- Convert tabs to spaces
vim.opt.smarttab = true          -- Use shiftwidth when pressing <Tab> at the beginning of a line
vim.opt.smartindent = true       -- Smart auto-indenting based on syntax
vim.opt.autoindent = true        -- Copy indent from the current line

-- Maintain visual indentation in wrapped lines
vim.opt.breakindent = true

-- Better scrolling experience (keeps 8 lines visible above/below the cursor)
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Autocompletion behavior
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- "menu"      → Show popup menu
-- "menuone"   → Show even if there's only one match
-- "noselect"  → Do not preselect any item (you must pick one manually)

-- Create a backup directory if it doesn't exist
local backup_dir = vim.fn.expand("~/.nvim-backup")
if vim.fn.isdirectory(backup_dir) == 0 then
  vim.fn.mkdir(backup_dir, "p")
end
vim.opt.backupdir = backup_dir
vim.opt.backup = true             -- Enable backups before writing
vim.opt.writebackup = true        -- Keep a backup while writing

-- Enable persistent undo with a custom undo directory
local undo_dir = vim.fn.expand("~/.nvim-undo")
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end
vim.opt.undodir = undo_dir
vim.opt.undofile = true           -- Enable persistent undo
vim.opt.undolevels = 1000         -- Maximum undo levels
vim.opt.undoreload = 10000        -- Allow large file reloads with undo history

-- Key mapping timeouts
vim.opt.ttimeoutlen = 0           -- Timeout for key code sequences (e.g. <Esc>) — 0ms = instant
vim.opt.timeoutlen = 300          -- Timeout for mapping sequences (e.g. jj to <Esc>) — 300ms to complete

-- Use system clipboard for all yank/paste operations
vim.opt.clipboard = "unnamedplus"

-- Show invisible characters like tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = {
    tab = "› ",        -- Show tabs as '› ' (arrow + space)
    trail = ".",       -- Show trailing spaces as '·' (dot)
    extends = "›",     -- Show '›' when line continues beyond screen right edge
    precedes = "‹",    -- Show '‹' when line continues beyond screen left edge
    nbsp = "·"         -- Show non-breaking spaces as '·'
}

-- Enable 24-bit RGB colors and set background for proper theme contrast
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Configure better code folding using Tree-sitter syntax parsing
vim.opt.foldmethod = "expr"                            -- Use expression to define folds
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"        -- Use Tree-sitter folding expression
vim.opt.foldenable = false                              -- Start with folds open (no auto-fold)
vim.opt.foldlevel = 99                                  -- Open all folds by default (high level)

-- Enable mouse support in all modes (normal, insert, visual, etc.)
vim.opt.mouse = "a"

-- Set update time (in milliseconds) for faster UI responsiveness
vim.opt.updatetime = 300

-- Always show sign column to prevent text shifting when signs appear (e.g. git or LSP)
vim.opt.signcolumn = "yes"

-- Filetype-specific indentation settings for YAML files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "yaml", "yml" },
    callback = function()
        vim.opt_local.tabstop = 2        -- Tabs count as 2 spaces
        vim.opt_local.shiftwidth = 2     -- Indent/outdent by 2 spaces
        vim.opt_local.softtabstop = 2    -- Insert/delete 2 spaces when pressing Tab or Backspace
        vim.opt_local.expandtab = true   -- Use spaces instead of tab characters
    end,
})

-- Filetype-specific indentation settings for JS/TS/JSON/HTML/CSS etc.
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "html", "css", "scss" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
