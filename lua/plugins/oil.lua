local init = function()
  local map = map_impl("Oil")
  map({ "n" }, "<leader>n", function() require("oil").open_float() end, { noremap = true })
end

return {
  {
    'stevearc/oil.nvim',
    opts = {
      win_options = {
        wrap = false,
        signcolumn = "no",
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
      },
    },
    init = init,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
