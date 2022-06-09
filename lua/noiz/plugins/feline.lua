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

-- local get_mode_color =function ()
--   local m = vim.api.nvim_get_mode().mode
-- end

components.active[1][1] = {
  provider = function()
    local str = vim.api.nvim_get_mode().mode
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
        fg = vim.api.nvim_get_mode().mode,
      }
    end,
  },
  icon = '',
}

components.active[1][2] = {
  provider = 'file_info',
  hl = function()
    return {
      fg = 'white',
      bg = vim.api.nvim_get_mode().mode,
      style = 'bold',
    }
  end,
  left_sep = {
    str = 'slant_left',
    hl = function()
      return {
        fg = vim.api.nvim_get_mode().mode,
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
      return {
        fg = vim.api.nvim_get_mode().mode,
        bg = vim.api.nvim_get_mode().mode,
      }
    end,
  },
}

require('feline').setup({
  components = components,
})
