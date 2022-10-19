local g = vim.g

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "map", "use" },
        },
      },
    },
  },
}

-- Global functions
P = function(v)
  print(vim.inspect(v))
  return v
end

RSTLNE = function()
  map('n', '<leader>o', 'A<insert><CR>', { silent = true, nowait = true, desc = 'Insert newline' })
  map('n', 'k', '<Insert>', { silent = true, desc = 'Enter insert mode' })
  map('n', 'n', '<Down>', { silent = true, desc = 'Move down' })
  map('n', 'i', '<Up>', { silent = true, desc = 'Move up' })
  map('n', 'o', '<Right>', { silent = true, desc = 'Move right' })
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
