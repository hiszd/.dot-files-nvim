local init = function()
  require("mini.pairs").setup({})

  require("mini.sessions").setup({})

  require("mini.surround").setup({
    mappings = {
      add = "<leader>sa",         -- Add surrounding in Normal and Visual modes
      delete = "<leader>sd",      -- Delete surrounding
      find = "<leader>sf",        -- Find surrounding (to the right)
      find_left = "<leader>sF",   -- Find surrounding (to the left)
      highlight = "<leader>sh",   -- Highlight surrounding
      replace = "<leader>sr",     -- Replace surrounding
      update_n_lines = "<leader>sn", -- Update `n_lines`
      suffix_last = "",           -- Suffix to search with "prev" method
      suffix_next = "",           -- Suffix to search with "next" method
    },
  })

  require("mini.starter").setup({
    evaluate_single = true,
    items = {
      require("mini.starter").sections.recent_files(5, true),
      require("mini.starter").sections.telescope(),
      require("mini.starter").sections.builtin_actions(),
      require("mini.starter").sections.recent_files(2, false),
      -- Use this if you set up 'mini.sessions'
      require("mini.starter").sections.sessions(5, true),
    },
    content_hooks = {
      require("mini.starter").gen_hook.adding_bullet(),
      require("mini.starter").gen_hook.indexing("all", { "Builtin actions" }),
      require("mini.starter").gen_hook.aligning("center", "center"),
    },
  })

  require("mini.indentscope").setup({})
end
return {
  {
    "echasnovski/mini.nvim",
    version = false,
    init = init,
  },
}
