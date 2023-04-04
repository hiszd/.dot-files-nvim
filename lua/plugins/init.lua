return {
  -- Mason.nvim and all requirements
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      "MunifTanjim/prettier.nvim",
    },
  },
  -- Rust LSP stuff
  "simrat39/rust-tools.nvim",

  -- nvim-cmp and all its requirements
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "ray-x/cmp-treesitter",
    },
  },
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        config_path = "/home/zion/.config/nvim/codeium.cfg",
      })
    end,
  },

  -- Utilities
  "tpope/vim-fugitive",
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup({ mappings_style = "sandwich" })
    end,
  },
  {
    "tpope/vim-commentary",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  "famiu/nvim-reload",

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Theming and color
  "chriskempson/base16-vim",
  -- "xolox/vim-colorscheme-switcher",
  "xolox/vim-misc",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  "kyazdani42/nvim-web-devicons",
  {
    "hiszd/fleet.nvim",
    dir = "~/programming/nvim/fleet.nvim",
    dev = true,
    name = "fleet",
    -- priority = 99,
  },
  {
    "hiszd/clrtheme.nvim",
    dir = "~/programming/nvim/clrtheme.nvim",
    dev = true,
    name = "clrtheme",
    config = function()
      vim.cmd("colorscheme clrtheme")
    end,
    priority = 99,
  },
  -- UI
  "rcarriga/nvim-notify",  -- Notifications Popup (Optional)
  "stevearc/dressing.nvim", -- Improved UI (Optional)
  -- "doums/lsp_spinner.nvim,
  {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  -- File managers
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  },
  "miversen33/netman.nvim",

  -- Snippet manager
  {
    "l3mon4d3/luasnip",
    -- tag = "v<CurrentMajor>.*",
    -- event = "BufReadPre",
    -- wants = "friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- Terminal stuff
  -- {
  --   "s1n7ax/nvim-terminal",
  --   config = function()
  --     require("nvim-terminal").setup({
  --       disable_default_keymaps = true,
  --     })
  --   end,
  -- },
}
