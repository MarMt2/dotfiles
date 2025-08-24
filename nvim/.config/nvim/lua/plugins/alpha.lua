return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
            "                                                                     ",
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
        }

        -- Set header highlight group
        dashboard.section.header.opts.hl = "DashboardHeader"

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
        }

        local fortune = require("alpha.fortune")
        dashboard.section.footer.val = fortune()

        -- Set footer highlight group
        dashboard.section.footer.opts.hl = "DashboardFooter"

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])

        -- Set random colors for header and footer
        vim.api.nvim_create_autocmd("VimEnter", {
            once = true,
            callback = function()
                math.randomseed(os.time())
                local colors = {
                    "#cba6f7",
                    "#a6e3a1",
                    "#f38ba8",
                    "#89b4fa",
                    "#b4befe",
                    "#fab387",
                    "#f5e0dc",
                    "#89dceb",
                    "#f9e2af",
                }
                -- Random color for header
                local header_color = colors[math.random(#colors)]
                -- Different random color for footer
                local footer_color = header_color

                vim.api.nvim_set_hl(0, "DashboardHeader", { fg = header_color })
                vim.api.nvim_set_hl(0, "DashboardFooter", { fg = footer_color })
            end,
        })
    end,
}
