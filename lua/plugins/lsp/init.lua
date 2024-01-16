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

  local lspconfig = require("lspconfig")

  require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { "lua_ls", "prismals", "jsonls", "cssls", "tsserver", "rust_analyzer@nightly" },
    handlers = {
      lsp.default_setup,
    }
  })

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

  lspconfig.nil_ls.setup({})
  lspconfig.lua_ls.setup({})

  lspconfig.ocamllsp.setup({
    -- cmd = { "ocamllsp" },
    -- filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    -- root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(c)
  })

  -- require(relpath .. "cmp")()

  vim.diagnostic.config({
    virtual_text = true,
  })
end

return {
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {
        'neovim/nvim-lspconfig',
        dependencies = {
          { 'hrsh7th/cmp-nvim-lsp' },
        }
      },
      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          { 'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim' }
        },
      },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        -- lsp_zero.default_keymaps({ buffer = bufnr })

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

        vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr()", { buf = bufnr })
        vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
        vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })
      end)

      local lspconfig = require("lspconfig")

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { "prismals", "jsonls", "cssls", "tsserver", "rust_analyzer@nightly" },
        handlers = {
          lsp_zero.default_setup,
        },
      })

      local lua_opts = lsp_zero.nvim_lua_ls({
        single_file_support = false,
      })

      lspconfig.lua_ls.setup(lua_opts)

      lsp_zero.setup_servers({ 'nil_ls', 'prismals', 'jsonls', 'cssls', 'tsserver', 'rust_analyzer' })

      require(relpath .. "cmp")()

      -- vim.diagnostic.config({
      --   virtual_text = true,
      -- })
    end,
  },
}
