---@diagnostic disable: unused-local
local M = {}

local clr = require('clrtheme')

local clrhighlights = clr.bufferline_highlights()

local norm_bg = clr.get_color('bg')
local norm_fg = clr.get_color('fg')
local comment_fg = clr.get_color('comments', 'shared')
local black = clr.get_color('black', 'shared')
local visible = clr.get_color('dark_gray', 'shared')

-- The backdrop color
local backdrop = black

local highlights = {
  fill = {
    fg = norm_bg,
    bg = backdrop,
  },
  background = {
    fg = comment_fg,
    bg = visible,
  },
  tab = {
    fg = comment_fg,
    bg = visible,
  },
  tab_selected = {
    fg = norm_fg,
    bg = norm_bg,
  },
  tab_close = {
    fg = comment_fg,
    bg = norm_bg,
  },
  close_button = {
    fg = norm_fg,
    bg = visible,
  },
  close_button_selected = {
    fg = norm_fg,
    bg = norm_bg,
  },
  numbers = {
    fg = comment_fg,
    bg = visible,
  },
  numbers_selected = {
    fg = norm_fg,
    bg = norm_bg,
    bold = true,
    italic = true,
  },
  separator_selected = {
    fg = backdrop,
    bg = norm_bg,
  },
  separator = {
    fg = backdrop,
    bg = visible,
  },
  pick = {
    bg = norm_bg,
    bold = true,
    italic = true,
  },
  offset_separator = {
    bg = norm_bg,
  },
}

M.highlights = highlights
M.clrhighlights = clrhighlights
return M
