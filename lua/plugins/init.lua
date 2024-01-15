return {
  -- Rust LSP stuff
  -- "simrat39/rust-tools.nvim",

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

  -- UI
  -- "rcarriga/nvim-notify",   -- Notifications Popup (Optional)
  "stevearc/dressing.nvim", -- Improved UI (Optional)
  -- "doums/lsp_spinner.nvim,

  "elkowar/yuck.vim",
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      show_dirname = false,
      show_basename = false,
    },
    init = function()
      map("n", "<C-a>", "<Cmd>:lua require('barbecue.ui').navigate(-2)<cr>",
        { noremap = true, desc = "navigate up one level" })
    end,
  },
}
