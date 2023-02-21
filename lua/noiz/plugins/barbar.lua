require('bufferline').setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = 'both',
  icon_custom_colors = true,
  exclude_ft = { 'terminal', '' },
  -- Configure icons on the bufferline.
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab = "",
  icon_close_tab_modified = "●",
  icon_pinned = "車",
  insert_at_end = true,
  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 2,
  -- Sets the maximum buffer name length.
  maximum_length = 30,
  semantic_letters = true,
})

-- Goto buffer in position
map("n", "<Leader>1", "<Cmd>BufferGoto 1<CR>")
map("n", "<Leader>2", "<Cmd>BufferGoto 2<CR>")
map("n", "<Leader>3", "<Cmd>BufferGoto 3<CR>")
map("n", "<Leader>4", "<Cmd>BufferGoto 4<CR>")
map("n", "<Leader>5", "<Cmd>BufferGoto 5<CR>")
map("n", "<Leader>6", "<Cmd>BufferGoto 6<CR>")
map("n", "<Leader>7", "<Cmd>BufferGoto 7<CR>")
map("n", "<Leader>8", "<Cmd>BufferGoto 8<CR>")
map("n", "<Leader>9", "<Cmd>BufferGoto 9<CR>")
map("n", "<Leader>0", "<Cmd>BufferLast<CR>")
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>")
-- Wipeout buffer
--                 <Cmd>BufferWipeout<CR>
-- Close commands
--                 <Cmd>BufferCloseAllButCurrent<CR>
--                 <Cmd>BufferCloseBuffersLeft<CR>
--                 <Cmd>BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>")
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
