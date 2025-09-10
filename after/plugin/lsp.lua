local lsp_zero = require('lsp-zero')
local keymaps = require('stagfoo.keymaps')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", keymaps.lsp.jump, function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", keymaps.lsp.hover, function() vim.lsp.buf.hover() end, opts)
  
  -- some kind of search?? kinda weird
  --vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", keymaps.lsp.problems, function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", keymaps.lsp.prev_problems, function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", keymaps.lsp.next_problems, function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", keymaps.lsp.code_actions, function() vim.lsp.buf.code_action() end, opts)
  
  -- quicklist, its kinda weird way to see reference
  --vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)

  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'rust_analyzer', 'biome', 'ts_ls', 'jenkins_pipeline_linter_connector', 'prettier', 'yamlls'},
  handlers = {
    lsp_zero.default_setup,
    biome = function()
      require('lspconfig').biome.setup({
        single_file_support = true,
        filetypes = { 'javascript', 'javascriptreact', 'json', 'jsonc', 'typescript', 'typescript.tsx', 'typescriptreact' },
        on_attach = function(client, bufnr)
          print('Biome LSP attached')
        end
      })
    end,
    ts_ls = function()
      require('lspconfig').ts_ls.setup({
        filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        on_attach = function(client, bufnr)
          -- Disable tsserver formatting since biome handles that
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      })
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

    ['<Tab>'] = cmp.mapping.confirm({ select = true }),

    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
