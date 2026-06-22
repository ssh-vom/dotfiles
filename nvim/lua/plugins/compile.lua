return {
	lazy = false,
	"ej-shafran/compile-mode.nvim",
	version = "^5.0.0",
	-- you can just use the latest version:
	-- branch = "latest",
	-- or the most up-to-date updates:
	-- branch = "nightly",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- if you want to enable coloring of ANSI escape codes in
		-- compilation output, add:
		-- { "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = {
			default_command = {
				python = "python3 %",
				lua = "lua %",
				javascript = "bun %",
				typescript = "bun %",
				c = "cc -o %:r % && ./%:r",
				cpp = "cc -std=c++23 -o %:r % && ./%:r",
				java = "javac % && java %:r",
				go = "go run %",
			},
			input_word_completion = true,
			-- if you use something like `nvim-cmp` or `blink.cmp` for completion,
			-- set this to fix tab completion in command mode:
			-- input_word_completion = true,

			-- to add ANSI escape code support, add:
			-- baleia_setup = true,

			-- make `:Compile` replace special characters like `%`
			bang_expansion = true,
		}

		vim.api.nvim_create_user_command("CompileBelow", function(opts)
			vim.cmd({
				cmd = "Compile",
				args = opts.fargs,
				bang = opts.bang,
				mods = { split = "belowright" },
			})
		end, {
			nargs = "?",
			bang = true,
			complete = function(_, cmdline)
				local cmd = cmdline:gsub("CompileBelow%s+", "")
				return vim.fn.getcompletion(("!%s"):format(cmd), "cmdline")
			end,
			desc = "Run :Compile in a split below",
		})

		vim.keymap.set("n", "<leader>r", "<cmd>CompileBelow<CR>", { desc = "Compile below" })
	end,
}
