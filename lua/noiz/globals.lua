-- Global functions
P = function(v)
  print(vim.inspect(v))
  return v
end

RSTLNE = function()
  local map = map_impl("RSTLNE")
  map({ "n" }, "<leader>o", "A<CR>", { silent = true, nowait = true, desc = "Insert newline" })
  map({ "" }, "i", "k", { silent = true, desc = "Move up" })
  map({ "" }, "k", "i", { silent = true, desc = "Enter insert mode" })
  map({ "" }, "n", "j", { silent = true, desc = "Move down" })
  map({ "" }, "o", "l", { silent = true, desc = "Move right" })
  -- map({ "" }, "l", "y", { silent = true, desc = "Move right" })
  print("RSTLNE")
end

QWERTY = function()
  local map = map_impl("QWERTY")
  for letter in pairs({ "n", "i", "o", "k" }) do
    map({ "" }, letter, letter)
  end
  print("QWERTY")
end

_G.reqs = function(m)
  for k, v in pairs(m) do
    local x = require(k)
    require(k).setup(v(x))
  end
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

-- SynGroup = function()
--   local s = vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1)
--   print(vim.fn.synIDattr(s, "name") .. " -> " .. vim.fn.synIDattr(vim.fn.synIDtrans(s), "name"))
-- end

---Reload specified plugin
---@param name string #Name of plugin to reload
R = function(name)
  RELOAD(name)
  return require(name)
end

function Printf(...)
  print(FMT(...))
end

function FMT(...)
  return string.format(...)
end
