_G.map = function(mode, mapping, command, options)
  if options == nil then
    options = { silent = true }
  end
  if options then
    options = vim.tbl_extend("force", options, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end

vim.cmd([[
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]])

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
-- @param r              red (0.0-1.0)
-- @param g              green (0.0-1.0)
-- @param b              blue (0.0-1.0)
-- @return               corresponding H, S and L components
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

return util
