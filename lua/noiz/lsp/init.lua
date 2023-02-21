local M = {}
local config = require('noiz.lsp.config')

-- local lsp_installer = require("nvim-lsp-installer")

-- lsp_installer.setup {
-- automatic_installation = true,
-- }

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'prismals', 'jsonls', 'lua_ls', 'cssls', 'tsserver', 'rust_analyzer' },
})

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = config.custom_attach,
      capabilities = config.updated_capabilities,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      }
    }
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup {}
  end
}

vim.diagnostic.config {
  virtual_text = {
    source = "always",
    prefix = " ",
    spacing = 6,
  },
  float = {
    source = "always",
  },
  signs = true,
  underline = false,
  update_in_insert = false,
}

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities = vim.tbl_deep_extend("keep", capabilities, )
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- local servers = { 'tsserver', 'prismals', 'jsonls' }
-- local nvim_lsp = require('lspconfig')
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = config.custom_attach,
--     capabilities = config.updated_capabilities,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end
-- require('noiz.lsp.sumneko')
require('noiz.lsp.null-ls')
require('noiz.lsp.rust')
-- require('noiz.lsp.c')

return M
