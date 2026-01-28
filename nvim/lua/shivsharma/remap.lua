vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y')

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<Leader>N", "<Plug>(doge-generate)")

vim.keymap.set("n", "<leader>P", ":PasteImage<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.declaration)
vim.keymap.set("n", "gD", vim.lsp.buf.definition)

-- Navigate to the next page in the PDF
vim.keymap.set(
	"n",
	"<leader>jj",
	"<cmd>:lua require('pdfview.renderer').next_page()<CR>",
	{ desc = "PDFview: Next page" }
)

-- Navigate to the previous page in the PDF
vim.keymap.set(
	"n",
	"<leader>kk",
	"<cmd>:lua require('pdfview.renderer').previous_page()<CR>",
	{ desc = "PDFview: Previous page" }
)

vim.keymap.set("n", "<leader>c", "<cmd>:lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("n", "<leader>qf", function()
	local is_qf_open = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			is_qf_open = true
			break
		end
	end

	if is_qf_open then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { desc = "Toggle Quickfix Window" })

-- LSP: Toggle inlay hints
vim.keymap.set("n", "<leader>ih", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "Toggle inlay hints" })

-- LSP: Show diagnostics popup (K for hover, <leader>e for diagnostics)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- LSP: Hover documentation with rounded border (Shift+K)

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "python" },
	callback = function()
		vim.opt_local.makeprg = "make CURFILE=%:p"
	end,
})
