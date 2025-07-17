return {
    {
        "williamboman/mason.nvim",
        config = true,
        lazy=true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        opts = {
            ensure_installed = { "lua_ls", "basedpyright", "ruff"},
        },
        lazy=true,
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
        lazy=false,
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            require("lspconfig").lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = {'vim'} },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            -- vim.api.nvim_create_autocmd('LspAttach', {
            --     callback = function(args)
            --         local client = vim.lsp.get_client_by_id(args.data.client_id)
            --         if not client then return end
            --
            --         --@diagnostic disable next-line: missing-paramter
            --         if client.supports_method('textDocument/formatting') then
            --
            --             vim.api.nvim_create_autocmd('BufWritePre', {
            --                 buffer = args.buf,
            --                 callback = function()
            --                     vim.lsp.buf.format({  bufnr = args.buf, id = client.id })
            --                 end,
            --             })
            --         end
            --     end,
            -- })
        end,
    },
}

