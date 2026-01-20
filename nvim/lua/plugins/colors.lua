return {
	"RedsXDD/neopywal.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		-- require("neopywal").setup({
		--     transparent_background = true,
		--     custom_colors = {},
		--     custom_highlights = {},
		--     wal = false,
		-- })
		-- vim.cmd.colorscheme("neopywal")
		vim.cmd.colorscheme("habamax")
		vim.api.nvim_set_hl(1, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.o.background = "dark"
	end,
}
