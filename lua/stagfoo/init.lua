-- add telescope for finding files
-- add coc for yarn pnp
-- add helper script? maybbe a note that i can show?
-- luasnip for templates
-- prettier on save
-- custom keymap
-- - ctrl p
-- - jump to definition
-- nvimtree
-- zellij.nvims:
--
-- Specify the path to the plugin


-- PLUGINS
-- require('plugins.telescope_config').setup()
-- require('plugins.fern_config').setup()
-- require('plugins.coc_config').setup()

--Yarn Zip
require('stagfoo.remap')
vim.g.rzipPlugin_extra_ext = '*.odt,*.mfh'


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  requires = { {'nvim-lua/plenary.nvim'} }
 }
 use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
 use( 'ThePrimeagen/harpoon')
end)



