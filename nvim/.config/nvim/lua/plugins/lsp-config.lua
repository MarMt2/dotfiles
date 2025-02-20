return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
                    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, {})
                    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, {})
                    vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.references, {})
                    vim.keymap.set('n', '<Leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end,
    },
}
