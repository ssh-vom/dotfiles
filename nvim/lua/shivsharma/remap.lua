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

local function compile_prompt()
	local default_cmd = vim.g.compile_command or vim.bo.makeprg or ""
	local cmd = vim.fn.input("Compile command: ", default_cmd, "shellcmd")
	if cmd == "" then
		return
	end

	vim.g.compile_command = cmd

	local prev_makeprg = vim.bo.makeprg
	vim.bo.makeprg = cmd

	local ok = pcall(vim.cmd, "Make!")
	if not ok then
		vim.cmd("silent make!")
		local qf = vim.fn.getqflist()
		if type(qf) == "table" and not vim.tbl_isempty(qf) then
			vim.cmd("cwindow")
		end
	end

	vim.bo.makeprg = prev_makeprg
end

vim.keymap.set("n", "<leader>c", compile_prompt, { desc = "Compile command" })

local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "python" },
	callback = function()
		vim.opt_local.makeprg = "make CURFILE=%:p"
	end,
})
