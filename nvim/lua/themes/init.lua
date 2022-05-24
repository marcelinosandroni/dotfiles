local activeTheme = 'dracula'

local themes = {
   'dracula',
   'onedark',
   'gruvbox',
}

for _, theme in ipairs(themes) do
   require('themes.' .. theme)
end

vim.o.background = 'dark'
vim.cmd('colorscheme ' .. activeTheme)

-- reload theme on file enter
-- vim.cmd('autocmd VimEnter * colorscheme ' .. activeTheme)
