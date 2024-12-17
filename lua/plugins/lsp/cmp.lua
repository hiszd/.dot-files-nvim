return function(cmp)
  local cmp_select = { behavior = cmp.SelectBehavior.Insert }

  vim.opt.completeopt = { "menu", "menuone", "noselect" }
  vim.opt.shortmess:append "c"

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    completion = {
      autocomplete = {
        require('cmp.types').cmp.TriggerEvent.TextChanged,
      },
      keyword_length = 1,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping({
        i = cmp.mapping.select_prev_item(cmp_select),
      }),
      ["<C-n>"] = cmp.mapping({
        i = cmp.mapping.select_next_item(cmp_select),
      }),
      ["<C-y>"] = cmp.mapping({
        i = cmp.mapping.confirm({ select = true }),
      }),
      ["<C-Space>"] = cmp.mapping({
        i = cmp.mapping.complete(),
      }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "orgmode" },
      { name = "nvim_lua" },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = require('lspkind').cmp_format({
        mode = 'symbol',       -- show only symbol annotations
        maxwidth = 50,         -- prevent the popup from showing more than provided characters
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      })
    }
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    completion = {
      autocomplete = {
        require('cmp.types').cmp.TriggerEvent.TextChanged,
      },
      keyword_length = 1,
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'cmdline' },
    }, {
      { name = 'path' }
    }),
    -- preselect = cmp.PreselectMode.Item,
  })
end
