
function ColorMyPencils(color)

    require("vague").setup({
        transparent = true
    })
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
    color = color or "vague"
    -- color = color or "industry"
    -- color = color or 'lunaperche'
    -- color = color or "base16-black-metal-dark-funeral"
    -- color = color or 'kanagawa-dragon'
    -- color = color or 'mellifluous'
    -- color = color or 'koehler'
    -- color = color or 'modus'
    -- color = color or 'abscs' 
    -- color = color or "cyberdream"

    -- vim.o.background = "dark"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- custom_theme.setup()


end

ColorMyPencils()
