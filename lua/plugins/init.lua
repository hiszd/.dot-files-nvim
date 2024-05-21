return {

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
    'folke/todo-comments.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    opts = {
      signs = false,
      keywords = {
        TODO = { color = "todo" },
        ERROR = { color = "error" },
        WARNING = { color = "warning" },
        INFO = { color = "info" },
        HINT = { color = "hint" },
        TEST = { color = "test" },
      },
      colors = {
        todo = { "@comment.todo" },
        -- TODO:
        error = { "@comment.error" },
        -- ERROR:
        warning = { "@comment.warn" },
        -- WARN:
        info = { "@comment.info" },
        -- INFO:
        hint = { "@comment.hint" },
        -- HINT:
      },
    }
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
      local map = map_impl("Barbecue")
      map({ "n" }, "<C-a>", "<Cmd>:lua require('barbecue.ui').navigate(-2)<cr>",
        { noremap = true, desc = "navigate up one level" })
    end,
  },
}
