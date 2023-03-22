local g = vim.g

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" },
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
  map('n', 'l', 'A<CR>', { silent = true, nowait = true, desc = 'Insert newline' })
  map('n', 'k', '<Insert>', { silent = true, desc = 'Enter insert mode' })
  map('v', 'k', '<Insert>', { silent = true, desc = 'Enter insert mode' })
  map('n', 'n', '<Down>', { silent = true, desc = 'Move down' })
  map('v', 'n', '<Down>', { silent = true, desc = 'Move down' })
  map('n', 'i', '<Up>', { silent = true, desc = 'Move up' })
  map('v', 'i', '<Up>', { silent = true, desc = 'Move up' })
  map('n', 'o', '<Right>', { silent = true, desc = 'Move right' })
  map('v', 'o', '<Right>', { silent = true, desc = 'Move right' })
  print("RSTLNE")
end

QWERTY = function()
  map('n', 'n', 'n')
  map('v', 'n', 'n')
  map('n', 'i', 'i')
  map('v', 'i', 'i')
  map('n', 'o', 'o')
  map('v', 'o', 'o')
  map('n', 'k', 'k')
  map('v', 'k', 'k')
  print("QWERTY")
end


RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

function Printf(...) print(string.format(...)) end

function FMT(...) return string.format(...) end
