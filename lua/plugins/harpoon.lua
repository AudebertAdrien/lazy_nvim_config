return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim", -- Harpoon depends on plenary for async and utility functions
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- 📁 Mark file and toggle menu
        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon: Add file" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon: Toggle menu" })

        -- 🚀 Navigate between marked files
        vim.keymap.set("n", "<C-y>", function() ui.nav_file(1) end, { desc = "Harpoon: Go to file 1" })
        vim.keymap.set("n", "<C-u>", function() ui.nav_file(2) end, { desc = "Harpoon: Go to file 2" })
        vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end, { desc = "Harpoon: Go to file 3" })
        vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end, { desc = "Harpoon: Go to file 4" })
    end,
}

