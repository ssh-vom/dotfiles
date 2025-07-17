return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = {
            "vim", "javascript", "typescript", "c", "go", "lua", "rust",
            "python", "java", "cpp", "norg"
        },
        highlight = {enable = true},
        sync_install = false,
        auto_install = false
    },
    build = ':TSUpdate'
}

