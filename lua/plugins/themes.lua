return {
  {
    "hiszd/fleet.nvim",
    dir = "~/programming/nvim/fleet.nvim",
    dev = true,
    name = "fleet",
    -- priority = 99,
  },
  {
    "hiszd/chillthm.nvim",
    config = function()
      vim.cmd("colorscheme chillthm")
    end,
    priority = 99,
  },
  {
    "hiszd/clrtheme.nvim",
    dir = "~/programming/nvim/clrtheme.nvim",
    dev = true,
    name = "clrtheme",
    -- priority = 99,
  },
}
