vim.g.mapleader = ' '

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- autocmd ---
--
local fileForGroovy = vim.api.nvim_create_augroup("files_for_groovy", { clear = true })

-- Create the autocommand
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = fileForGroovy,
  pattern = "Jenkinsfile",
  command = "set filetype=groovy",
})




-- Plugin Manager
require("lazy").setup({
  'rose-pine/neovim',
  'lbrayner/vim-rzip',
  { 'nvim-telescope/telescope.nvim',   tag = '0.1.5',      dependencies = { 'nvim-lua/plenary.nvim' } },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  "nvim-lua/plenary.nvim",
  
  { 'niqodea/lasso.nvim' },
  {
    "WilsonOh/emoji_picker-nvim",
    config = function()
      require("emoji_picker").setup()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<leader>/',
          block = '<leader>?',
        },
        opleader = {
          line = '<leader>/',
          block = '<leader>?',
        },
      })
    end,
  },
{
  'yetone/avante.nvim', -- Main plugin: avante.nvim
  dependencies = {
    -- Dependency 1: The UI library that was missing
    'muniftanjim/nui.nvim',

    -- Dependency 2: The Cody provider with its own configuration
    {
      'brewinski/avante-cody.nvim',
      opts = {
        providers = {
          ['avante-cody'] = {
            -- The name of the environment variable holding your token.
            -- Using 'SRC_ACCESS_TOKEN' is a common convention.
            api_key_name = 'SRC_ACCESS_TOKEN',
            -- This is optional, defaults to sourcegraph.com
            endpoint = 'https://sourcegraph.com',
          },
        },
      },
    },
  },
  -- Configuration for avante.nvim itself
  opts = {
    provider = "avante-cody", -- This tells avante to use the Cody provider
  },
},
  'neovim/nvim-lspconfig',
  'nvimtools/none-ls.nvim',
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'luukvbaal/nnn.nvim',
    config = function()
      require('nnn').setup({
        picker = {
          mappings = {
            { 
              '<Right>', 
              function(picker)
                local selection = picker:get_selection_path()
                if vim.fn.isdirectory(selection) == 1 then
                  picker:cd(selection)
                else
                  picker:close()
                  vim.cmd('edit ' .. vim.fn.fnameescape(selection))
                end
              end
            },
          },
        },
      })
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
})

--Remaps
require('stagfoo.remap')
