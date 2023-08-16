---@param mode string               #nvim mode(n,v,i, etc.)
---@param mapping string            #lhs(e.g. '<leader>y')
---@param command string | function #command to be executed
---@param options table?            #options for mapping
---@return nil
_G.map = function(mode, mapping, command, options)
  if options == nil then
    options = { silent = true }
  end
  if options then
    options = vim.tbl_extend("force", options, options)
  end
  vim.keymap.set(mode, mapping, command, options)
end

---@param mode string    #nvim mode(n,v,i, etc.)
---@param mapping string #lhs(e.g. '<leader>y')
---@return table | nil   #returns all mapping if mapping is omitted, or specific mapping if it exists.
_G.get_map = function(mode, mapping)
  local mappings = vim.api.nvim_get_keymap(mode)

  if mapping then
    for _, v in pairs(mappings) do
      if v.lhs == mapping then
        return v
      end
    end
  else
    return mappings
  end
end

---EXAMPLE:
---local case = 3
---
---local result = switch({
---  [0] = "0",
---  [1] = "2^1+" .. case,
---  [2] = "2^2+" .. case,
---  [3] = "2^3+" .. case
---},
---case
---)
---@param cases table<number, string> #possible cases
---@param arg number #arg to switch based on
_G.switch = function(cases, arg)
  return assert(loadstring("return " .. cases[arg]))()
end

vim.cmd([[
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]])

---@param key string #key to feed
---@param mode string #mode to feed the key in
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local util = {}

util.rgb_string_to_hsl = function(rgb)
  return util.rgb_to_hsl(
    tonumber(rgb:sub(2, 3), 16) / 255,
    tonumber(rgb:sub(4, 5), 16) / 255,
    tonumber(rgb:sub(6, 7), 16) / 255
  )
end

--- Converts an RGB triplet to HSL.
-- (see http://easyrgb.com)
--
---@param r number               #red (0.0-1.0)
---@param g number               #green (0.0-1.0)
---@param b number               #blue (0.0-1.0)
---@return number,number,number  #corresponding H, S and L components
util.rgb_to_hsl = function(r, g, b)
  r = r or 0
  g = g or 0
  b = b or 0

  local min = math.max(math.min(r, g, b), 0)
  local max = math.min(math.max(r, g, b), 1)
  local delta = max - min

  local h, s, l = 0, 0, ((min + max) / 2)

  -- Achromatic, can skip the rest
  if max == min then
    return max * 359, 0, l
  end

  if l < 0.5 then
    s = delta / (max + min)
  end
  if l >= 0.5 then
    s = delta / (2 - max - min)
  end

  if delta > 0 then
    -- if max == r and max ~= g then h = h + (g-b)/delta end

    if max == r then
      h = (g - b) / delta
      if g < b then
        h = h + 6
      end
    elseif max == g then
      h = 2 + (b - r) / delta
    elseif max == b then
      h = 4 + (r - g) / delta
    end
    h = h / 6
  end

  if h < 0 then
    h = h + 1
  end
  if h > 1 then
    h = h - 1
  end

  -- return math.floor(h * 360), s, l
  return h * 360, s, l
end

util.log = function()
  local curbuf = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(curbuf, "filetype")
  if filetype == "lua" then
    feedkey("vkwy<esc>A<enter><esc>Aprint(<esc>p<esc>", "")
  elseif filetype == "jsx" or filetype == "tsx" or filetype == "javascript" or filetype == "typescript" then
    feedkey("vkwy<esc>A<enter><esc>Aconsole.log(`${}<esc>hpA;<esc>", "")
  end
end

return util
