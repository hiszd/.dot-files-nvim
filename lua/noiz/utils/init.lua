---Map a key
---@param mode NvimModes[]                #nvim mode(n,v,i, etc.)
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

---Create mapping implementation with special description
---@param desc string
---@return fun(mode: NvimModes[], mapping: string, command: string | function, options: table?)
_G.map_impl = function(desc)
  return function(mode, mapping, command, options)
    options = options or {}
    options.desc = options.desc and options.desc .. " (" .. desc .. ")" or "(" .. desc .. ")"
    map(mode, mapping, command, options)
  end
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
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = curbuf })
  if filetype == "lua" then
    feedkey("viwyviw sa)F(a\"<esc>pa: \", <esc>F(iprint<esc>_", "")
  elseif filetype == "jsx" or filetype == "tsx" or filetype == "javascript" or filetype == "typescript" or filetype == "typescriptreact" then
    feedkey(
      "viwyviw sa{F{i$<esc>vf} sa`F`vf` sa)F(iconsole.log<esc>A;<esc>",
      "")
  else
    print("filetype not supported ", filetype)
  end
end

function util.tbl_length(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function util.get_visual_selection()
  -- this will exit visual mode
  -- use 'gv' to reselect the text
  local _, csrow, cscol, cerow, cecol
  local mode = vim.fn.mode()
  if mode == 'v' or mode == 'V' or mode == '' then
    -- if we are in visual mode use the live position
    _, csrow, cscol, _ = unpack(vim.fn.getpos("."))
    _, cerow, cecol, _ = unpack(vim.fn.getpos("v"))
    if mode == 'V' then
      -- visual line doesn't provide columns
      cscol, cecol = 0, 999
    end
    -- exit visual mode
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Esc>",
        true, false, true), 'n', true)
  else
    -- otherwise, use the last known visual position
    _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
  end
  -- swap vars if needed
  if cerow < csrow then csrow, cerow = cerow, csrow end
  if cecol < cscol then cscol, cecol = cecol, cscol end
  local lines = vim.fn.getline(csrow, cerow)
  -- local n = cerow-csrow+1
  local n = util.tbl_length(lines)
  if n <= 0 then return '' end
  lines[n] = string.sub(lines[n], 1, cecol)
  lines[1] = string.sub(lines[1], cscol)
  return table.concat(lines, "\n")
end

_G.get_dir = function()
  -- local d = (...):match("(.-)[^%.]+$")
  local d = ""
  return d
end

_G.andor = function(a, b)
  return a and a or b
end

_G.andortbl = function(a, b)
  b = b or {}
  P(b)
  return a and a or b
end

return util
