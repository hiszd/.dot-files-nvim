map("n", "<leader>y", '"+y', { noremap = true, desc = "yank to clipboard" })
map("v", "<leader>y", '"+y', { noremap = true, desc = "yank to clipboard" })

map("n", "<leader>p", '"0p', { noremap = true })
map("v", "<leader>p", '"0p', { noremap = true })

local move_line = function(dir)
  local pos = vim.fn.getcurpos()
  local line = pos[2]
  if dir == "up" then
    local cur = vim.fn.getline(line)
    local other = vim.fn.getline(line - 1)
    vim.fn.setline(line - 1, cur)
    vim.fn.setline(line, other)
    vim.fn.cursor(line - 1, 1)
  elseif dir == "down" then
    local cur = vim.fn.getline(line)
    local other = vim.fn.getline(line + 1)
    vim.fn.setline(line + 1, cur)
    vim.fn.setline(line, other)
    vim.fn.cursor(line + 1, 1)
  else
    print("invalid direction")
  end
end

map("n", "I", function() move_line("up") end, { noremap = true })
map("n", "N", function() move_line("down") end, { noremap = true })

map("v", "N", ":m '>+1<CR>gv=gv", { noremap = true, desc = "move line down" })
map("v", "I", ":m '<-2<CR>gv=gv", { noremap = true, desc = "move line up" })
