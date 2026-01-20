return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
    },
    { 'nvim-lua/plenary.nvim' },
    { 'MunifTanjim/nui.nvim' },
    { 'MeanderingProgrammer/render-markdown.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        lazy = false,
        'HakonHarnes/img-clip.nvim',
    },
    { 'zbirenbaum/copilot.lua' },
    { 'stevearc/dressing.nvim' },
    { 'folke/snacks.nvim' },
    { 'nvim-neorg/lua-utils.nvim' },
    { 'pysan3/pathlib.nvim' },
    { 'nvim-neotest/nvim-nio' },
    { "tiagovla/tokyodark.nvim" },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        "nvim-neorg/neorg",
        version = "7.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require('neorg').setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman.utils"] = {},
                    ["core.ui"] = {},
                    ["core.esupports.hop"] = {},
                    ['core.export'] = {},
                },
            })
        end
    },
    { 'nvim-treesitter/playground' },
    { 'theprimeagen/harpoon' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    { "LintaoAmons/scratch.nvim" },
    { 'tpope/vim-commentary' },
    { 'bluz71/vim-moonfly-colors' },
    { 'dgox16/oldworld.nvim' },
    {
        'kkoomen/vim-doge',
        build = ':call doge#install()'
    },
    {
        'cryptomilk/nightcity.nvim',
        config = function()
            require('nightcity').setup({
                style = 'kabuki',
                terminal_colors = true,
            })
        end,
    },
    {
        'marioortizmanero/adoc-pdf-live.nvim',
        config = function()
            require('adoc_pdf_live').setup()
        end
    },
    {
        'lervag/vimtex',
        config = function()
            vim.g.vimtex_view_general_options = ''
            vim.g.vimtex_view_method = 'skim'
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
        end
    },
    {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup {}
        end
    },
    {
        "giusgad/pets.nvim",
        dependencies = {
            "giusgad/hologram.nvim",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require('pets').setup()
        end
    },
    { 'ThePrimeagen/vim-be-good' },
    { "xero/miasma.nvim" },
    { 'RRethy/nvim-base16' },
    -- {
    --     'augmentcode/augment.vim',
    --     config = function()
    --         vim.g.augment_enable = false
    --     end
    -- },
    { "kiyoon/magick.nvim" },
    { "miikanissi/modus-themes.nvim" },
    { 'NTBBloodbath/sweetie.nvim' },
    { 'Abstract-IDE/Abstract-cs' },
    { 'sponkurtus2/angelic.nvim' },
    {
        'chomosuke/typst-preview.nvim',
        config = function()
            require 'typst-preview'.setup {}
        end,
        lazy = false,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                window = {
                    width = 20,
                },
            })
            vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')
        end
    },
    {
        "olimorris/codecompanion.nvim",
        config = function()
            require("codecompanion").setup()
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        }
    },
    { 'vague2k/vague.nvim' },
    { "ramojus/mellifluous.nvim" },
    {
        "Mofiqul/adwaita.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.adwaita_darker = true
            vim.g.adwaita_transparent = true
        end
    },
    { "blazkowolf/gruber-darker.nvim" },
    {
        "fcpg/vim-fahrenheit" },

}
