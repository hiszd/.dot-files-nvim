require('ztab').setup({
  highlight = {
    ["title"] = {
      fg = "#000000",
      bg = "#ffffff",
    }
  }
})

map('n', '<C-Tab>', '<Cmd>:tabnext #<cr>', { noremap = true })

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
map("n", "<leader>bb]", "<Cmd>:+tabmove<CR>")
map("n", "<leader>bb[", "<Cmd>:-tabmove<CR>")
map("n", "<leader>bb[", "<Cmd>:0tabmove<CR>")


-- Close buffer
local function closecurrentbuffer()
  local curbuf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(curbuf, {})
end

vim.keymap.set("n", "<leader>dq", closecurrentbuffer)
