return {
	"RedsXDD/neopywal.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("neopywal").setup({
			transparent_background = false,
			custom_colors = {},
			custom_highlights = {},
			wal = false,
		})
		-- vim.cmd.colorscheme("neopywal")
		-- vim.cmd.colorscheme("mellifluous")
		-- vim.cmd.colorscheme("base2tone_desert_dark")
		-- vim.cmd.colorscheme("scholar")
		vim.cmd.colorscheme("flexoki")
		-- vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.o.background = "dark"
	end,
	-- require("vague").setup({
	--     transparent = true
}
--
--         -- local color = "vague"
--         -- local color = "adwaita"
--         -- local color = "solarized"
--         -- local color = "rose-pine"
--
--         -- color = "industry"
--         -- color = color or "rose-pine"
--         -- color = color or "tokyodark"
--         -- color = color or "moonfly"
--         -- color = color or "oldworld"
--         -- color = color or "nightcity"
--         -- color = color or 'lackluster'
--         -- color = color or 'miasma'
--         -- color = color or "nord"
--         -- color = color or "dracula"
--         -- color = color or "catppuccin"
--         -- color = color or "gruvbox"
--         -- color = color or "fahrenheit"
--         -- color = color or "vague"
--         -- color = color or 'lunaperche'
--         -- color = color or "base16-black-metal-dark-funeral"
--         -- color = color or 'kanagawa-dragon'
--         color = color or 'mellifluous'
--         config = function()
--             require(color.mellifluous).setup({
--                 transparent = true })
--         end
--         -- color = color or "gruber-darker"
--
--         -- color = color or 'koehler'
--         -- color = color or 'modus'
--         -- color = color or 'abscs'
--         -- color = color or "cyberdream"
--
--
--
--     end,
-- }
