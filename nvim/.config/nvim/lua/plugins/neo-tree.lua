return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>'),
        event_handlers = {
            {
                event = "file_opened",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end
            },

        },
        window = {
            mappings = {
                ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
            },
        },
        toggle = true,
    }
}
