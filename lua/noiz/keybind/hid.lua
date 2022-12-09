local M = {}

local __Job = require 'plenary.job'

local __job = __Job:new({
  command = 'node',
  args = { '/home/zion/programming/node/qmkhid/dist/app.js', 'cli' },
  cwd = '/usr/bin',
  on_stderr = function(val)
    P(val)
  end,
  on_stdout = function(_, val)
    P(val)
  end,
  on_exit = function(_, return_val)
    print("thing: " .. return_val)
  end,
})
__job:start()

local __waittime = 0
local __exectimer = vim.loop.new_timer()
local __execdelay = 80

local hidwrite = function(msg)
  print(msg)
  if __job ~= nil then
    print("sending message")
    vim.defer_fn(function() __job:send(msg .. "\n") end, __waittime)
    __waittime = __execdelay
    __exectimer:stop()
    __exectimer:start(__execdelay, 0, function() __waittime = 0 end, __execdelay)
  end
end

local layer_change = function(on, layer, msg)
  local laychg = ""
  if on == true then
    laychg = FMT("--op layer_on --layer %s", layer)
  else
    laychg = FMT("--op layer_off --layer %s", layer)
  end
  if msg == "" or msg == nil then
    return laychg
  else
    return (msg .. " " .. laychg)
  end
end

local color_change = function(r, g, b, msg)
  local rgbmsg = FMT("--op rgb_all --rgb %s,%s,%s", r, g, b)
  if msg == "" or msg == nil then
    return rgbmsg
  else
    return (msg .. " " .. rgbmsg)
  end
end

local typingEnter = function()
  local msg = layer_change(true, 1, "")
  hidwrite(color_change(0, 255, 0, msg))
end

local typingLeave = function()
  local msg = layer_change(false, 1, "")
  hidwrite(color_change(255, 0, 0, msg))
end

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("HIDInsertAutoEnter", { clear = true }),
  callback = function()
    typingEnter()
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("HIDInsertAutoLeave", { clear = true }),
  callback = function()
    typingLeave()
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = vim.api.nvim_create_augroup("HIDCommandAutoEnter", { clear = true }),
  callback = function()
    typingEnter()
  end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = vim.api.nvim_create_augroup("HIDCommandAutoLeave", { clear = true }),
  callback = function()
    typingLeave()
  end,
})

vim.api.nvim_create_autocmd("TermEnter", {
  group = vim.api.nvim_create_augroup("HIDTerminalAutoEnter", { clear = true }),
  callback = function()
    typingEnter()
  end,
})
vim.api.nvim_create_autocmd("TermLeave", {
  group = vim.api.nvim_create_augroup("HIDTerminalAutoLeave", { clear = true }),
  callback = function()
    typingLeave()
  end,
})

M.layer_change = layer_change
M.color_change = color_change
return M
