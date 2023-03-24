local M = {}
local config = require("noiz.lsp.config")

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "prismals", "jsonls", "lua_ls", "cssls", "tsserver", "rust_analyzer", "clangd" },
})

require("mason-null-ls").setup({
  ensure_installed = { "eslint_d", "stylua", "cppcheck", "clang-format", "prettier" },
  automatic_installation = true,
  automatic_setup = true,
})
require("null-ls").setup()
require("mason-null-ls").setup_handlers()

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      on_attach = config.custom_attach,
      capabilities = config.updated_capabilities,
      flags = {
        -- This will be the default in neovim 0.7+
        debounce_text_changes = 150,
      },
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function()
    require("rust-tools").setup({
      -- rust-tools options
      tools = {
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },
      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      -- https://rust-analyzer.github.io/manual.html#features
      server = {
        on_attach = config.custom_attach,
        capabilities = config.updated_capabilities,
        settings = {
          ["rust-analyzer"] = {
            assist = {
              importEnforceGranularity = true,
              importPrefix = "crate",
            },
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              -- default: `cargo check`
              command = "clippy",
            },
          },
          inlayHints = {
            lifetimeElisionHints = {
              enable = true,
              useParameterNames = true,
            },
          },
        },
      },
    })
  end,
})

vim.diagnostic.config({
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
})

require("noiz.lsp.null-ls")

return M
