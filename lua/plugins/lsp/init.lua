local relpath = "plugins.lsp."

return {
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
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
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
        -- ensure_installed = { "prismals", "jsonls", "cssls", "tsserver", "rust_analyzer@nightly" },
        ensure_installed = { "gopls", "prismals", "jsonls", "cssls", "tsserver" },
        handlers = {
          lsp_zero.default_setup,
        },
      })

      local lua_opts = lsp_zero.nvim_lua_ls({
        single_file_support = false,
        cmd = { "lua-language-server" },
      })

      lspconfig.lua_ls.setup(lua_opts)

      lspconfig.html.setup({
        filetypes = { 'html', 'tera' },
      })

      lspconfig.rust_analyzer.setup({
        -- cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
        cmd = { "rust-analyzer" },
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

      lsp_zero.setup_servers({ 'ocamllsp', 'gopls', 'nil_ls', 'prismals', 'jsonls', 'cssls', 'tsserver' })

      require(relpath .. "cmp")()

      vim.diagnostic.config({
        virtual_text = true,
      })
    end,
  },
}
