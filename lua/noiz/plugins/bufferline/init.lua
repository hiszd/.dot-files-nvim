---@diagnostic disable: unused-local

local highlights = require('noiz.plugins.bufferline.highlights').highlights

require("bufferline").setup {
  highlights = highlights,
  options = {
    mode = 'tabs',
    numbers = function(opts)
      return string.format('(%s)', opts.ordinal)
    end,
    indicator = {
      style = 'none',
    },
    -- tab_size = 18,
    diagnostics = "nvim_lsp",
    custom_filter = function(buf_number)
      -- filter out filetypes you don't want to see
      local nam = vim.api.nvim_buf_get_name(buf_number)
      local typ = vim.bo[buf_number].filetype
      if string.match(nam, "term") then
        return false
      elseif nam == "" and typ == "" then
        return false
      end
      return true
    end,
    color_icons = true, -- whether or not to add the filetype icon highlights
    separator_style = "slant",
  }
}

vim.api.nvim_set_hl(0, "BufferLineDevIconLuaSelected", { fg = norm_fg, bg = norm_bg })
vim.api.nvim_set_hl(0, "BufferLineDevIconLua", { fg = comment_fg, bg = norm_bg })
vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultSelected", { fg = norm_bg, bg = comment_fg })
vim.api.nvim_set_hl(0, "BufferLineDevIconDefault", { fg = comment_fg, bg = norm_bg })

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
map("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
map("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
map("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
map("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
map("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
map("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
map("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
map("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
map("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
map("n", "<Leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>")
-- Pin/Unpin Buffer
map("n", "<leader>bb", "<Cmd>BufferLineTogglePin<CR>")
-- Close buffer
local function closecurrentbuffer()
  local curbuf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(curbuf, {})
end

vim.keymap.set("n", "<leader>dq", closecurrentbuffer)
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
