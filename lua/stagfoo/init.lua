-- add telescope for finding files
-- add coc for yarn pnp
-- add helper script? maybbe a note that i can show?
-- luasnip for templates
-- prettier on save
-- custom keymap
-- - [x]ctrl p
-- - jump to definition
-- nvimtree
-- zellij.nvims:
--
-- Specify the path to the plugin


--Remaps
require('stagfoo.remap')

-- READ FOR ESLINT ISSUE 
-- https://github.com/neovim/nvim-lspconfig/issues/1872

-- Yarn Shenanigans
vim.g.rzipPlugin_extra_ext = '*.odt,*.mfh'


-- Plugin Manager
vim.cmd [[packadd packer.nvim]]
vim.cmd("colorscheme rose-pine")

return require('packer').startup(function(use)
-- Packer can manage itself
 use 'rose-pine/neovim'
 use 'wbthomason/packer.nvim'
 use 'lbrayner/vim-rzip'
 use {'nvim-telescope/telescope.nvim', tag = '0.1.5', requires = { {'nvim-lua/plenary.nvim'} }}
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
 use  ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
 use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
 }
 use 'mbbill/undotree'
use({
  "WilsonOh/emoji_picker-nvim",
  config = function()
    require("emoji_picker").setup()
  end,
})
 use('neovim/nvim-lspconfig')
 use('jose-elias-alvarez/null-ls.nvim')
 use {
    'akinsho/flutter-tools.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
    },
}
 use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
     {'williamboman/mason.nvim'},
     {'williamboman/mason-lspconfig.nvim'},
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},

  }
}
end)
