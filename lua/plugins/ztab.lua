local init = function()
  ---@type ZTabHighlightOpts
  local highlights = {
    title_sel = {
      sp = "#aa5500",
      -- underline = true,
    },
    icon_sel = {
      sp = "#aa5500",
      -- underline = true,
    },
    modified_sel = {
      sp = "#aa5500",
      -- underline = true,
    },
    separator_sel = {
      sp = "#aa5500",
      -- underline = true,
    },
  }

  ---@type ZTabSetupOpts
  local opts = {
    tabline = {
      enabled = true,
      sep_name = "slant",
      right_sep = true,
      devicon_colors = "selected",
      highlight = highlights,
    },
    bufline = {
      enabled = true,
      left_sep = false,
      devicon_colors = "selected",
      -- wtabhighlight = {
      --   fill = {
      --     bg = "bg",
      --   },
      --   separator_sel = {
      --     fg = "#aa5500",
      --   },
      --   separator = {
      --     fg = "",
      --     bg = "bg",
      --   },
      --   title = {
      --     bg = "bg",
      --   },
      --   icon = {
      --     fg = require("ztab").helpers.extract_highlight_colors("TabLine").fg,
      --     bg = "bg",
      --   },
      -- },
      highlight = highlights,
    },
  }

  require("nvim-web-devicons").setup()

  require("ztab").setup(opts)

  map("n", "<C-L>", "<Cmd>:tabnext #<cr>", { noremap = true })

  map("n", "<leader>br", "<Cmd>:lua R('ztab')<CR><Cmd>lua require('ztab').setup(require('plugins/ztab').opts)<CR>")

  -- Goto buffer in position
  map("n", "<Leader>1", "<Cmd>:lua require('ztab.bufline').zbufgoto('1')<CR>")
  map("n", "<Leader>2", "<Cmd>:lua require('ztab.bufline').zbufgoto('2')<CR>")
  map("n", "<Leader>3", "<Cmd>:lua require('ztab.bufline').zbufgoto('3')<CR>")
  map("n", "<Leader>4", "<Cmd>:lua require('ztab.bufline').zbufgoto('4')<CR>")
  map("n", "<Leader>5", "<Cmd>:lua require('ztab.bufline').zbufgoto('5')<CR>")
  map("n", "<Leader>6", "<Cmd>:lua require('ztab.bufline').zbufgoto('6')<CR>")
  map("n", "<Leader>7", "<Cmd>:lua require('ztab.bufline').zbufgoto('7')<CR>")
  map("n", "<Leader>8", "<Cmd>:lua require('ztab.bufline').zbufgoto('8')<CR>")
  map("n", "<Leader>9", "<Cmd>:lua require('ztab.bufline').zbufgoto('9')<CR>")
  map("n", "<Leader>0", "<Cmd>:lua require('ztab.bufline').zbufgoto('10')<CR>")
  -- Goto tab in position
  map("n", "<Leader><Leader>1", "<Cmd>:tabnext 1<CR>")
  map("n", "<Leader><Leader>2", "<Cmd>:tabnext 2<CR>")
  map("n", "<Leader><Leader>3", "<Cmd>:tabnext 3<CR>")
  map("n", "<Leader><Leader>4", "<Cmd>:tabnext 4<CR>")
  map("n", "<Leader><Leader>5", "<Cmd>:tabnext 5<CR>")
  map("n", "<Leader><Leader>6", "<Cmd>:tabnext 6<CR>")
  map("n", "<Leader><Leader>7", "<Cmd>:tabnext 7<CR>")
  map("n", "<Leader><Leader>8", "<Cmd>:tabnext 8<CR>")
  map("n", "<Leader><Leader>9", "<Cmd>:tabnext 9<CR>")
  map("n", "<Leader><Leader>0", "<Cmd>:tabnext 10<CR>")

  -- Changing buffers positions
  map("n", "<leader>b]", "<Cmd>:+tabmove<CR>")
  map("n", "<leader>b[", "<Cmd>:-tabmove<CR>")
  map("n", "<leader>b0", "<Cmd>:0tabmove<CR>")

  vim.keymap.set("n", "<leader>dq", "<Cmd>:bdelete<CR>")
  vim.keymap.set("n", "<leader>bq", "<Cmd>:tabclose<CR>")

  --require("ztab").helpers.create_hl_groups()
end

return {
  {
    "hiszd/ztab.nvim",
    dev = true,
    dir = "~/programming/nvim/ztab.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    priority = 0,
    -- opts = opts,
    config = init,
  },
}
