require'nvim-treesitter.configs'.setup {
	ensure_installed = { "vim", "javascript", "typescript", "c", "lua", "rust", "python", "java", "go", "julia", "cpp" },
	
	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,

	},
}

