local init = function()
  local h = require("harpoon")

  h:setup({
    settings = {
      save_on_toggle = true,
    }
  })

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
      h:list():add()
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

  map(
    { "n" },
    "<C-S-P>",
    function()
      h:list():prev();
    end
  )

  map(
    { "n" },
    "<C-S-N>",
    function()
      h:list():next();
    end
  )
end

return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = init,
}
