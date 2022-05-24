require('telescope').setup({
   defaults = {
      file_ignore_patterns = {
         'node_moduels',
         'dist',
         '.yarn',
         '.git',
      },
   },
})
