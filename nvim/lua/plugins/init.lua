-- Plugins list
return require("packer").startup(function(use)
	local utils = require("utils")
	local useAndConfig, useAndSetup = utils.makeUse(use)

	-- plugin manager
	use("wbthomason/packer.nvim")

	-- themes
	use("dracula/vim")
	use("joshdick/onedark.vim")
	use("morhetz/gruvbox")

	-- language servers and extensions
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("ray-x/lsp_signature.nvim")
	useAndConfig("jose-elias-alvarez/null-ls.nvim", "null-ls", { requires = "nvim-lua/plenary.nvim" })
	use("j-hui/fidget.nvim", "fidget")

	-- auto completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	useAndConfig("L3MON4D3/LuaSnip", "luasnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	useAndSetup("windwp/nvim-autopairs", "nvim-autopairs")

	-- syntax
	use("sheerun/vim-polyglot")
	useAndConfig("nvim-treesitter/nvim-treesitter", "treesitter", { run = ":TSUpdate" })

	-- commands utilities
	use("numToStr/Comment.nvim", "Comment")
	useAndSetup("echasnovski/mini.nvim", "mini.surround")

	-- interface
	useAndConfig("folke/which-key.nvim", "which-key")

	-- file navigation
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	useAndSetup("kyazdani42/nvim-tree.lua", "nvim-tree", { requires = "kyazdani42/nvim-web-devicons" })

	-- filetypes utilities
	use("kevinoid/vim-jsonc") -- add comment syntax in json files
	use("ellisonleao/glow.nvim") -- generate markdown preview

	--require("plugins.packer")
end)
