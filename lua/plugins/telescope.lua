local opts = {
  pickers = {
    find_files = {
      mappings = {
        i = {
          ["<cr>"] = "select_tab_drop",
        },
      },
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
    opts = opts,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    init = function()
      require("telescope").load_extension("frecency")
    end,
    requires = { "kkharji/sqlite.lua" },
  },
}
