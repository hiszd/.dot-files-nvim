-- local map = vim.api.nvim_set_keymap

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

map("n", "<leader>hg", "<Cmd>:Inspect<CR>", { noremap = true })
map("n", "<leader>da", "<Cmd>wq<cr>", { noremap = true, desc = "Save and quit" })
map(
  "n",
  "<leader>f",
  "<Cmd>lua vim.lsp.buf.format()<cr>",
  { noremap = true, desc = "Use LSP to format current buffer" }
)
-- map("i", "<C-l>", function()
--   local luasnip = require("luasnip")
--   if luasnip and luasnip.expand_or_jumpable() then
--     feedkey("<Plug>luasnip-expand-or-jump", "")
--   end
-- end, { desc = "luasnip expand or jump if in snippet", silent = true, noremap = true })
map("n", "<leader>du", "gUiw`]a", { noremap = true, desc = "UPPERCASE inner word(see I just used it there)" })
map("n", "<leader>dt", "guiwgUl", { noremap = true, desc = "Title case inner word" })
map("n", "<leader>w", "<Cmd>w<cr>", { noremap = true, desc = "Save current buffer" })
map("n", "<leader><leader>w", "<Cmd>lua vim.lsp.buf.format()<cr><Cmd>w<cr>", { noremap = true, desc = "Save current buffer" })
map("n", "<leader>cr", '<Cmd>lua require("nvim-reload").Reload()<cr>', { noremap = true, desc = "reload whole config" })
map("n", "gl", "$", { noremap = true, desc = "go to end of line" })
map("n", "gh", "^", { noremap = true, desc = "go to beginning of line" })

map("n", "<leader>dl", "@<Cmd>", { noremap = true })

map(
  "n",
  "<leader><leader>tnc",
  '<Cmd>lua print(vim.fn.expand("%:p"))<cr>',
  { noremap = true, desc = "Print current filename" }
)
map("n", "<leader><leader>x", "<Cmd>so %<cr>", { noremap = true, desc = "source current file" })
map("n", "<leader>y", '"+y', { noremap = true, desc = "yank to clipboard" })
map("v", "<leader>y", '"+y', { noremap = true, desc = "yank to clipboard" })

map("n", "<leader>rt", '<Cmd>lua require("clrtheme").reload()<cr>', { noremap = true, desc = "reload clrtheme" })

map(
  "n",
  "<leader>l",
  '<Cmd>lua require("noiz.utils").log()<cr>',
  { noremap = true, desc = "log inner word under cursor" }
)
map("n", "<leader>mq", "<Cmd>lua QWERTY()<cr>", { noremap = true, desc = "assign keys for QWERTY" })
map("n", "<leader>mr", "<Cmd>lua RSTLNE()<cr>", { noremap = true, desc = "assign keys for RSTLNE" })

-- local hid = require("noiz.keybind.hid")
-- hid.startjob()
require('noiz.keybind.expr')
