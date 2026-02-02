vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.mapleader = " "
require("shivsharma.remap")
require("shivsharma.set")
require("shivsharma.lazy")


-- require("mood_music").setup()
vim.lsp.set_log_level("off")

