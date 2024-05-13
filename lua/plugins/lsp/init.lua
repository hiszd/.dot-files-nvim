local relpath = "plugins.lsp."

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'hrsh7th/nvim-cmp',
        dependencies = {
          {
            'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim',
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
          }
        },
      },
    },
    config = function()
      local cmp = require("cmp")
      require(relpath .. "cmp")(cmp)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(_, bufnr)
        vim.print("LSP Attached")
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
        local opts = { buffer = bufnr, remap = false }
        ---@param optsl table
        ---@return table
        local combine = function(optsl)
          return vim.tbl_deep_extend("force", opts, optsl)
        end

        local map = map_impl("LSP")

        map('n', 'gD', function()
          vim.lsp.buf.declaration()
        end, combine({ desc = "Goto Declaration" }))
        map("n", "gd", function()
          -- vim.lsp.buf.definition()
          require("telescope.builtin").lsp_definitions()
        end, combine({ desc = "Goto Definition" }))
        map("n", "I", function()
          vim.lsp.buf.hover()
        end, combine({ desc = "Show Hover" }))
        map('n', 'gi', function()
          vim.lsp.buf.implementation()
        end, combine({ desc = "Goto Implementation" }))
        map('n', '<C-k>', function()
          vim.lsp.buf.signature_help()
        end, combine({ desc = "Show Signature Help" }))
        map('n', '<leader>D', function()
          vim.lsp.buf.type_definition()
        end, combine({ desc = "Goto Type Definition" }))
        map("n", "<leader>lws", function()
          vim.lsp.buf.workspace_symbol()
        end, combine({ desc = "Workspace Symbol" }))
        map("n", "]d", function()
          vim.diagnostic.goto_next()
        end, combine({ desc = "Next Diagnostic" }))
        map("n", "[d", function()
          vim.diagnostic.goto_prev()
        end, combine({ desc = "Prev Diagnostic" }))
        map("n", "<leader>lca", function()
          vim.lsp.buf.code_action()
        end, combine({ desc = "Code Action" }))
        map("n", "<leader>lrr", function()
          vim.lsp.buf.references()
        end, combine({ desc = "References" }))
        map("n", "<leader>lrn", function()
          vim.lsp.buf.rename()
        end, combine({ desc = "Rename" }))
        map("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, combine({ desc = "Show Signature Help" }))
        map("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, combine({ desc = "Format Document" }))

        map("n", "<leader>TD", function()
          if vim.diagnostic.is_disabled() then
            vim.diagnostic.enable()
          else
            vim.diagnostic.disable()
          end
        end, combine({ desc = "Toggle Diagnostics" }))

        vim.api.nvim_set_option_value("formatexpr", "v:lua.vim.lsp.formatexpr()", { buf = bufnr })
        vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
        vim.api.nvim_set_option_value("tagfunc", "v:lua.vim.lsp.tagfunc", { buf = bufnr })
      end

      local lspconfig = require("lspconfig")

      lspconfig.cssls.setup({
        init_options = {
          provideFormatter = false,
        },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.document_formatting = false
          on_attach(client, bufnr)
        end,
      })

      lspconfig.tsserver.setup({
        { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          client.server_capabilities.document_formatting = false
          on_attach(client, bufnr)
        end,
      })

      require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
          end
          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "./lua",
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {}
        }
      }

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      --   callback = function(ev)
      --     -- Enable completion triggered by <c-x><c-o>
      --     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      --     local opts = { buffer = ev.buf }
      --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      --     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      --     vim.keymap.set('n', '<space>lrn', vim.lsp.buf.rename, opts)
      --     vim.keymap.set({ 'n', 'v' }, '<space>lca', vim.lsp.buf.code_action, opts)
      --     vim.keymap.set('n', '<space>f', function()
      --       vim.lsp.buf.format { async = true }
      --     end, opts)
      --   end,
      -- })

      lspconfig.html.setup({
        filetypes = { 'html', 'tera' },
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.rust_analyzer.setup({
        -- cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
        cmd = { "rust-analyzer" },
        capabilities = capabilities,
        on_attach = on_attach,
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

      local servers = { 'ocamllsp', 'gopls', 'nil_ls', 'prismals', 'jsonls', 'cssls', 'tsserver', 'zls' }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end

      vim.diagnostic.config({
        virtual_text = true,
      })
    end,
  },
}
