local map = require('utils').map
local opts = { noremap = true, silent = true }
local mappings = {
   {'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>'},
   {'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'},
   {'K', '<cmd>lua vim.lsp.buf.hover()<CR>'},
   {'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>'},
   {'<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>'},
   {'<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>'},
   {'<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>'},
   {'<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',},
   {'<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',},
   {'gr', '<cmd>lua vim.lsp.buf.references()<CR>',},
   {'<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',},
   {
      '<leader>wl',
      '<cmd>lua \z
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>'
   },
   {
      '<leader>so',
      [[<cmd>lua \z
      require('telescope.builtin').lsp_document_symbols()<CR>]]
   },
}

local M = {}

M.setActions = function(bufnr)
   for _, mapping in pairs(mappings) do
      map.lsp(bufnr, mapping[1], mapping[2], opts)
   end
end

return M
