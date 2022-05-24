local null_ls = require('null-ls')
null_ls.setup({
   sources = {
      null_ls.builtins.formatting.prettierd.with({
         args = function(params)
            return params.options and params.singleQuotes
         end,
      }),
      --null_ls.builtins.diagnostics.eslintd,
      null_ls.builtins.formatting.stylua,
   },
})
