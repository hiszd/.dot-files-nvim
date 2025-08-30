return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()

      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
    init = function()
      local map = map_impl("LSP Lines")
      map({ "n" }, "<leader>ll", function()
        local config = vim.diagnostic.config() or {};
        local lns = config.virtual_text;
        local text = not config.virtual_text;
        vim.diagnostic.config({ virtual_text = text, virtual_lines = lns });
      end, { desc = "Toggle LSP Lines" })
    end,
  },
}
