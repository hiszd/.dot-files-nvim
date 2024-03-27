ListItem = function()
  if vim.g._z_counter == nil then
    vim.g._z_counter = 0
  end
  local cnt = vim.g._z_counter
  print("cnt: ", cnt)
  cnt = cnt + 1
  print("new cnt: ", cnt)
  local rtrn = string.format("%d", cnt)
  print("rtrn: ", rtrn)
  vim.g._z_counter = cnt
  print("counter: ", vim.g._z_counter)
  return rtrn
end

ListReset = function()
  vim.g._z_counter = 0
  print("counter reset")
end

map({ "i" }, "<C-f>", function()
  return ListItem()
end, { noremap = true, expr = true, desc = "assign keys for RSTLNE" })
map({ "i" }, "<C-r>", function()
  ListReset()
end, { noremap = true, expr = true, desc = "assign keys for RSTLNE" })
