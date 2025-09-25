return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            latex = { "tex-fmt" },
            typst = { "typstfmt" },
            cpp = { "clang-format" },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 500,
        },
    },
}
