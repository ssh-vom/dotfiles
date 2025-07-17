vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

    use
    {'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
}

	use ({ 'rose-pine/neovim',
		as = 'rose-pine' ,
		config = function()
			vim.cmd('colorscheme rose-pine')
	end
})
	use({
		"NStefan002/speedtyper.nvim",
		config = function()
			require("speedtyper").setup({
				-- your config
			})
		end,
	})

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')

	use('mbbill/undotree')

	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {

			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
        }

    }

    use('stevearc/dressing.nvim')

    use('MunifTanjim/nui.nvim')

    use('yetone/avante.nvim')

    use("LintaoAmons/scratch.nvim")

    use ('tpope/vim-commentary')



end)
