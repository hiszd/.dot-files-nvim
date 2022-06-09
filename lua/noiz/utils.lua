_G.map = function(mode, mapping, command, options)
  if options == nil then
    options = { silent = true }
  end
  if options then
    options = vim.tbl_extend("force", options, options)
  end
  vim.api.nvim_set_keymap(mode, mapping, command, options)
end

vim.cmd([[
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]])
