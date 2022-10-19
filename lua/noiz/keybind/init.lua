-- local map = vim.api.nvim_set_keymap

map('n', '<leader>ds', '$a', { noremap = true })
-- map('n', '<leader>dq', ':q<cr>', { noremap = true })
map('n', '<leader>dq', ':BufferClose<cr>', { noremap = true })
map('n', '<leader>da', ':wq<cr>', { noremap = true })
map('n', '<leader>n', ':NvimTreeToggle<cr>', { noremap = true })
-- map('n', '<leader>n', ':NvimTreeFindFile<cr>', { noremap = true })
map('n', '<leader>df', ':lua vim.lsp.buf.formatting()<cr>', { noremap = true })
map('n', '<leader>dp', ':Prettier<cr>', { noremap = true })
map('n', '<leader>du', 'gUiw`]a', { noremap = true })
map('n', '<leader>dt', 'guiwgUl', { noremap = true })
map('n', '<leader>w', ':w<cr>', { noremap = true })
map('n', '<leader>cr', ':lua require("nvim-reload").Reload()<cr>', { noremap = true })
map('n', '<leader>dl', '@:', { noremap = true })
map('n', '<leader><leader>tnc', ':lua print(vim.fn.expand("%:p"))<cr>', { noremap = true })

-- Telescope bindings
map('n', '<leader>tt', ':Telescope treesitter<cr>', { noremap = true })
map('n', '<leader>tf', ':Telescope find_files<cr>', { noremap = true })
map('n', '<leader>tz', ':Telescope colorscheme<cr>', { noremap = true })
map('n', '<leader>th', ':Telescope help_tags<cr>', { noremap = true })
map('n', '<leader>tqf', ':Telescope quickfix<cr>', { noremap = true })
map('n', '<leader>tm', ':Telescope marks<cr>', { noremap = true })
map('n', '<leader>td', ':lua require"telescope.builtin".diagnostics({bufnr=0})<cr>', { noremap = true })
map('n', '<leader>tr', ':Telescope lsp_references<cr>', { noremap = true })
map('n', '<leader>tk', ':Telescope keymaps<cr>', { noremap = true })
map('n', '<leader>tg', ':Telescope grep_string<cr>', { noremap = true })
map('v', '<leader>tg', '"zy:Telescope grep_string default_text=<C-r>z<cr>', { noremap = true })
map('n', '<leader>eh', ":execute 'hi' synIDattr(synID(line('.'), col('.'), 1), 'name')<cr>", { noremap = true })
map('n', '<leader>rt', ':lua require("clrtheme").reload()<cr>', { noremap = true })
map('n', '<leader>ht', ':TSHighlightCapturesUnderCursor<cr>', { noremap = true })

map('n', '<leader>l', ':lua require("noiz.utils").log()<cr>', { noremap = true })

map('n', '<leader>mq', ':lua QWERTY()<cr>', { noremap = true })
map('n', '<leader>mr', ':lua RSTLNE()<cr>', { noremap = true })

map('n', '<leader>y', '"+y', { noremap = true })
