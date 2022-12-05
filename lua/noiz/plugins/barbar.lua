require('bufferline').setup({
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = true,
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
map("n", "<Leader>1", ":BufferGoto 1<CR>")
map("n", "<Leader>2", ":BufferGoto 2<CR>")
map("n", "<Leader>3", ":BufferGoto 3<CR>")
map("n", "<Leader>4", ":BufferGoto 4<CR>")
map("n", "<Leader>5", ":BufferGoto 5<CR>")
map("n", "<Leader>6", ":BufferGoto 6<CR>")
map("n", "<Leader>7", ":BufferGoto 7<CR>")
map("n", "<Leader>8", ":BufferGoto 8<CR>")
map("n", "<Leader>9", ":BufferGoto 9<CR>")
map("n", "<Leader>0", ":BufferLast<CR>")
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>")
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>")
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>")
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>")
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>")
