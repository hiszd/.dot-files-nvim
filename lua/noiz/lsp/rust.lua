local config = require('noiz.lsp.config')

require('rust-tools').setup({
  server = {
    on_attach = config.custom_attach,
  },
})
