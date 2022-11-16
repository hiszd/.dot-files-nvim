local icons = {
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
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "廓",
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
  TypeParameter = "",
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
  completion = {
    completeopt = "menu,menuone,noinsert",
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      vim_item.menu = vim_item.kind
      vim_item.kind = icons[vim_item.kind]

      return vim_item
    end,
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-p>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() and not luasnip.expand_or_jumpable() then
        cmp.select_next_item()
      elseif luasnip and luasnip.expand_or_jumpable() then
        feedkey("<Plug>luasnip-expand-or-jump", "")
        -- elseif vim.fn["vsnip#available"](1) == 1 then
        -- feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif check_back_space() then
        feedkey("<Tab>", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() and not luasnip.jumpable(-1) then
        cmp.select_prev_item()
      elseif luasnip and luasnip.jumpable(-1) then
        feedkey("<Plug>luasnip-jump-prev", "")
      else
        feedkey("<S-Tab>", "")
        -- elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        -- feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'orgmode' },
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'path' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
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
