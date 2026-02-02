return {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "latex" },

    init = function()
        vim.g.vimtex_view_method = "skim"
    end
}
