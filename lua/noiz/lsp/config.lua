local M = {}

local tbl = require("teej.tbl")

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = tbl.tbl_deep_extend(
  "keep",
  updated_capabilities,
  require("cmp_nvim_lsp").default_capabilities(updated_capabilities)
)
-- updated_capabilities = tbl.tbl_deep_extend("keep", updated_capabilities, require("lsp_spinner").init_capabilities(updated_capabilities))
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }

M.updated_capabilities = updated_capabilities

local buf_nnoremap = function(opts)
  if opts[4] == nil then
    opts[4] = { silent = true, noremap = true }
  end
  if opts[2] == nil then
    return
  end
  if opts[3] == nil then
    return
  end

  vim.api.nvim_buf_set_keymap(opts[1], "n", opts[2], opts[3], opts[4])
end

local buf_inoremap = function(opts)
  if opts[4] == nil then
    opts[4] = { silent = true, noremap = true }
  end
  if opts[2] == nil then
    return
  end
  if opts[3] == nil then
    return
  end

  vim.api.nvim_buf_set_keymap(opts[1], "i", opts[2], opts[3], opts[4])
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local custom_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

  buf_inoremap({ bufnr, "<c-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" })

  buf_nnoremap({ bufnr, "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" })
  buf_nnoremap({ bufnr, "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" })

  buf_nnoremap({ bufnr, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" })
  buf_nnoremap({ bufnr, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" })
  buf_nnoremap({ bufnr, "<leader>gd", "<cmd>lua vim.lsp.buf.declaration()<CR>" })
  buf_nnoremap({ bufnr, "K", "<cmd>lua vim.lsp.buf.hover()<CR>" })
  buf_nnoremap({ bufnr, "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>" })
  buf_nnoremap({ bufnr, "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>" })
  buf_nnoremap({ bufnr, "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>" })
  buf_nnoremap({ bufnr, "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>" })
  buf_nnoremap({ bufnr, "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>" })
  buf_nnoremap({ bufnr, "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>" })

  -- Set some keybinds conditional on server capabilities
  if client.supports_method("textDocument/formatting") and client.name ~= "tsserver" then
    buf_nnoremap({ bufnr, "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>" })
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
    -- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting() | <buffer> :w")
  end

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end

  if client.server_capabilities.codeLensProvider then
    if filetype ~= "elm" then
      vim.cmd([[
        augroup lsp_document_codelens
          au! * <buffer>
          autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
          autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
        augroup END
      ]])
    end
  end
end

M.custom_attach = custom_attach

return M
