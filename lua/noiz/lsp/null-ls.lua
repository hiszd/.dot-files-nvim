local formatting = require('null-ls').builtins.formatting
local diagnostics = require('null-ls').builtins.diagnostics
local code_actions = require('null-ls').builtins.code_actions
-- local completion = require('null-ls').builtins.completion

require('null-ls')
local config = require('noiz.lsp.config')

require('null-ls').setup({
  debug = true,
  on_attach = config.custom_attach,
  capabilities = config.updated_capabilities,
  sources = {
    code_actions.eslint_d,
    diagnostics.eslint_d,
    diagnostics.cppcheck.with {
      extra_args = { "--force" },
    },
    formatting.eslint_d,
    formatting.clang_format,
    formatting.prettier.with {
      filetypes = { "handlebars", "graphql", "vue", "less", "jsonc", "scss", "yaml", "markdown", "html", "json", "css" },
    },
  },
})
