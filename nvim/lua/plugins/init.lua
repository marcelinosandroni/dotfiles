-- verify plugin manager install
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- auto install when plugin list is changed
vim.cmd([[
  augroup packer_user_config
   autocmd!
    autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerSync
  augroup end
]])

local config = function(name)
  return {
    config = require('plugins.' .. name)
  }
end

local setup = function(name)
  return {
    run = require(name).setup()
  }
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- themes
  use 'dracula/vim'
  use 'morhetz/gruvbox'

  use 'neovim/nvim-lspconfig' -- lsp server
  use 'hrsh7th/nvim-cmp' -- autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- lsp source for cmp
  use 'saadparwaiz1/cmp_luasnip' -- lua source for cmp
  use 'L3MON4D3/LuaSnip'
  use 'ray-x/lsp_signature.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'folke/which-key.nvim', config = function()
    require('which-key').setup {
      plugins = {
        spelling = {
          enabled = true
        }
      }
    }
    end
  }

  use { 'windwp/nvim-autopairs', setup('nvim-autopairs')}
  use 'ellisonleao/glow.nvim'
  use { 'j-hui/fidget.nvim', setup('fidget')}
  use { 'echasnovski/mini.nvim', setup('mini.surround')}
  use {'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim'}}

  if packer_bootstrap then
    require('packer').sync()
  end
end)
