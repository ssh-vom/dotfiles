vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")


vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")


vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set('n', '<Leader>N', '<Plug>(doge-generate)')

vim.keymap.set('n', '<leader>P', ':PasteImage<CR>')

vim.keymap.set('n', '<leader>qf', function()
    local is_qf_open = false
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            is_qf_open = true
            break
        end
    end

    if is_qf_open then
        vim.cmd('cclose')
    else
        vim.cmd('copen')
    end
end, { desc = "Toggle Quickfix Window" })

local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "python" },
    callback = function()
        vim.opt_local.makeprg = "make CURFILE=%:p"
    end,
})

-- vim.keymap.set("n", '<Leader>N', ":lua require('neogen').generate()<CR>", opts)
