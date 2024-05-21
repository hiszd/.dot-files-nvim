local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local map = map_impl("Noiz.Keybind")

map({ "n" }, "<leader>hg", "<Cmd>:Inspect<CR>", { noremap = true })

-- map(
--   { "n" },
--   "<leader>f",
--   "<Cmd>lua vim.lsp.buf.format()<cr>",
--   { noremap = true, desc = "Use LSP to format current buffer" }
-- )

map({ "n" }, "<leader>uiw", "gUiw`]a<Esc>b", { noremap = true, desc = "UPPERCASE inner word(see I just used it there)" })
map({ "n" }, "<leader>tiw", "guiwgUl", { noremap = true, desc = "Title case inner word" })
map({ "n" }, "<leader>w", "<Cmd>w<cr>", { noremap = true, desc = "Save current buffer" })
map({ "n" }, "<leader><leader>w", "<Cmd>lua vim.lsp.buf.format()<cr><Cmd>w<cr>",
  { noremap = true, desc = "Save current buffer" })
map({ "n" }, "<leader>cr", '<Cmd>lua require("nvim-reload").Reload()<cr>',
  { noremap = true, desc = "reload whole config" })
map({ "n" }, "ge", "$", { noremap = true, desc = "go to end of line" })
map({ "n" }, "gh", "^", { noremap = true, desc = "go to beginning of line" })

map(
  { "n" },
  "<leader><leader>tnc",
  '<Cmd>lua print(vim.fn.expand("%:p"))<cr>',
  { noremap = true, desc = "Print current filename" }
)

map({ "n" }, "<leader><leader>x", "<Cmd>so %<cr>", { noremap = true, desc = "source current file" })

map(
  { "n" },
  "<leader>l",
  '<Cmd>lua require("noiz.utils").log()<cr>',
  { noremap = true, desc = "log inner word under cursor" }
)

map({ "n" }, "<leader>mq", "<Cmd>lua QWERTY()<cr>", { noremap = true, desc = "assign keys for QWERTY" })
map({ "n" }, "<leader>mr", "<Cmd>lua RSTLNE()<cr>", { noremap = true, desc = "assign keys for RSTLNE" })


map({ "n" }, "<leader>br", "<Cmd>:bnext<CR>")
map({ "n" }, "<leader>ba", "<Cmd>:bprevious<CR>")
map({ "n" }, "<leader>q", "<Cmd>:bdelete<CR>")
map({ "n" }, "<leader>tq", "<Cmd>:tabclose<CR>")


map({ "n" }, "<C-H>", "<C-^>", { noremap = true })

map({ "n" }, "<leader>df", function()
  vim.cmd("setlocal nofoldenable");
end, { noremap = true, desc = "" })

-- local tscope = require('telescope.builtin')

-- local hid = require("noiz.keybind.hid")
-- hid.startjob()
require('noiz.keybind.expr')
require('noiz.keybind.yank')
