local relpath = "plugins.lsp."
local conf = function()
  local lsp = require('lsp-zero')
      .preset({
        float_border = 'rounded',
        call_servers = 'global',
        configure_diagnostics = true,
        setup_servers_on_start = true,
        set_lsp_keymaps = {
          preserve_mappings = false,
          omit = {},
        },
      })

  lsp.ensure_installed({ "lua_ls", "prismals", "jsonls", "cssls", "tsserver", "rust_analyzer@nightly" })

  local lspconfig = require("lspconfig")

  -- lspconfig.rust_analyzer.setup({
  --   -- cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
  --   settings = {
  --     ["rust-analyzer"] = {
  --       imports = {
  --         granularity = {
  --           group = "module",
  --         },
  --         prefix = "self",
  --       },
  --       cargo = {
  --         buildScripts = {
  --           enable = true,
  --         },
  --       },
  --       procMacro = {
  --         enable = true,
  --       },
  --     },
  --   },
  -- })

  -- lsp.set_preferences({
  --   suggest_lsp_servers = true,
  --   sign_icons = {
  --     error = "E",
  --     warn = "W",
  --     hint = "H",
  --     info = "I",
  --   },
  -- })

  local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
      -- vim.lsp.buf.definition()
      require("telescope.builtin").lsp_definitions()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>lws", function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>lca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>lrr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>lrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
  end

  lsp.on_attach(on_attach)

  local c = vim.lsp.protocol.make_client_capabilities()
  c.textDocument.completion.completionItem.snippetSupport = true
  c.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    },
  }

  lsp.on_attach(on_attach)

  lsp.configure("rust_analyzer", {
    -- cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  })

  lsp.configure("nil_ls", {})

  lsp.configure('lua_ls', {})

  lsp.setup_servers()

  lspconfig.ocamllsp.setup({
    -- cmd = { "ocamllsp" },
    -- filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    -- root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(c)
  })

  lsp.setup()

  require(relpath .. "cmp")()

  vim.diagnostic.config({
    virtual_text = true,
  })
end

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'onsails/lspkind.nvim' },
      { 'L3MON4D3/LuaSnip' }, -- Required
      { "rafamadriz/friendly-snippets" },
    },
    config = conf,
  }
}
