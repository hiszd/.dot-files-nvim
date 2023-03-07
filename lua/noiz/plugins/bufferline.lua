require("bufferline").setup {
  options = {
    numbers = function(opts)
      return string.format('(%s)', opts.ordinal)
    end,
    indicator = {
      style = 'underline',
    },
    -- tab_size = 18,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        text = function()
          return vim.fn.getcwd()
        end,
        highlight = "Directory",
        text_align = "left",
        separator = false,
      }
    },
    color_icons = true, -- whether or not to add the filetype icon highlights
    separator_style = "slant",
    show_tab_indicators = true,
  }
}


-- Moving around buffers
map("n", "<leader>b]", "<Cmd>BufferLineCycleNext<CR>")
map("n", "<leader>b[", "<Cmd>BufferLineCyclePrev<CR>")

-- Changing buffers positions
map("n", "<leader>bb]", "<Cmd>BufferLineMoveNext<CR>")
map("n", "<leader>bb[", "<Cmd>BufferLineMovePrev<CR>")

-- Magic buffer-picking mode
map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>")
map("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>")

-- Goto buffer in position
map("n", "<Leader>1", "<Cmd>BufferLineGoto 1<CR>")
map("n", "<Leader>2", "<Cmd>BufferLineGoto 2<CR>")
map("n", "<Leader>3", "<Cmd>BufferLineGoto 3<CR>")
map("n", "<Leader>4", "<Cmd>BufferLineGoto 4<CR>")
map("n", "<Leader>5", "<Cmd>BufferLineGoto 5<CR>")
map("n", "<Leader>6", "<Cmd>BufferLineGoto 6<CR>")
map("n", "<Leader>7", "<Cmd>BufferLineGoto 7<CR>")
map("n", "<Leader>8", "<Cmd>BufferLineGoto 8<CR>")
map("n", "<Leader>9", "<Cmd>BufferLineGoto 9<CR>")
map("n", "<Leader>0", "<Cmd>BufferLineGoto -1<CR>")
-- Pin/Unpin Buffer
map("n", "<leader>bb", "<Cmd>BufferLineTogglePin<CR>")
-- Close buffer
map("n", "<leader>dq", "<Cmd>BufferLineClose<CR>")
-- Wipeout buffer
--                 <Cmd>BufferWipeout<CR>
-- Close commands
--                 <Cmd>BufferCloseAllButCurrent<CR>
--                 <Cmd>BufferCloseBuffersLeft<CR>
--                 <Cmd>BufferCloseBuffersRight<CR>
-- Sort automatically by...
map("n", "<Space>bs", "<Cmd>BufferLineSortByTabs<CR>")
map("n", "<Space>bd", "<Cmd>BufferLineSortByDirectory<CR>")
map("n", "<Space>be", "<Cmd>BufferLineSortByExtension<CR>")
