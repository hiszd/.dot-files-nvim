local jobid = nil

if jobid == nil then
  jobid = vim.fn.jobstart({ "node", "/home/zion/programming/node/qmkhid/app.js", "cli" });
end

local rstswt = function(on)
  if on == true then
    vim.api.nvim_chan_send(jobid, "--op layer_on --layer 1\n")
  else
    vim.api.nvim_chan_send(jobid, "--op layer_off --layer 1\n")
  end
end

local clrchange = function(r, g, b)
  vim.api.nvim_chan_send(jobid, "--op rgb_ind --rgb " .. r .. "," .. g .. "," .. b .. ",0\n")
end

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("HIDInsertAutoEnter", { clear = true }),
  callback = function()
    rstswt(true)
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("HIDInsertAutoLeave", { clear = true }),
  callback = function()
    rstswt(false)
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = vim.api.nvim_create_augroup("HIDCommandAutoEnter", { clear = true }),
  callback = function()
    rstswt(true)
  end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = vim.api.nvim_create_augroup("HIDCommandAutoLeave", { clear = true }),
  callback = function()
    rstswt(false)
  end,
})

vim.api.nvim_create_autocmd("TermEnter", {
  group = vim.api.nvim_create_augroup("HIDTerminalAutoEnter", { clear = true }),
  callback = function()
    rstswt(true)
  end,
})
vim.api.nvim_create_autocmd("TermLeave", {
  group = vim.api.nvim_create_augroup("HIDTerminalAutoLeave", { clear = true }),
  callback = function()
    rstswt(false)
  end,
})
