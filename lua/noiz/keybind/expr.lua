vim.g.counter = 0

local ListItem = function()
  vim.g.counter = vim.g.counter + 1
  local rtrn = string.format("%q", vim.g.counter)
  print(rtrn)
  return rtrn
end

local ListReset = function()
  vim.g.counter = 0
  return ""
end

map("i", "<C-f>", ListItem(), { noremap = true, expr = true, desc = "assign keys for RSTLNE" })
map("i", "<C-r>", ListReset(), { noremap = true, expr = true, desc = "assign keys for RSTLNE" })
