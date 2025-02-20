return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        vim.keymap.set('n', '<Leader>ha', ':lua require("harpoon.mark").add_file()<CR>'),
        vim.keymap.set('n', '<Leader>ho', ':lua require("harpoon.ui").toggle_quick_menu()<CR>'),
        vim.keymap.set('n', '<Leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>'),
        vim.keymap.set('n', '<Leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>'),
        vim.keymap.set('n', '<Leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>'),
        vim.keymap.set('n', '<Leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>'),
        vim.keymap.set('n', '<Leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>'),
    },
}
