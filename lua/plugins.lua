return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'tpope/vim-commentary'
  use 'kyazdani42/nvim-web-devicons'

  use '/home/zion/programming/clrtheme.nvim/'
  use 'tjdevries/colorbuddy.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- File finders
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  })

  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'ray-x/cmp-treesitter'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use { 'nvim-orgmode/orgmode', config = function()
    require('orgmode').setup {}
  end
  }
  use 'famiu/nvim-reload'

  use 'chriskempson/base16-vim'
  use 'xolox/vim-colorscheme-switcher'
  use 'xolox/vim-misc'
  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use 'doums/lsp_spinner.nvim'
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() end,
  })
end)
