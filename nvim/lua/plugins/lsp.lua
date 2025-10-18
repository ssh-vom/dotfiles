return {
    {
        "williamboman/mason.nvim",
        config = true,
        lazy = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        opts = {
            ensure_installed = { "lua_ls", "basedpyright", "ruff" },
        },
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        lazy = false,
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Python: basedpyright
            vim.lsp.config("basedpyright", {
                capabilities = capabilities,
                settings = {
                    basedpyright = {
                        analysis = {
                            autoImportCompletions = false,
                            indexing = { enabled = false },
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "openFilesOnly",
                        },
                    },
                },
            })

            vim.lsp.config("ruff", {
                capabilities = capabilities,
                init_options = {
                    settings = {
                        args = {},
                    },
                },
            })
        end,
    },
}
