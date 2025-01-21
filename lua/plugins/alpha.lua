return {
    "goolord/alpha-nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

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

        dashboard.section.buttons.val = {
            dashboard.button("f", " " .. " Find file",       ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " New file",        ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", " " .. " Recent files",    ":Telescope oldfiles <CR>"),
            dashboard.button("g", " " .. " Find text",       ":Telescope live_grep <CR>"),
            dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
            dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end

        local function footer()
            return "Don't Stop Until You are Proud..."
        end

        dashboard.section.footer.val = footer()

        dashboard.section.header.opts.hl = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        dashboard.opts.layout[1].val = 8

        alpha.setup(dashboard.opts)
    end,
  }
