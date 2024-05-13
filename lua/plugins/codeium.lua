return {
  {
    "hiszd/codeium.vim",
    config = function()
      vim.g.codeium_disable_bindings = 1
      local map = map_impl("LSP")
      map('i', '<C-t>', function() return vim.fn['codeium#Accept']() end, { expr = true, desc = "Codeium Accept" })
      map('i', '<C-]>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, desc = "Codeium Cycle Completions" })
      map('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, desc = "Codeium Clear" })
      map('i', '<C-k>', function()
        vim.fn['CodeiumToggle']()
        local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
        vim.api.nvim_feedkeys(keys, "i", true)
        vim.api.nvim_feedkeys("\"_cc", "n", true)
      end, { expr = true, desc = "Codeium Disable" })
    end
  }
}
