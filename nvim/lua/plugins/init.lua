-- lazy.vim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--
--
--
-- Plugins list
return require('lazy').setup({
  -- local utils = require('utils')
  -- local useAndConfig, useAndSetup = utils.makeUse(use)

  -- themes
  'dracula/vim',
  'navarasu/onedark.nvim',
  'morhetz/gruvbox',

  -- language servers and extensions
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'ray-x/lsp_signature.nvim',
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function() require('null-ls').setup() end,
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {'j-hui/fidget.nvim', config = function() require('fidget').setup() end},

  -- auto completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  { 'L3MON4D3/LuaSnip', config = function() require('luasnip').setup() end },
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  { 'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end },

  -- syntax
  'sheerun/vim-polyglot',
  {
    'nvim-treesitter/nvim-treesitter',
    -- config = function() require('nvim-treesitter').setup() end,
    -- cmd = ':TSUpdate'
  },

  -- commands utilities
  { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end },
  { 'echasnovski/mini.nvim', version = false},

  -- interface
  { 'folke/which-key.nvim', config = function() require('which-key').setup() end },

  -- file navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'kyazdani42/nvim-tree.lua',
    config = function() require('nvim-tree').setup() end,
    dependencies = 'kyazdani42/nvim-web-devicons'
  },

  -- filetypes utilities
  'kevinoid/vim-jsonc', -- add comment syntax in json file,
  'ellisonleao/glow.nvim', -- generate markdown previe,

  --require("plugins.packer")
})
