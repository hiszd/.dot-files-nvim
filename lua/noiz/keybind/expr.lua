vim.g.counter = 0

ListItem = function()
  local cnt = vim.g.counter + 1
  print(cnt)
  local rtrn = string.format("%q", cnt)
  print(rtrn)
  vim.g.counter = cnt
  return rtrn
end

ListReset = function()
  vim.g.counter = 0
  return ""
end

map({ "i" }, "<C-f>", ListItem(), { noremap = true, expr = true, desc = "assign keys for RSTLNE" })
map({ "i" }, "<C-r>", ListReset(), { noremap = true, expr = true, desc = "assign keys for RSTLNE" })
