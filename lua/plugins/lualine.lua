local config = function()
  local lualine_thm = require("lualine.themes.chillthm")
  -- local lualine_thm = require("chillthm").lualine_theme()
  -- local color = require("chilthm.color")
  local get_color = require('chillthm').get_color

  local mode_color = function()
    ---@type table
    local mode_col = {
      ["n"] = lualine_thm.normal.a.fg,
      ["i"] = lualine_thm.insert.a.fg,
      ["v"] = lualine_thm.visual.a.fg,
      [""] = get_color("blue"),
      ["V"] = lualine_thm.visual.a.fg,
      ["c"] = lualine_thm.command.a.fg,
      ["no"] = lualine_thm.normal.a.fg,
      ["s"] = lualine_thm.visual.a.fg,
      ["S"] = lualine_thm.visual.a.fg,
      ["ic"] = lualine_thm.insert.a.fg,
      ["R"] = lualine_thm.replace.a.fg,
      ["Rv"] = lualine_thm.replace.a.fg,
      ["cv"] = lualine_thm.visual.a.fg,
      ["ce"] = lualine_thm.insert.a.fg,
      ["r"] = lualine_thm.insert.a.fg,
      ["rm"] = lualine_thm.insert.a.fg,
      ["r?"] = lualine_thm.insert.a.fg,
      ["!"] = get_color("red"),
      ["t"] = get_color("red"),
    }

    return mode_col and { fg = mode_col[vim.api.nvim_get_mode().mode] } or { fg = "gray" }
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
      theme = "chillthm",
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
  local function ins_mode(component)
    table.insert(config.sections.lualine_a, component)
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

  ins_mode({
    function()
      return require("noiz.utils.const").syms["37"]
    end,
    color = function()
      return { fg = mode_color().fg, bg = lualine_thm.normal.b.bg }
    end,
    padding = { left = 0, right = 1 }, -- We don't need space before this
  })

  ins_mode({
    -- mode component
    function()
      local str = get_mode()
      local subby = string.upper(str)
      return subby
      -- return ''
    end,
    color = function()
      return { fg = mode_color().fg, bg = lualine_thm.normal.b.bg }
    end,
    padding = { right = 1 },
  })

  ins_left({
    "filename",
    cond = conditions.buffer_not_empty,
    -- color = { fg = "fg", gui = "bold" },
  })

  ins_left({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn", "info" },
    symbols = { error = " ", warn = " ", info = " " },
    diagnostics_color = {
      color_error = { fg = "red" },
      color_warn = { fg = "yellow" },
      color_info = { fg = "cyan" },
    },
  })

  ins_left({
    function()
      if require("noice").api.statusline.mode.has() then
        local mode = require("noice").api.statusline.mode.get()
        if string.find(mode, "recording") then
          return mode
        else
          return ""
        end
      else
        return ""
      end
    end,
    color = { fg = "green" }
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
    -- color = { fg = "#ffffff", gui = "bold" },
  })

  -- **************************************************************
  -- ************                                      ************
  -- ************      inserting right components      ************
  -- ************                                      ************
  -- **************************************************************

  ins_right({
    function()
      return vim.api.nvim_call_function("codeium#GetStatusString", {})
    end,
    color = { fg = "orange" }
  })

  ins_right({
    "branch",
    icon = "",
    color = { fg = "orange", gui = "bold" },
  })

  ins_right({
    "diff",
    -- Is it me or the symbol for modified us really weird
    symbols = { added = " ", modified = " ", removed = " " },
    diff_color = {
      added = { fg = "green" },
      modified = { fg = "orange" },
      removed = { fg = "red" },
    },
    cond = conditions.hide_in_width,
  })

  ins_right({
    function()
      return require("noiz.utils.const").syms["38"]
    end,
    color = function()
      local col = mode_color()
      return col
    end,
    padding = { left = 0, right = 0 },
  })

  -- Now don't forget to initialize lualine
  require("lualine").setup(config)
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    -- "hiszd/clrtheme.nvim",
  },
  config = config,
}
