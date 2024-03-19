local init = function()
  local neogit = require("neogit")
  neogit.setup({
    integrations = {
      diffview = true
    }
  })

  vim.keymap.set("n", "<leader>gc", function()
    neogit.open({ "commit", kind = "split_above" })
  end)
  vim.keymap.set("n", "<leader>go", function()
    neogit.open({ kind = "split_above" })
  end)
end

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    init = init,
  }

}
