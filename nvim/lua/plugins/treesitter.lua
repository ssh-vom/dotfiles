return {
    'nvim-treesitter/nvim-treesitter',
    branch='master',
    event = { "BufReadPost", "BufNewFile" },
    build=':TSUpdate',
    opts = {
        ensure_installed = {
            "vim", "javascript", "typescript", "c", "go", "lua", "rust",
            "python", "java", "cpp", "norg"
        },
        highlight = {
            enable = true,
            -- Avoid heavy highlight work on very large files
            disable = function(lang, buf)
                local max_filesize = 200 * 1024 -- 200 KB
                local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
                return false
            end,
        },
        sync_install = false,
        auto_install = false
    },
}
