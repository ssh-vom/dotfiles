-- Require the necessary modules
local lsp = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

-- Set up mason
mason.setup()

-- Set up mason-lspconfig
mason_lspconfig.setup{
  ensure_installed = {
    'pyright',        -- Python
    'tsserver',       -- TypeScript/JavaScript
    'eslint',         -- ESLint for linting
    'lua_ls',         -- Lua
    'rust_analyzer',  -- Rust
    'clangd',         -- C/C++
    'gopls',          -- Go
  },
}

-- Configure lsp-zero
lsp.preset('recommended')

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete()
})

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = cmp_mappings,
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
})


lsp.set_preferences({
  sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.lsp.buf.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.lsp.buf.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Set up the LSP servers
mason_lspconfig.setup_handlers({
  function(server_name)
    if server_name == "pyright" then
      require'lspconfig'.pyright.setup{}
    else
      lspconfig[server_name].setup{}
    end
  end,
})

-- Finalize setup
lsp.setup()
