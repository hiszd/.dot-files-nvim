---@diagnostic disable: unused-local
local norm_col = vim.api.nvim_get_hl_by_name("Normal", true)
local norm_bg = "#" .. string.format("%06x", norm_col.background)
local norm_fg = "#" .. string.format("%06x", norm_col.foreground)
local pmenu_col = vim.api.nvim_get_hl_by_name("Pmenu", true)
local pmenu_bg = "#" .. string.format("%06x", pmenu_col.background)
local pmenu_fg = "#" .. string.format("%06x", pmenu_col.foreground)
local comment_col = vim.api.nvim_get_hl_by_name("Comment", true)
local comment_fg = "#" .. string.format("%06x", comment_col.foreground)

require("bufferline").setup {
  highlights = {
    fill = {
      fg = norm_bg,
      bg = norm_bg,
    },
    background = {
      fg = comment_fg,
      bg = norm_bg,
    },
    tab = {
      fg = comment_fg,
      bg = norm_bg,
    },
    tab_selected = {
      fg = comment_fg,
      bg = norm_bg,
    },
    tab_close = {
      fg = comment_fg,
      bg = norm_bg,
    },
    close_button = {
      fg = norm_fg,
      bg = norm_bg,
    },
    --   close_button_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   close_button_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    -- buffer_visible = {
    --   fg = comment_fg,
    --   bg = norm_bg,
    -- },
    -- buffer_selected = {
    --   fg = comment_fg,
    --   bg = norm_bg,
    -- },
    numbers = {
      fg = comment_fg,
      bg = norm_bg,
    },
    numbers_visible = {
      fg = comment_fg,
      bg = norm_bg,
    },
    numbers_selected = {
      fg = norm_fg,
      bg = norm_bg,
      bold = true,
      italic = true,
    },
    -- diagnostic = {
    --   fg = comment_fg,
    --   bg = comment_fg,
    -- },
    --   diagnostic_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --   },
    --   diagnostic_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    -- hint = {
    --   fg = comment_fg,
    --   sp = comment_fg,
    --   bg = comment_fg,
    -- },
    --   hint_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   hint_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    --   hint_diagnostic = {
    --     fg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   hint_diagnostic_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   hint_diagnostic_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    -- info = {
    --   fg = comment_fg,
    --   sp = comment_fg,
    --   bg = comment_fg,
    -- },
    --   info_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   info_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    --   info_diagnostic = {
    --     fg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   info_diagnostic_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   info_diagnostic_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    --   warning = {
    --     fg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   warning_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   warning_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    --   warning_diagnostic = {
    --     fg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   warning_diagnostic_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   warning_diagnostic_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     -- sp = warning_diagnostic_fg,
    --     bold = true,
    --     italic = true,
    --   },
    --   error = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>'
    --   },
    --   error_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   error_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    --   error_diagnostic = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>'
    --   },
    --   error_diagnostic_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   error_diagnostic_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     sp = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    -- modified = {
    --   fg = comment_fg,
    --   bg = comment_fg,
    -- },
    --   modified_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    --   modified_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>'
    --   },
    -- duplicate_selected = {
    --   fg = norm_bg,
    --   bg = norm_bg,
    --   italic = true,
    -- },
    -- duplicate_visible = {
    --   fg = norm_bg,
    --   bg = norm_bg,
    --   italic = true
    -- },
    -- duplicate = {
    --   fg = norm_bg,
    --   bg = norm_bg,
    --   italic = true
    -- },
    separator_selected = {
      fg = norm_bg,
      bg = norm_bg,
    },
    separator_visible = {
      fg = norm_bg,
      bg = norm_bg,
    },
    separator = {
      fg = norm_bg,
      bg = norm_bg,
    },
    -- indicator_selected = {
    --   fg = comment_fg,
    --   bg = comment_fg,
    -- },
    --   pick_selected = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    --   pick_visible = {
    --     fg = '<colour-value-here>',
    --     bg = '<colour-value-here>',
    --     bold = true,
    --     italic = true,
    --   },
    pick = {
      bg = norm_bg,
      bold = true,
      italic = true,
    },
    offset_separator = {
      bg = norm_bg,
    },
  },
  options = {
    mode = 'tabs',
    numbers = function(opts)
      return string.format('(%s)', opts.ordinal)
    end,
    indicator = {
      style = 'underline',
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
    color_icons = false, -- whether or not to add the filetype icon highlights
    -- get_element_icon = function(element)
    --   -- element consists of {filetype: string, path: string, extension: string, directory: string}
    --   -- This can be used to change how bufferline fetches the icon
    --   -- for an element e.g. a buffer or a tab.
    --   -- e.g.
    --   local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
    --   P(hl)
    --   return icon, "Pmenu"
    -- end,

    separator_style = "slant",
  }
}

vim.api.nvim_set_hl(0, "BufferLineDevIconLuaSelected", { fg = norm_fg, bg = norm_bg, underline = true })
vim.api.nvim_set_hl(0, "BufferLineDevIconLua", { fg = comment_fg, bg = norm_bg, underline = true })
vim.api.nvim_set_hl(0, "BufferLineDevIconDefaultSelected", { fg = norm_bg, bg = comment_fg, underline = true })

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
