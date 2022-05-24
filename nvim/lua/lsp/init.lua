local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = false

local on_attach = function(client, bufnr)
   print(vim.inspect(client))
   require('lsp.actions').setActions(bufnr)
   vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
   vim.cmd([[ autocmd BufWritePre <buffer> Format ]])
   require('lsp_signature').on_attach()
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false
end

local lsp_install = require('nvim-lsp-installer')
lsp_install.on_server_ready(function(server)
   local options = {
      on_attach = on_attach,
      capabilities = capabilities,
   }

    local ok, config = pcall(require, server.name)
    if ok then
      table.insert(options, config)
    end

   server:setup(options)
end)

local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local confirmOptions = {
   behavior = cmp.ConfirmBehavior.Replace,
   select = true,
}

cmp.event:on(
   'confirm_done',
   cmp_autopairs.on_confirm_done({
      map_char = {
         text = '',
      },
   })
)
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = 'racket'

local source = {}
source.new = function()
   return setmetatable({}, { __index = source })
end


cmp.setup({
   keyword_length = 1,
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.confirm(confirmOptions)
         elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         else
            fallback()
         end
      end, {
         'i',
         's',
      }),
   },
   command = {
      cmpstatus = true
   },
   -- sources = cmp.config.souces({})
   sources = {
      { name = 'nvim_lsp', is_available = function() return false end},
      { name = 'luasnip', is_available = function() return false end},
   }
})
