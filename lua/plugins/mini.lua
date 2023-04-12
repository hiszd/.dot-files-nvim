local init = function()
  reqs({
        ["mini.pairs"] = {},
        ["mini.sessions"] = {},
        ["mini.indentscope"] = {},
        ["mini.doc"] = {},
        ["mini.surround"] = {
      mappings = {
        add = "<leader>sa",        -- Add surrounding in Normal and Visual modes
        delete = "<leader>sd",     -- Delete surrounding
        find = "<leader>sf",       -- Find surrounding (to the right)
        find_left = "<leader>sF",  -- Find surrounding (to the left)
        highlight = "<leader>sh",  -- Highlight surrounding
        replace = "<leader>sr",    -- Replace surrounding
        update_n_lines = "<leader>sn", -- Update `n_lines`
        suffix_last = "",          -- Suffix to search with "prev" method
        suffix_next = "",          -- Suffix to search with "next" method
      },
    },
        ["mini.starter"] = {
      evaluate_single = true,
      items = {
        require("mini.starter").sections.recent_files(5, true),
        require("mini.starter").sections.telescope(),
        require("mini.starter").sections.recent_files(2, false),
        -- Use this if you set up 'mini.sessions'
        require("mini.starter").sections.sessions(5, true),
        require("mini.starter").sections.builtin_actions(),
      },
      content_hooks = {
        require("mini.starter").gen_hook.adding_bullet(),
        require("mini.starter").gen_hook.indexing("section", { "Builtin actions" }),
        require("mini.starter").gen_hook.aligning("center", "center"),
      },
    },
  })
end
return {
  {
    "echasnovski/mini.nvim",
    version = false,
    init = init,
  },
}
