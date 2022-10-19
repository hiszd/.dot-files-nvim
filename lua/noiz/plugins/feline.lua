-- Initialize the components table
local components = {
  active = {},
  inactive = {}
}

-- Insert three sections (left, mid and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert two sections (left and right) for the inactive statusline
table.insert(components.inactive, {})
table.insert(components.inactive, {})

local get_light_dark = function(col, light, dark)
  local h = 0
  local s = 0
  local l = 0
  local rtrn
  if col ~= nil then
    h, s, l = require('noiz.utils').rgb_string_to_hsl(col)
  end

  if l >= 0.68 then
    rtrn = dark
  elseif h > 24 and h < 201 then
    rtrn = light
  end

  return rtrn
end

local get_mode = function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == '\22' then
    mode = 'v'
  end
  return mode
end

components.active[1][1] = {
  provider = function()
    local str = get_mode()
    local subby = string.upper(' ' .. str)
    return subby
  end,
  hl = function()
    return {
      fg = 'white',
      style = 'bold'
    }
  end,
  right_sep = {
    str = 'block',
    hl = function()
      return {
        fg = 'bg',
        bg = 'bg',
      }
    end,
  },
  left_sep = {
    str = 'block',
    hl = function()
      return {
        fg = get_mode(),
      }
    end,
  },
  icon = '',
}

components.active[1][2] = {
  provider = 'git_branch',
  hl = function()
    local mode = get_mode()
    local col = package.loaded.feline.colors[mode]
    local fg = get_light_dark(col, 'white', 'gray')
    return {
      fg = fg,
      bg = mode,
      style = 'bold',
    }
  end,
  left_sep = {
    str = 'slant_left',
    hl = function()
      return {
        fg = get_mode(),
        bg = 'bg',
      }
    end,
  },
  right_sep = 'slant_right',
}

components.active[2][1] = {
  provider = 'position',
}

components.active[3][1] = {
  provider = 'lsp_client_names',
}

components.active[3][2] = {
  provider = 'diagnostic_errors',
  hl = function()
    return {
      fg = 'red',
      bg = 'none',
    }
  end,
}

components.active[3][3] = {
  provider = 'diagnostic_warnings',
  hl = function()
    return {
      fg = 'yellow',
      bg = 'none',
    }
  end,
}

components.active[3][4] = {
  provider = function()
    return tostring(' ' .. require("feline.providers.cursor").line_percentage() .. ' ')
  end,
  left_sep = ' ',
  right_sep = {
    str = ' ',
    hl = function()
      local mode = get_mode()
      return {
        fg = mode,
        bg = mode,
      }
    end,
  },
}

require('gitsigns').setup()

require('feline').setup({
  components = components,
})
