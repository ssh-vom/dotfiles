return {
    'nvim-treesitter/nvim-treesitter',
    branch='master',
    lazy=false,
    build=':TSUpdate',
    opts = {
        ensure_installed = {
            "vim", "javascript", "typescript", "c", "go", "lua", "rust",
            "python", "java", "cpp", "norg"
        },
        highlight = { enable = true },
        sync_install = false,
        auto_install = false
    },
}
