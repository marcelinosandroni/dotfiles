local config = {
   plugins = {
      marks = true,
      registers = true,
      spelling = {
         enabled = true,
         suggestions = 20,
      },
   },
}

require('which-key').setup(config)
