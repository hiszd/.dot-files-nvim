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
      manage_nvim_cmp = {
        set_basic_mappings = true,
        set_extra_mappings = true,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
      }
    })

lsp.ensure_installed({ "lua_ls", "prismals", "jsonls", "cssls", "tsserver", "rust_analyzer@nightly" })

local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
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

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

local sss = {
  { name = "nvim_lua" },
}
local srcs = lsp.defaults.cmp_sources(sss)

lsp.setup_nvim_cmp({
  sources = srcs,
  mapping = cmp_mappings,
})


lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

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

local lua_ls_config = {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      runtime = { version = 'LuaJIT' },
      telemetry = { enable = false },
      -- workspace = {
      --   checkThirdParty = true,
      --   library = {
      --     vim.env.VIMRUNTIME,
      --     "/home/zion/programming/nvim/",
      --     "${3rd}/luv/library",
      --     "${3rd}/busted/library",
      --   },
      -- }
    },
  },
}

lsp.on_attach(on_attach)

lsp.configure("nil_ls", {})

lsp.configure('lua_ls', lua_ls_config)

lsp.setup_servers()

-- local lua_lsp = lsp.nvim_lua_ls()
-- lua_lsp.capabilities = require("cmp_nvim_lsp").default_capabilities(c)

-- lspconfig.lua_ls.setup(lua_lsp)
-- lspconfig.lua_ls.setup({
--   cmd = "lua-language-server",
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

lspconfig.ocamllsp.setup({
  -- cmd = { "ocamllsp" },
  -- filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  -- root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
  on_attach = on_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(c)
})

lsp.setup()

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
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
  mapping = cmp.mapping.preset.cmdline({
    ["<esc>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else
        feedkey("<C-c>", "")
      end
    end, { "i", "c" }),
    ["<CR>"] = cmp.mapping({
      i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        else
          fallback()
        end
      end,
    }),
  }),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
  preselect = cmp.PreselectMode.Item,
})

vim.diagnostic.config({
  virtual_text = true,
})
