map("t", "<C-e>", "<C-\\><C-n><C-o>", { silent = true, desc = "Leave terminal mode and go to last jump" })
map(
  "i",
  "<C-e>",
  "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
  { silent = true, desc = "Toggle Harpoon quick menu" }
)
map(
  "n",
  "<C-e>",
  "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
  { silent = true, desc = "Toggle Harpoon quick menu" }
)
map(
  "n",
  "<leader>ha",
  "<Cmd>:lua require('harpoon.mark').add_file()<cr>",
  { noremap = true, desc = "Add file to Harpoon" }
)
-- Direct file nav
map(
  "n",
  "<leader>h1",
  "<Cmd>:lua require('harpoon.ui').nav_file(1)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 1" }
)
map(
  "n",
  "<leader>h2",
  "<Cmd>:lua require('harpoon.ui').nav_file(2)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 2" }
)
map(
  "n",
  "<leader>h3",
  "<Cmd>:lua require('harpoon.ui').nav_file(3)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 3" }
)
map(
  "n",
  "<leader>h4",
  "<Cmd>:lua require('harpoon.ui').nav_file(4)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 4" }
)
map(
  "n",
  "<leader>h5",
  "<Cmd>:lua require('harpoon.ui').nav_file(5)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 5" }
)
map(
  "n",
  "<leader>h6",
  "<Cmd>:lua require('harpoon.ui').nav_file(6)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 6" }
)
map(
  "n",
  "<leader>h7",
  "<Cmd>:lua require('harpoon.ui').nav_file(7)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 7" }
)
map(
  "n",
  "<leader>h8",
  "<Cmd>:lua require('harpoon.ui').nav_file(8)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 8" }
)
map(
  "n",
  "<leader>h9",
  "<Cmd>:lua require('harpoon.ui').nav_file(9)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 9" }
)
map(
  "n",
  "<leader>h0",
  "<Cmd>:lua require('harpoon.ui').nav_file(10)<cr>",
  { noremap = true, desc = "Navigate to Harpoon file 10" }
)
-- Direct terminal nav
map(
  "n",
  "<leader>hh1",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(1)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 1" }
)
map(
  "n",
  "<leader>hh2",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(2)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 2" }
)
map(
  "n",
  "<leader>hh3",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(3)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 3" }
)
map(
  "n",
  "<leader>hh4",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(4)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 4" }
)
map(
  "n",
  "<leader>hh5",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(5)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 5" }
)
map(
  "n",
  "<leader>hh6",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(6)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 6" }
)
map(
  "n",
  "<leader>hh7",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(7)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 7" }
)
map(
  "n",
  "<leader>hh8",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(8)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 8" }
)
map(
  "n",
  "<leader>hh9",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(9)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 9" }
)
map(
  "n",
  "<leader>hh0",
  "<Cmd>:lua require('harpoon.term').gotoTerminal(10)<cr><Insert>",
  { noremap = true, desc = "Navigate to Harpoon terminal 10" }
)
