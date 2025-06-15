return {
    "goolord/alpha-nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- ✨ Custom Header ASCII Art
        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }

        -- 🧩 Dashboard Buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file",       ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file",        ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", " " .. " Recent files",    ":Telescope oldfiles <CR>"),
            dashboard.button("g", " " .. " Find text",       ":Telescope live_grep <CR>"),
            dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
            dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
        }

        -- 🎨 Apply Highlights to Buttons
        for _, btn in ipairs(dashboard.section.buttons.val) do
            btn.opts.hl = "AlphaButtons"
            btn.opts.hl_shortcut = "AlphaShortcut"
        end

        -- 🦶 Footer Message
        dashboard.section.footer.val = "Don't Stop Until You are Proud..."

        -- 🔧 Highlights
        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        -- 🧱 Layout: Add top padding
        dashboard.opts.layout[1].val = 8

        -- 🚀 Setup Alpha
        alpha.setup(dashboard.opts)
    end,
  }
