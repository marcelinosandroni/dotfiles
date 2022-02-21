-- general

-- Identation
local tab = 2
vim.o.tabstop = tab
vim.o.softtabstop = tab
vim.o.shiftwidth = tab
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.wrap = false

-- Lines
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- interface
vim.o.termguicolors = true
vim.osigncolumn = 'yes'

-- vim.o.colorcolumn = '+80'
vim.o.cmdheight = 1
vim.o.syntax = 'enable'

-- Navigation
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- search
vim.o.hlsearch = false
vim.opt.hlsearch = false
vim.o.incsearch = true

-- files
vim.o.hidden = true
vim.o.backup = false
vim.o.swapfile = false

-- performance
vim.o.updatetime = 50
vim.o.timeoutlen = 500
vim.o.shell = '/bin/zsh'
