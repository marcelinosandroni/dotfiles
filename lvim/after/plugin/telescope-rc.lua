-- Telescope config
local status, telescope = pcall(require, 'telescope')
if (not status) then
  print('Telescope not found')
  return
end
telescope.load_extension('file_browser')

-- Global variable helper dot reach that content
vim.api.nvim_set_keymap('n', '<leader>e', ':Telescope file_browser<CR>', { noremap = true, silent = true })
