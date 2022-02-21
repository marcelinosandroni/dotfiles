local activeTheme = 'dracula'

local themes = {
  'onedark',
  'dracula'
}

for _, theme in ipairs(themes) do
  require('themes.' .. theme)
end

vim.cmd('colorscheme ' .. activeTheme)
