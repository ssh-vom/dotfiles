return {
	{
		"williamboman/mason.nvim",
		opts = {
			PATH = "prepend",
		},
		lazy = false,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"basedpyright",
				"ruff",
				"clangd",
				"ts_ls",
				"rust_analyzer",
				"gopls",
				"omnisharp",
				-- "jdtls",
			},
			automatic_enable = false,
		},
		lazy = false,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"clang-format",
				"ruff",
				"goimports",
				"csharpier",
				"google-java-format",
				"rustfmt",
			},
			run_on_start = true,
		},
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-lspconfig.nvim",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local function with_capabilities(config)
				config = config or {}
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				return config
			end

			vim.lsp.config(
				"lua_ls",
				with_capabilities({
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = { enable = false },
						},
					},
				})
			)

			vim.lsp.config(
				"basedpyright",
				with_capabilities({
					settings = {
						basedpyright = {
							analysis = {
								autoImportCompletions = false,
								indexing = { enabled = false },
								useLibraryCodeForTypes = true,
								diagnosticMode = "openFilesOnly",
							},
						},
					},
				})
			)

			vim.lsp.config(
				"ruff",
				with_capabilities({
					init_options = {
						settings = {
							args = {},
						},
					},
				})
			)

			vim.lsp.config("ts_ls", with_capabilities())
			vim.lsp.config(
				"clangd",
				with_capabilities({
					cmd = { "clangd", "--background-index", "--clang-tidy" },
				})
			)
			vim.lsp.config("rust_analyzer", with_capabilities())
			vim.lsp.config("gopls", with_capabilities())
			vim.lsp.config("omnisharp", with_capabilities())
			vim.lsp.config("jdtls", with_capabilities())

			vim.lsp.enable({
				"lua_ls",
				"basedpyright",
				"ruff",
				"ts_ls",
				"clangd",
				"rust_analyzer",
				"gopls",
				"omnisharp",
				"jdtls",
			})
		end,
	},
}
