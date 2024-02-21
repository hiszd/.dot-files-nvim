local config = function()
  require("harpoon").setup({
    settings = {
      save_on_toggle = true,
    }
  })
end
local init = function()
  local h = require("harpoon")

  -- basic telescope configuration
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end

  map({ "n" },
    "<C-e>",
    function()
      toggle_telescope(require('harpoon'):list())
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
    { noremap = true, desc = "Add file to Harpoon" }
  )

  for i = 0, 9 do
    map(
      { "n" },
      "<leader>" .. i,
      function()
        require('harpoon.ui').nav_file(i)
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
