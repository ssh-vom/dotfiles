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

	{
		"ficcdaf/ashen.nvim",
	},
	{
		"ramojus/mellifluous.nvim",
	},
	{ "atelierbram/Base2Tone-nvim" },
	{ "abreujp/scholar.nvim" },
	{ "cpplain/flexoki.nvim" },
	{
		"f4z3r/gruvbox-material.nvim",
		name = "gruvbox-material",
		lazy = false,
		priority = 1000,
	},
	{
		"romanaverin/charleston.nvim",
		name = "charleston",
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
			})
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{ "rktjmp/lush.nvim" },
	{
		"CosecSecCot/cosec-twilight.nvim",
		name = "cosec-twilight",
		lazy = false,
	},
	{
		"phha/zenburn.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		name = "zenburn",
		lazy = false,
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		name = "zenbones",
		lazy = false,
	},
	{
		"rockyzhang24/arctic.nvim",
		dependencies = { "rktjmp/lush.nvim" },
		name = "arctic",
		branch = "main",
	},
	{ "projekt0n/github-nvim-theme", name = "github-theme", lazy = false },
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
	},
	{
		"nkxxll/ghostty-default-style-dark.nvim",
		lazy = false,
	},
	{
		"RRethy/nvim-base16",
		lazy = false,
	},
	{ "nyoom-engineering/oxocarbon.nvim", lazy = false },
	{ "Mofiqul/dracula.nvim", lazy = false },
}
