AAAAAAAAAA
local util = require('lspconfig/util')
local settings = {
   root_dir = function(fileName)
      return util.root_pattern(
         'package.json',
         'tsconfig.json',
         'jsconfig.json',
         '.git',
         fileName
      ) or util.path.dirname(fileName)
   end,
}

local M = {}

M.setup = function(on_attach, capabilities)
   require('lspconfig').tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
   })
end

return M
