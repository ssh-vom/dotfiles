return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = { "lua_ls", "basedpyright", "ruff" },
		},
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
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- Subtle diagnostic display (Helix-style: minimal but visible)
			vim.diagnostic.config({
				virtual_text = {
					prefix = "",
					suffix = "",
					spacing = 2,
					source = false,
					-- Only show for current line to reduce clutter
					current_line = true,
				format = function(diagnostic)
					-- Wrap messages to fit within viewport
					local message = diagnostic.message
					local window_width = vim.api.nvim_win_get_width(0)
					local col = vim.fn.col(".")
					local available_width = window_width - col - 4
					local max_width = math.min(80, math.max(40, available_width))

					if #message <= max_width then
						return message
					end

					-- Wrap at word boundaries
					local lines = {}
					local current_line = ""

					for word in message:gmatch("%S+") do
						if #current_line + #word + 1 <= max_width then
							current_line = current_line == "" and word or current_line .. " " .. word
						else
							table.insert(lines, current_line)
							current_line = word
						end
					end
					table.insert(lines, current_line)

					return table.concat(lines, "\n" .. string.rep(" ", 4))
				end,
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "●",
						[vim.diagnostic.severity.WARN] = "●",
						[vim.diagnostic.severity.HINT] = "●",
						[vim.diagnostic.severity.INFO] = "●",
					},
					numhl = {
						[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
						[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
						[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
						[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
					},
				},
				underline = {
					severity = { min = vim.diagnostic.severity.WARN },
				},
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "single",
					source = "if_many",
					header = "",
					prefix = "",
					max_width = 80,
					max_height = 20,
				},
			})

			-- Enhanced hover with rounded border
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				max_width = 80,
				max_height = 20,
			})

			-- Enhanced signature help
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "single",
				max_width = 80,
				max_height = 10,
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
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

			-- Python: basedpyright
			vim.lsp.config("basedpyright", {
				capabilities = capabilities,
				settings = {
					basedpyright = {
						analysis = {
							autoImportCompletions = false,
							indexing = { enabled = false },
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
							inlayHints = {
								callArgumentNames = true,
								functionReturnTypes = true,
								variableTypes = true,
							},
							typeCheckingMode = "recommended",
						},
					},
				},
			})

			vim.lsp.config("ruff", {
				capabilities = capabilities,
				init_options = {
					settings = {
						args = {},
					},
				},
			})

			-- Inlay hints disabled by default - toggle with <leader>ih
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.server_capabilities.inlayHintProvider then
						-- Disabled by default for cleaner look
						vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
					end
				end,
			})
		end,
	},
}
