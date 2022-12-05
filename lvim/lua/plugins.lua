if (not lvim) then
  print("lvim global variable not found")
  return
end
lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    command = require "lsp_signature".setup()
  },
  {
    "github/copilot.vim",
  },
  { "jose-elias-alvarez/nvim-lsp-ts-utils" },
  { "kylechui/nvim-surround", config = function() require 'nvim-surround'.setup() end },
  { "uga-rosa/translate.nvim", config = function() require 'translate'.setup {} end },
  { "weirongxu/plantuml-previewer.vim", requires = "tyru/open-browser.vim" }, -- plantUML previewer
  { "aklt/plantuml-syntax" }, -- plantUML Syntax
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "windwp/nvim-ts-autotag" },
  { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }
}
