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

require('battery').setup({
  update_rate_seconds = 30, -- Number of seconds between checking battery status
  show_status_when_no_battery = false, -- Don't show any icon or text when no battery found (desktop for example)
  show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
  show_unplugged_icon = true, -- When true show a diconnected cable icon when not plugged in
  show_percent = true, -- Whether or not to show the percent charge remaining in digits
  vertical_icons = false, -- When true icons are vertical, otherwise shows horizontal battery icon
})

local get_mode = function()
  local mode = vim.api.nvim_get_mode().mode
  if mode == '\22' then
    mode = 'v'
  end
  return mode
end

-- components.active[2][1] = {
--   provider = function()
--     return ''
--   end,
--   hl = function()
--     return {
--       bg = '#000',
--     }
--   end
-- }

components.active[3][1] = {
  provider = function()
    if require('battery').get_battery_status().percent_charge_remaining == nil then
      return ''
    end
    return require('battery').get_status_line()
  end,
  right_sep = 'block'
}

require('gitsigns').setup()

require('feline').winbar.setup({
  components = components,
})
