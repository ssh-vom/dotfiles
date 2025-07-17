

return {
    "vague2k/vague.nvim",
    lazy=false,
    priority=1000,
    config = function()
    require("vague").setup({
        transparent = true
    })

    local color = "vague"

    -- color = "industry"
	-- color = color or "rose-pine"
    -- color = color or "tokyodark"
    -- color = color or "moonfly"
    -- color = color or "oldworld"
    -- color = color or "nightcity"
    -- color = color or 'lackluster'
    -- color = color or 'miasma'
    -- color = color or "nord"
    -- color = color or "dracula"
    -- color = color or "catppuccin"
    -- color = color or "gruvbox"
    -- color = color or "vague"

    -- color = color or 'lunaperche'
    -- color = color or "base16-black-metal-dark-funeral"
    -- color = color or 'kanagawa-dragon'
    -- color = color or 'mellifluous'
    -- color = color or 'koehler'
    -- color = color or 'modus'
    -- color = color or 'abscs' 
    -- color = color or "cyberdream"

    vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.o.background = "dark"

end,
}
