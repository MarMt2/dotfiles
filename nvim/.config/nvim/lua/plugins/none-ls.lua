return {
    "nvimtools/none-ls.nvim",
    opts = {
        function()
            local null_ls = require("null-ls")
            null_ls.setup({
                source = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.completion.spell,
                    require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
                }
            })
        end,
        vim.keymap.set('n', '<Leader>gf', vim.lsp.buf.format, {}),
    }
}
