return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  -- use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use {
    "jcdickinson/codeium.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        config_path = "codeium.cfg",
      })
    end
  }

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "ur4ltz/surround.nvim",
    config = function()
      require "surround".setup { mappings_style = "sandwich" }
    end
  }

  use({
    'tpope/vim-commentary',
    requires = {
      'kyazdani42/nvim-web-devicons'
    }
  })

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- Theming and color
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'kyazdani42/nvim-web-devicons'

  use "rcarriga/nvim-notify" -- Notifications Popup (Optional)
  use "stevearc/dressing.nvim" -- Improved UI (Optional)

  use '~/programming/nvim/clrtheme.nvim'
  -- use 'hiszd/clrtheme.nvim'
  use 'tjdevries/colorbuddy.nvim'
  use 'norcalli/nvim-colorizer.lua'

  -- File managers
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  })
  use 'miversen33/netman.nvim'

  use({
    "l3mon4d3/luasnip",
    -- tag = "v<CurrentMajor>.*",
    -- event = "BufReadPre",
    -- wants = "friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    requires = {
      "rafamadriz/friendly-snippets",
    },
  })

  use 'saadparwaiz1/cmp_luasnip'
  use 'ray-x/cmp-treesitter'

  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'nvim-treesitter/playground'
  use {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup {}
    end
  }

  use 'famiu/nvim-reload'

  use 'chriskempson/base16-vim'
  use 'xolox/vim-colorscheme-switcher'
  use 'xolox/vim-misc'


  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'lewis6991/gitsigns.nvim'
      ,
      opt = true
    }
  }

  use 'doums/lsp_spinner.nvim'
  use { '~/programming/nvim/ztab.nvim', requires = 'nvim-tree/nvim-web-devicons' }
  -- use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }
  -- use({
  --   "romgrk/barbar.nvim",
  --   requires = { "kyazdani42/nvim-web-devicons" },
  --   config = function()
  --   end,
  -- })

  -- Terminal stuff
  use({
    "s1n7ax/nvim-terminal",
    config = function()
      require('nvim-terminal').setup({
        disable_default_keymaps = true,
      })
    end,
  })

  -- Rust stuff
  use 'simrat39/rust-tools.nvim'
end)
