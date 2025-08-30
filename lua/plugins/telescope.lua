local conf = function()
  local builtin = require("telescope.builtin")
  require('telescope').load_extension('recent_files')
  local map = map_impl("Telescope")
  -- Telescope bindings
  map({ "n" }, "<leader>ts", "<Cmd>Telescope treesitter<cr>", { noremap = true, desc = "Treesitter" })
  map({ "n" }, "<leader>af", "<Cmd>Telescope find_files<cr>", { noremap = true, desc = "Find Files" })
  map({ "n" }, "<leader>ao", "<Cmd>Telescope recent_files<cr>", { noremap = true, desc = "Find Files" })
  map({ "n" }, "<leader>tz", "<Cmd>Telescope colorscheme<cr>", { noremap = true, desc = "Color Schemes" })
  map({ "n" }, "<leader>ah", "<Cmd>Telescope help_tags<cr>", { noremap = true, desc = "Help Tags" })
  map({ "n" }, "<leader>axl", "<Cmd>Telescope quickfix<cr>", { noremap = true, desc = "Quickfix" })
  map({ "n" }, "<leader>am", "<Cmd>Telescope marks<cr>", { noremap = true, desc = "Marks" })
  map({ "n" }, "<leader>ad", '<Cmd>lua require("telescope.builtin").diagnostics({bufnr=0})<cr>',
    { noremap = true, desc = "Diagnostics" })
  map({ "n" }, "<leader>ar", "<Cmd>Telescope lsp_references<cr>", { noremap = true, desc = "LSP References" })
  map({ "n" }, "<leader>ab", "<Cmd>Telescope buffers<cr>", { noremap = true, desc = "Buffers" })
  map({ "n" }, "<leader>tk", "<Cmd>Telescope keymaps<cr>", { noremap = true, desc = "Keymaps" })
  map({ "n" }, "<leader>tt", "<Cmd>Telescope highlights<cr>", { noremap = true, desc = "Highlights" })
  map({ "n" }, "<leader>tj", "<Cmd>Telescope jumplist<cr>", { noremap = true, desc = "Jumplist" })
  map({ "n" }, "<leader>tds", "<Cmd>Telescope lsp_document_symbols<cr>",
    { noremap = true, desc = "LSP Document Symbols" })
  map({ "n" }, "<leader>ag", "<Cmd>Telescope live_grep<cr>", { noremap = true, desc = "Live Grep" })
  map({ "v" }, "<leader>ag", function()
    local sel = require('noiz.utils').get_visual_selection()
    builtin.grep_string({ search = sel })
  end, { noremap = true, desc = "Live Grep" })
  map({ "n" }, "<leader>akg", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
  end, { noremap = true, desc = "Live Grep Inner Word" })
  map({ "n" }, "<leader>tag", function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
  end, { noremap = true, desc = "Live Grep Inner Word" })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "smartpde/telescope-recent-files",
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
