return require("lazy").setup({
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
    "theprimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("harpoon").setup({
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,
        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,
        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,
        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,
        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },
        -- set marks specific to each git branch inside git repository
        mark_branch = false,
      })
    end,
    init = function()
      require("plugins.harpoon")
    end,
  },
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
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    config = require("plugins.treesitter"),
  },
  "nvim-treesitter/playground",
  {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    config = function()
      require("orgmode").setup({})
    end,
    init = function()
      require("plugins.orgmode")
    end,
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
    "hiszd/clrtheme.nvim",
    lazy = false,
    dir = "~/programming/nvim/clrtheme.nvim",
    dev = true,
    config = function()
      vim.cmd("colorscheme clrtheme")
    end,
    priority = 99,
  },
  -- UI
  "rcarriga/nvim-notify", -- Notifications Popup (Optional)
  "stevearc/dressing.nvim", -- Improved UI (Optional)
  -- "doums/lsp_spinner.nvim,
  {
    "hiszd/ztab.nvim",
    dev = true,
    dir = "~/programming/nvim/ztab.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = require("plugins.ztab").opts,
    init = require("plugins.ztab").init(),
    priority = 2,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
      -- "hiszd/clrtheme.nvim",
    },
    config = require("plugins.lualine"),
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("alpha").setup(require("alpha.themes.startify").config)
    end,
  },

  -- File managers
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = require("plugins.neotree"),
  },
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
})
