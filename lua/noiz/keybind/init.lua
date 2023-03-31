-- local map = vim.api.nvim_set_keymap

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

map("n", "<leader>ds", "$a", { noremap = true })
map("n", "<leader>da", "<Cmd>wq<cr>", { noremap = true })
map("n", "<leader>n", "<Cmd>Neotree reveal toggle<cr>", { noremap = true })
map("n", "<leader>gn", "<Cmd>Neotree float git_status<cr>", { noremap = true })
map("n", "<leader>df", "<Cmd>lua vim.lsp.buf.format()<cr>", { noremap = true })
map("i", "<C-l>", function()
  local luasnip = require("luasnip")
  if luasnip and luasnip.expand_or_jumpable() then
    feedkey("<Plug>luasnip-expand-or-jump", "")
  end
end, { desc = "luasnip expand or jump if in snippet", silent = true, noremap = true })
map("n", "<leader>du", "gUiw`]a", { noremap = true })
map("n", "<leader>dt", "guiwgUl", { noremap = true })
map("n", "<leader>w", "<Cmd>w<cr>", { noremap = true })
map("n", "<leader>cr", '<Cmd>lua require("nvim-reload").Reload()<cr>', { noremap = true })
map("n", "<leader>dl", "@<Cmd>", { noremap = true })
map("n", "<leader><leader>tnc", '<Cmd>lua print(vim.fn.expand("%:p"))<cr>', { noremap = true })

-- Telescope bindings
map("n", "<leader>tt", "<Cmd>Telescope treesitter<cr>", { noremap = true })
map("n", "<leader>tf", "<Cmd>Telescope find_files<cr>", { noremap = true })
map("n", "<leader>tz", "<Cmd>Telescope colorscheme<cr>", { noremap = true })
map("n", "<leader>th", "<Cmd>Telescope help_tags<cr>", { noremap = true })
map("n", "<leader>tqf", "<Cmd>Telescope quickfix<cr>", { noremap = true })
map("n", "<leader>tm", "<Cmd>Telescope marks<cr>", { noremap = true })
map("n", "<leader>td", '<Cmd>lua require"telescope.builtin".diagnostics({bufnr=0})<cr>', { noremap = true })
map("n", "<leader>tr", "<Cmd>Telescope lsp_references<cr>", { noremap = true })
map("n", "<leader>tk", "<Cmd>Telescope keymaps<cr>", { noremap = true })
map("n", "<leader>tg", "<Cmd>Telescope grep_string<cr>", { noremap = true })
map("v", "<leader>tg", '"zy<Cmd>Telescope grep_string default_text=<C-r>z<cr>', { noremap = true })
map("n", "<leader>eh", "<Cmd>execute 'hi' synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>", { noremap = true })
map("n", "<leader>rt", '<Cmd>lua require("clrtheme").reload()<cr>', { noremap = true })
map("n", "<leader>ht", "<Cmd>TSHighlightCapturesUnderCursor<cr>", { noremap = true })

map("n", "<leader>l", '<Cmd>lua require("noiz.utils").log()<cr>', { noremap = true })

map("n", "<leader><leader>x", "<Cmd>so %<cr>", { noremap = true })

map("n", "<leader>l", '<Cmd>lua require("noiz.utils").log()<cr>', { noremap = true })

map("n", "<leader>mq", "<Cmd>lua QWERTY()<cr>", { noremap = true })
map("n", "<leader>mr", "<Cmd>lua RSTLNE()<cr>", { noremap = true })

map("n", "<leader>y", '"+y', { noremap = true })
map("v", "<leader>y", '"+y', { noremap = true })

map("v", "gz", '<Cmd>lua require("noiz.cmp.codex").complete()<cr>', { noremap = true })

-- local hid = require("noiz.keybind.hid")
-- hid.startjob()
