local conf = function()
  local builtin = require("telescope.builtin")
  -- Telescope bindings
  map("n", "<leader>ts", "<Cmd>Telescope treesitter<cr>", { noremap = true })
  map("n", "<leader>tf", "<Cmd>Telescope find_files<cr>", { noremap = true })
  map("n", "<leader>tz", "<Cmd>Telescope colorscheme<cr>", { noremap = true })
  map("n", "<leader>th", "<Cmd>Telescope help_tags<cr>", { noremap = true })
  map("n", "<leader>txl", "<Cmd>Telescope quickfix<cr>", { noremap = true })
  map("n", "<leader>tm", "<Cmd>Telescope marks<cr>", { noremap = true })
  map("n", "<leader>td", '<Cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<cr>', { noremap = true })
  map("n", "<leader>tr", "<Cmd>Telescope lsp_references<cr>", { noremap = true })
  map("n", "<leader>tb", "<Cmd>Telescope buffers<cr>", { noremap = true })
  map("n", "<leader>tk", "<Cmd>Telescope keymaps<cr>", { noremap = true })
  map("n", "<leader>tt", "<Cmd>Telescope highlights<cr>", { noremap = true })
  map("n", "<leader>tj", "<Cmd>Telescope jumplist<cr>", { noremap = true })
  map("n", "<leader>tds", "<Cmd>Telescope lsp_document_symbols<cr>", { noremap = true })

  map("n", "<leader>tg", "<Cmd>Telescope live_grep<cr>", { noremap = true })
  map("v", "<leader>tg", function()
    local sel = require('noiz.utils').get_visual_selection()
    builtin.grep_string({ search = sel })
  end, { noremap = true })
  map("n", "<leader>tig", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
  end, { noremap = true })
  map("n", "<leader>tag", function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
  end, { noremap = true })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
    config = conf,
  },
  -- {
  --   "nvim-telescope/telescope-frecency.nvim",
  --   config = function()
  --     require("telescope").load_extension("frecency")
  --   end,
  --   requires = { "kkharji/sqlite.lua" },
  -- },
}
