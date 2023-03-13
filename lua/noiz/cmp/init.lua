local icons = {
  Codeium = "☢",
  Text = "",
  Method = "",
  Function = "",
  Constructor = "⌘",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = '',
  Value = "",
  Enum = "",
  Keyword = '',
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = '',
}

local sources = {
  nvim_lsp = "LSP",
  luasnip = "SNP",
  treesitter = "TSI",
  path = "PTH",
  buffer = "BUF",
  nvim_lsp_signature_help = "SIG",
  codeium = "CDE",
  orgmode = "ORG",
}

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local luasnip = require('luasnip')

local lsp_spinner = require('lsp_spinner')

lsp_spinner.setup()

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Setup autopairs
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

local types = require('cmp.types')

cmp.setup({
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  confirmation = {
    get_commit_characters = function()
      return {}
    end,
  },
  sorting = {
    priority_weight = 0.7,
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
      cmp.config.compare.locality,
      function(ent1, ent2)
        local kind1 = ent1:get_kind()
        local kind2 = ent2:get_kind()
        if kind1 ~= kind2 then
          if kind1 == types.lsp.CompletionItemKind.Snippet then
            return false
          end
          if kind2 == types.lsp.CompletionItemKind.Snippet then
            return true
          end
        end
      end,
    },
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  },
  view = { entries = "custom" },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local spaces = ""
      for _ = 1, (8 - string.len(vim_item.kind)), 1 do
        spaces = spaces .. " "
      end
      vim_item.menu = vim_item.kind .. spaces .. "(" .. (sources[entry.source.name] or "") .. ")"
      vim_item.kind = " " .. (icons[vim_item.kind] or "") .. " "
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:PmenuSel,CursorLine:CmpItemSel",
      col_offset = -3,
      side_padding = 0,
    },
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   -- documentation = cmp.config.window.bordered(),
  -- },
  mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-p>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() and not luasnip.expand_or_jumpable() then
        cmp.confirm({ select = false })
      elseif luasnip and luasnip.expand_or_jumpable() then
        feedkey("<Plug>luasnip-expand-or-jump", "")
      else
        fallback()
      end
    end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      else
        feedkey("<S-Tab>", "")
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'orgmode' },
    { name = 'nvim_lsp',                priority = 90 },
    { name = 'treesitter',              priority = 45 },
    { name = 'path',                    priority = 85 },
    { name = 'luasnip',                 keyword_length = 2, max_item_count = 4, priority = 10 },
    { name = 'buffer',                  max_item_count = 4, priority = 40 },
    { name = 'nvim_lsp_signature_help', priority = 2 },
    { name = 'codeium',                 keyword_length = 3, max_item_count = 4, priority = 86 },
  }),
  preselect = cmp.PreselectMode.None,
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
        ["<esc>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
      else
        -- fallback()
        feedkey('<C-c>', '')
      end
    end, { 'i', 'c' }),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        else
          fallback()
        end
      end
    }),
    -- ['<Tab>'] = cmp.mapping({
    --   i = cmp.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    --   c = function()
    --     local actentry = cmp.get_active_entry()
    --     local entry = cmp.get_selected_entry().completion_item.label
    --     local entries = cmp.get_entries()
    --     local first = false
    --     if entries[1].completion_item.label == entry and actentry == nil then
    --       first = true
    --     end
    --     if first == true then
    --       cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --       wait(100)
    --       cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
    --       -- else
    --       -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    --     end
    --     -- print('Down: ' .. vim.inspect(cmp.get_selected_entry(), { depth = 3 }))
    --     -- vim.api.nvim_notify(tostring('Down: ' .. vim.inspect(cmp.get_active_entry(), { depth = 3 })), 1, {})
    --   end
    -- }),
  }),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  -- preselect = cmp.PreselectMode.Insert,
})
