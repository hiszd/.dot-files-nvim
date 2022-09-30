local g = vim.g

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "map" },
        },
      },
    },
  },
}

g.bufferline = {
  animation = true,
  auto_hide = true,
  tabpages = true,
  closable = true,
  clickable = true,
  icons = true,
  icon_custom_colors = true,

  -- Configure icons on the bufferline.
  icon_separator_active = "▎",
  icon_separator_inactive = "▎",
  icon_close_tab = "",
  icon_close_tab_modified = "●",
  icon_pinned = "車",

  insert_at_end = true,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,
  semantic_letters = true,
}


-- Global functions
P = function(v)
  print(vim.inspect(v))
  return v
end

RSTLNE = function()
  map('n', 'n', '<Down>')
  map('n', 'i', '<Up>')
  map('n', 'o', '<Right>')
  map('n', 'k', '<INSERT>')
  map('n', '<leader>y', '$a<cr>')
end

QWERTY = function()
  map('n', 'n', 'n')
  map('n', 'i', 'i')
  map('n', 'o', 'o')
  map('n', 'k', 'k')
end


RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
