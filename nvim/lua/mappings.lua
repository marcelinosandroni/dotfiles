local map = require('utils').map

vim.g.mapleader = ' '

-- buffer navigation
map.normal('<leader>n', ':bn<cr>')
map.normal('<leader>p', ':bp<cr>')
map.normal('<leader>q', ':bd<cr>')
map.normal('<leader>l', ':ls<cr>')

-- telescope file finder
local telescope = require('telescope.builtin')
local mapTelescope = function(keys, option)
   map.normal('<leader>' .. keys, ':Telescope ' .. option .. '<cr>')
end

mapTelescope('ff', 'find_files')
mapTelescope('fg', 'live_grep')
mapTelescope('fb', 'buffers')
mapTelescope('fh', 'help_tags')
