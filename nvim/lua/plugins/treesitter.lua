return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/playground",
	},
	opts = {
		ensure_installed = {
			-- core
			"vim",
			"lua",
			"vimdoc",

			-- web
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",

			-- systems
			"c",
			"cpp",
			"rust",
			"go",

			-- scripting / backend
			"python",
			"bash",
			"java",

			-- notes / misc
			"json",
			"yaml",
			"toml",
			"markdown",
			"markdown_inline",
			"norg",
		},

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = true,
		},

		autotag = {
			enable = true,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				scope_incremental = "<S-CR>",
				node_decremental = "<BS>",
			},
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
				},
			},

			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
		},

		playground = {
			enable = true,
			updatetime = 25,
			persist_queries = true,
		},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		-- folding powered by treesitter
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = false

		-- disable for large files (huge perf win)
		local ts_disable = function(_, bufnr)
			local max_filesize = 200 * 1024 -- 200 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end

		require("nvim-treesitter.configs").setup({
			highlight = { disable = ts_disable },
			indent = { disable = ts_disable },
		})
	end,
}
