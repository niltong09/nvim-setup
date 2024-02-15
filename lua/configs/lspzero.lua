local lsp = require("lsp-zero")

lsp.preset("recommended")


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n","gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n","K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n","<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n","<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n","[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n","]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n","<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n","<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n","<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i","<C-h>", function() vim.lsp.buf.signatore_help() end, opts)
end)


-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'eslint','tsserver', 'rust_analyzer', 'bashls', 'cssls', 'dockerls', 'graphql', 'html', 'jsonls', 'lua_ls', 'intelephense', 'pyre', 'tailwindcss', 'volar'},
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

lsp.setup()
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.tsserver.setup({
  capabilities = capabilities
})
lspconfig.eslint.setup({
  capabilities = capabilities
})
lspconfig.lua_ls.setup({
  capabilities = capabilities
})
lspconfig.intelephense.setup({
  capabilities = capabilities
})
lspconfig.volar.setup({
  capabilities = capabilities
})
lspconfig.tailwindcss.setup({
  capabilities = capabilities
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'ultisnips', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  formatting = lsp.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

