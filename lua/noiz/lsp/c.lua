local config = require('noiz.lsp.config')

require('lspconfig').clangd.setup {
  on_attach = config.custom_attach,
  capabilities = config.updated_capabilities,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  }
}
