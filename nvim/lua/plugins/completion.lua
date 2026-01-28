return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },
	-- use a release tag to download pre-built binaries
	version = "1.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			menu = { border = "single" },
			documentation = { window = { border = "single" } },
		},
		signature = { enabled = true, window = { border = "single" } },
	},
	snippets = {
		enabled = true,
		window = { border = "single" },
	},
}
