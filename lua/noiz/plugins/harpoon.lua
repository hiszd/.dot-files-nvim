require("harpoon").setup({
  -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
  save_on_toggle = false,
  -- saves the harpoon file upon every change. disabling is unrecommended.
  save_on_change = true,
  -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
  enter_on_sendcmd = false,
  -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
  tmux_autoclose_windows = false,
  -- filetypes that you want to prevent from adding to the harpoon list menu.
  excluded_filetypes = { "harpoon" },
  -- set marks specific to each git branch inside git repository
  mark_branch = false,
})

map("t", "<C-e>", "<C-\\><C-n><C-o>", { silent = true })
map("i", "<C-e>", "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true })
map("n", "<C-e>", "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { silent = true })
map("n", "<leader>ha", "<Cmd>:lua require('harpoon.mark').add_file()<cr>", { noremap = true })
-- Direct file nav
map("n", "<leader>h1", "<Cmd>:lua require('harpoon.ui').nav_file(1)<cr>", { noremap = true })
map("n", "<leader>h2", "<Cmd>:lua require('harpoon.ui').nav_file(2)<cr>", { noremap = true })
map("n", "<leader>h3", "<Cmd>:lua require('harpoon.ui').nav_file(3)<cr>", { noremap = true })
map("n", "<leader>h4", "<Cmd>:lua require('harpoon.ui').nav_file(4)<cr>", { noremap = true })
map("n", "<leader>h5", "<Cmd>:lua require('harpoon.ui').nav_file(5)<cr>", { noremap = true })
map("n", "<leader>h6", "<Cmd>:lua require('harpoon.ui').nav_file(6)<cr>", { noremap = true })
map("n", "<leader>h7", "<Cmd>:lua require('harpoon.ui').nav_file(7)<cr>", { noremap = true })
map("n", "<leader>h8", "<Cmd>:lua require('harpoon.ui').nav_file(8)<cr>", { noremap = true })
map("n", "<leader>h9", "<Cmd>:lua require('harpoon.ui').nav_file(9)<cr>", { noremap = true })
map("n", "<leader>h0", "<Cmd>:lua require('harpoon.ui').nav_file(10)<cr>", { noremap = true })
-- Direct terminal nav
map("n", "<leader>hh1", "<Cmd>:lua require('harpoon.term').gotoTerminal(1)<cr><Insert>", { noremap = true })
map("n", "<leader>hh2", "<Cmd>:lua require('harpoon.term').gotoTerminal(2)<cr><Insert>", { noremap = true })
map("n", "<leader>hh3", "<Cmd>:lua require('harpoon.term').gotoTerminal(3)<cr><Insert>", { noremap = true })
map("n", "<leader>hh4", "<Cmd>:lua require('harpoon.term').gotoTerminal(4)<cr><Insert>", { noremap = true })
map("n", "<leader>hh5", "<Cmd>:lua require('harpoon.term').gotoTerminal(5)<cr><Insert>", { noremap = true })
map("n", "<leader>hh6", "<Cmd>:lua require('harpoon.term').gotoTerminal(6)<cr><Insert>", { noremap = true })
map("n", "<leader>hh7", "<Cmd>:lua require('harpoon.term').gotoTerminal(7)<cr><Insert>", { noremap = true })
map("n", "<leader>hh8", "<Cmd>:lua require('harpoon.term').gotoTerminal(8)<cr><Insert>", { noremap = true })
map("n", "<leader>hh9", "<Cmd>:lua require('harpoon.term').gotoTerminal(9)<cr><Insert>", { noremap = true })
map("n", "<leader>hh0", "<Cmd>:lua require('harpoon.term').gotoTerminal(10)<cr><Insert>", { noremap = true })
