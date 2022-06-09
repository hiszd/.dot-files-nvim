local M = {}

local tbl = require('teej.tbl')

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = tbl.tbl_deep_extend("keep", updated_capabilities, require("cmp_nvim_lsp").update_capabilities(updated_capabilities))
-- updated_capabilities = tbl.tbl_deep_extend("keep", updated_capabilities, require("lsp_spinner").init_capabilities(updated_capabilities))
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

M.updated_capabilities = updated_capabilities

local buf_nnoremap = function(opts)
  if opts[3] == nil then
    opts[3] = { silent = true, noremap = true }
  end
  opts[3].buffer = 0
  if opts[1] == nil then
    return
  end
  if opts[2] == nil then
    return
  end

  vim.keymap.set("n", opts[1], opts[2], opts[3])
end

local buf_inoremap = function(opts)
  if opts[3] == nil then
    opts[3] = { silent = true, noremap = true }
  end
  opts[3].buffer = 0
  if opts[1] == nil then
    return
  end
  if opts[2] == nil then
    return
  end

  vim.keymap.set("i", opts[1], opts[2], opts[3])
end

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }

  buf_nnoremap { "<leader>rn", vim.lsp.buf.rename }
  buf_nnoremap { "<space>ca", vim.lsp.buf.code_action }

  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "gi", vim.lsp.buf.implementation }
  buf_nnoremap { "<leader>gd", vim.lsp.buf.declaration }
  buf_nnoremap { "K", vim.lsp.buf.hover }
  buf_nnoremap { "<leader>gt", vim.lsp.buf.type_definition }
  buf_nnoremap { "<leader>gr", vim.lsp.buf.references }
  buf_nnoremap { "<leader>e", vim.diagnostic.show_line_diagnostics }
  buf_nnoremap { "[d", vim.diagnostic.goto_prev }
  buf_nnoremap { "]d", vim.diagnostic.goto_next }
  buf_nnoremap { "<leader>d", vim.diagnostic.set_loclist }

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    local buf = vim.api.nvim_get_current_buf()
    buf_nnoremap { "<space>f", vim.lsp.buf.formatting }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, { buffer = buf, callback = function()
      vim.lsp.buf.formatting_sync()
      vim.cmd(':w')
      print('Formatted and saved')
    end })
    -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting() | <buffer> :w")
  end

  if filetype ~= "lua" then
    buf_nnoremap { "K", vim.lsp.buf.hover, { desc = "lsp:hover" } }
  end

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.server_capabilities.codeLensProvider then
    if filetype ~= "elm" then
      vim.cmd [[
        augroup lsp_document_codelens
          au! * <buffer>
          autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
          autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
        augroup END
      ]]
    end
  end
end

M.custom_attach = custom_attach

return M
