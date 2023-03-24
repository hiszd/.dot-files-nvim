local ztab = require("ztab")

require("ztab.types")

---@type HighlightOpts
local highlights = {
  title_sel = {
    sp = "#aa5500",
    underline = true,
  },
  icon_sel = {
    sp = "#aa5500",
    underline = true,
  },
  modified_sel = {
    sp = "#aa5500",
    underline = true,
  },
  separator_sel = {
    sp = "#aa5500",
    underline = true,
  },
}

ztab.setup({
  sep_name = "slant",
  right_sep = true,
  devicon_colors = "selected",
  highlight = highlights,
})

map("n", "<C-L>", "<Cmd>:tabnext #<cr>", { noremap = true })

map("n", "<leader>br", "<Cmd>:lua R('ztab')<CR><Cmd>:so ~/.config/nvimelue/noiz/plugins/ztab.lua<CR>")

-- Goto buffer in position
map("n", "<Leader>1", "<Cmd>:tabnext 1<CR>")
map("n", "<Leader>2", "<Cmd>:tabnext 2<CR>")
map("n", "<Leader>3", "<Cmd>:tabnext 3<CR>")
map("n", "<Leader>4", "<Cmd>:tabnext 4<CR>")
map("n", "<Leader>5", "<Cmd>:tabnext 5<CR>")
map("n", "<Leader>6", "<Cmd>:tabnext 6<CR>")
map("n", "<Leader>7", "<Cmd>:tabnext 7<CR>")
map("n", "<Leader>8", "<Cmd>:tabnext 8<CR>")
map("n", "<Leader>9", "<Cmd>:tabnext 9<CR>")
map("n", "<Leader>0", "<Cmd>:tabnext 10<CR>")

-- Changing buffers positions
map("n", "<leader>b]", "<Cmd>:+tabmove<CR>")
map("n", "<leader>b[", "<Cmd>:-tabmove<CR>")
map("n", "<leader>b0", "<Cmd>:0tabmove<CR>")

-- Close buffer
local function closecurrentbuffer()
  local curbuf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(curbuf, {})
end

vim.keymap.set("n", "<leader>dq", closecurrentbuffer)
vim.keymap.set("n", "<leader>bq", "<Cmd>:tabclose<CR>")
