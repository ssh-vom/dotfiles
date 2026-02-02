return {
    { 'nvim-lua/plenary.nvim' },
    { 'MunifTanjim/nui.nvim' },
    { 'MeanderingProgrammer/render-markdown.nvim', ft = { "markdown" } },
    { 'hrsh7th/nvim-cmp' },
    { 'nvim-tree/nvim-web-devicons' },
    {
        event = "VeryLazy",
        'HakonHarnes/img-clip.nvim',
    },
    { 'zbirenbaum/copilot.lua' },
    { 'stevearc/dressing.nvim', event = "VeryLazy" },
    { 'nvim-neorg/lua-utils.nvim' },
    { 'pysan3/pathlib.nvim' },
    { "tiagovla/tokyodark.nvim" },
    {
        "nvim-neorg/neorg",
        version = "7.0.0",
        ft = "norg",
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
    { 'nvim-treesitter/playground', cmd = { "TSPlaygroundToggle", "TSPlayground" } },
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
        ft = { "asciidoc" },
        config = function()
            require('adoc_pdf_live').setup()
        end
    },
    {
        'nvim-orgmode/orgmode',
        ft = { "org" },
        config = function()
            require('orgmode').setup {}
        end
    },
    {
        "giusgad/pets.nvim",
        event = "VeryLazy",
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
        ft = { "typst" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        keys = { "<leader>e" },
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
