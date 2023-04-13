local lualine_thm = require("clrtheme").load_lualine()
local get_color = require("clrtheme").get_color

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require("lualine")

local mode_color = function()
  local mode_color = {
    n = get_color("normal"),
    i = get_color("insert"),
    v = get_color("visual"),
    [""] = get_color("blue"),
    V = get_color("visual"),
    c = get_color("command"),
    no = get_color("normal"),
    s = get_color("visual"),
    S = get_color("visual"),
    ic = get_color("insert"),
    R = get_color("insert"),
    Rv = get_color("insert"),
    cv = get_color("visual"),
    ce = get_color("insert"),
    r = get_color("insert"),
    rm = get_color("insert"),
    ["r?"] = get_color("insert"),
    ["!"] = get_color("red"),
    t = get_color("red"),
  }
  return { fg = mode_color[vim.fn.mode()] }
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    icons_enabled = true,
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = lualine_thm,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local get_mode = function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == "\22" then
    mode = "v"
  end
  return mode
end

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- *************************************************************
-- ************                                     ************
-- ************      inserting left components      ************
-- ************                                     ************
-- *************************************************************

ins_left({
  function()
    return "▊"
  end,
  color = function()
    return mode_color()
  end,
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    local str = get_mode()
    local subby = string.upper(str)
    return subby
    -- return ''
  end,
  color = function()
    return mode_color()
  end,
  padding = { right = 1 },
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = get_color("fg"), gui = "bold" },
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = get_color("red") },
    color_warn = { fg = get_color("yellow") },
    color_info = { fg = get_color("cyan") },
  },
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({
  function()
    return "%="
  end,
})

ins_left({
  -- Lsp server name .
  function()
    local msg = "No Active Lsp"
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    local retstr = ""
    for _, client in ipairs(clients) do
      if retstr == "" then
        retstr = client.name
      else
        retstr = retstr .. ", " .. client.name
      end
    end
    if retstr ~= "" then
      return retstr
    end
    return msg
  end,
  icon = " LSP:",
  color = { fg = "#ffffff", gui = "bold" },
})

-- **************************************************************
-- ************                                      ************
-- ************      inserting right components      ************
-- ************                                      ************
-- **************************************************************

ins_right({
  "branch",
  icon = "",
  color = { fg = get_color("orange"), gui = "bold" },
})

ins_right({
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = get_color("green") },
    modified = { fg = get_color("orange") },
    removed = { fg = get_color("red") },
  },
  cond = conditions.hide_in_width,
})

ins_right({
  function()
    return "▊"
  end,
  color = function()
    return mode_color()
  end,
  padding = { left = 1 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)