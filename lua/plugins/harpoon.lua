local config = function()
  require("harpoon").setup({
    settings = {
      save_on_toggle = true,
    }
  })
end
local init = function()
  local h = require("harpoon")

  local map = map_impl("Harpoon")

  map({ "n" },
    "<C-e>",
    function()
      h.ui:toggle_quick_menu(h:list())
    end,
    { desc = "Open harpoon window" }
  )

  map(
    { "n" },
    "<leader>ha",
    function()
      h:list():append()
    end,
    { noremap = true, desc = "Add file to Harpoon" }
  )
  map(
    { "n" },
    "<leader>hr",
    function()
      h:list():remove()
    end,
    { noremap = true, desc = "Remove file from Harpoon" }
  )

  for i = 0, 9 do
    map(
      { "n" },
      "<leader>" .. i,
      function()
        h:list():select(i)
      end,
      { noremap = true, desc = "Navigate to Harpoon file " .. i }
    )
  end
end

return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = config,
  init = init,
}
