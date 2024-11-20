local init = function()
  local map = map_impl("Oil")
  map({ "n" }, "<leader>n", function() require("oil").open() end, { noremap = true })
end

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  {
    'stevearc/oil.nvim',
    opts = {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
        wrap = false,
        signcolumn = "yes",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      keymaps = {
        ["?"] = "actions.show_help",
        ["q"] = "actions.close",
        ["<BS>"] = "actions.parent",
      },
    },
    init = init,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
