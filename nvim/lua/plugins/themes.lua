return {
	{ "datsfilipe/vesper.nvim" },
	{
		"roerohan/orng.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("orng").setup({
				variant = "dark", -- "dark" or "light"
				transparent = false,
				italic_comment = false,
			})
		end,
	},
	{ "yorumicolors/yorumi.nvim" },
	{ "vague-theme/vague.nvim" },
	{ "savq/melange-nvim" },
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				bold = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
			})
		end,
	},
}
