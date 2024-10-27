return	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

	config = function ()
		require('lualine').setup({
			options = {
				icons_enabled = true,            -- Enable icons in the statusline
				theme = 'catppuccin',            -- Set theme to 'catppuccin' (useful for consistent colors with your color scheme)
				component_separators = "",       -- No separators between components (e.g., mode, branch)
				section_separators = "",         -- No separators between sections (e.g., lualine_a and lualine_b)

				-- Disable lualine for specific file types if desired
				disabled_filetypes = {
				  statusline = {},               -- Add file types to disable lualine statusline
				  winbar = {},                   -- Add file types to disable lualine winbar
				},
				ignore_focus = {},               -- Ignore certain file types to keep lualine active

				always_divide_middle = true,     -- Separate left and right sections when space allows
				globalstatus = true,             -- Use a single global status line (set true to enable)
				refresh = {                      -- Refresh rate (in ms) for statusline, tabline, and winbar
				  statusline = 1000,
				  tabline = 1000,
				  winbar = 1000,
				}
			},

			-- Active window sections
			sections = {
				lualine_a = {'mode'},                	-- Show current mode (e.g., Normal, Insert)
				lualine_b = {'branch', 'diagnostics'},	-- Git branch and diagnostics
				lualine_c = {'filename'},            	-- Current file name
				lualine_x = {'filetype'},            	-- File type (e.g., .lua, .py)
				lualine_y = {'progress'},            	-- Progress through file (e.g., 50%)
				lualine_z = {'location'}             	-- Cursor location (e.g., line, column)
			},

			-- Inactive window sections (dimmed/less detailed when inactive)
			inactive_sections = {
				lualine_a = {},                      -- No display for lualine_a in inactive state
				lualine_b = {},
				lualine_c = {'filename'},            -- Display only filename when inactive
				lualine_x = {'location'},            -- Show only the location (line, column)
				lualine_y = {},
				lualine_z = {}
			},

			tabline = {},                          -- No custom tabline configuration
			winbar = {},                           -- No custom winbar configuration
			inactive_winbar = {},                  -- No custom winbar for inactive windows
			extensions = {}                        -- No additional extensions for lualine
		})
	end
}
