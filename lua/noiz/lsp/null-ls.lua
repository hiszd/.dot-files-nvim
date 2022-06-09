local formatting = require('null-ls').builtins.formatting
local diagnostics = require('null-ls').builtins.diagnostics
local code_actions = require('null-ls').builtins.code_actions
local completion = require('null-ls').builtins.completion

require('null-ls')

require('null-ls').setup({
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format({async = true})<CR>")
      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format({async = true})")
    end

    if client.server_capabilities.document_range_formatting then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
  sources = {
    code_actions.eslint_d,
    diagnostics.eslint_d,
    completion.luasnip,
    formatting.eslint_d,
    formatting.prettier,
  },
})
