return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- Mason.nvim and all requirements
  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
  })
  use({
    "jay-babu/mason-null-ls.nvim",
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
      "MunifTanjim/prettier.nvim",
    },
  })
  -- Rust LSP stuff
  use("simrat39/rust-tools.nvim")

  -- nvim-cmp and all its requirements
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "ray-x/cmp-treesitter",
    },
  })
  use({
    "jcdickinson/codeium.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        config_path = "~/.config/nvim/codeium.cfg",
      })
    end,
  })

  -- Utilities
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use({
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup({ mappings_style = "sandwich" })
    end,
  })
  use({
    "tpope/vim-commentary",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("nvim-treesitter/playground")
  use({
    "nvim-orgmode/orgmode",
    config = function()
      require("orgmode").setup({})
    end,
  })
  use("famiu/nvim-reload")

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- Theming and color
  use("chriskempson/base16-vim")
  use("xolox/vim-colorscheme-switcher")
  use("xolox/vim-misc")
  use("norcalli/nvim-colorizer.lua")
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use("kyazdani42/nvim-web-devicons")
  use({
    "hiszd/clrtheme.nvim",
    requires = {
      "tjdevries/colorbuddy.nvim",
    },
  })
  -- UI
  use("rcarriga/nvim-notify")  -- Notifications Popup (Optional)
  use("stevearc/dressing.nvim") -- Improved UI (Optional)
  -- use("doums/lsp_spinner.nvim")
  use({ "hiszd/ztab.nvim", requires = "nvim-tree/nvim-web-devicons" })
  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
      opt = true,
    },
  })

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
  use("miversen33/netman.nvim")

  -- Snippet manager
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

  -- Terminal stuff
  use({
    "s1n7ax/nvim-terminal",
    config = function()
      require("nvim-terminal").setup({
        disable_default_keymaps = true,
      })
    end,
  })
end)
