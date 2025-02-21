return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = { "clangd", "cmake", "lua_ls", "pylsp", "rust_analyzer" },
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
                capabilities = capabilities,
                cmd = {
                   "clangd",
                    "--background-index",
                    "--compile-commands-dir=build",
                    "--all-scopes-completion",
                    "--clang-tidy",
                    "--cross-file-rename",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu",
                    "--pch-storage=memory",
                },
            })

            lspconfig.pylsp.setup({
                capabilities = capabilities
            })

            -- CMake
            lspconfig.cmake.setup({
                capabilities = capabilities,
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

                    -- Enable autoformat on save
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true }),
                        buffer = ev.buf,
                        callback = function()
                            vim.lsp.buf.format { async = false }
                        end,
                    })
                end,
            })
        end,
    },
}
