-- Identation
local tab = 2
vim.o.tabstop = tab
vim.o.softtabstop = tab
vim.o.shiftwidth = tab
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Format
vim.o.wrap = true
vim.o.textwidth = 80
vim.g.formatoptions = 'tjcroqlnv'

-- Lines
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 2
vim.o.cursorline = true
vim.o.colorcolumn = '+1'
vim.o.signcolumn = 'yes:2'
vim.o.linebreak = true
vim.o.breakindent = true

-- interface
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.cmdheight = 1
vim.o.syntax = 'on'

-- -- Navigation
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- search
vim.o.hlsearch = false
vim.o.incsearch = true

-- -- files
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false

vim.o.timeoutlen = 500
vim.o.shell = '/bin/zsh'
