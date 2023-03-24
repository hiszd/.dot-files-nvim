local M = {}

local __Job = require("plenary.job")
local __isrunning = false
local __waittime = 0
local __exectimer = vim.loop.new_timer()
local __execdelay = 80
local __hasexecd = false

local __job = __Job:new({
  command = "node",
  args = { "/home/zion/programming/node/qmkhid/dist/app.js", "cli" },
  cwd = "/usr/bin",
  on_stderr = function(val)
    P(val)
  end,
  on_stdout = function(_, val)
    P(val)
  end,
  on_exit = function(_, return_val)
    print("thing: " .. return_val)
    __isrunning = false
  end,
})

M.startjob = function()
  __job:start()
  __isrunning = true
end

local hidwrite = function(msg)
  print("message: " .. msg)
  if __isrunning == true then
    vim.defer_fn(function()
      __job:send(msg .. "\n")
    end, __waittime)
    __waittime = __execdelay
    __exectimer:stop()
    __exectimer:start(__execdelay, 0, function()
      __waittime = 0
    end, __execdelay)
    __hasexecd = true
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
  local rgbmsg = FMT("--op rgb_ind --rgb %s,%s,%s,34,35,36", r, g, b)
  if msg == "" or msg == nil then
    return rgbmsg
  else
    return (msg .. " " .. rgbmsg)
  end
end

local typingEnter = function()
  -- local msg = layer_change(true, 1, "")
  hidwrite(color_change(75, 20, 0, ""))
end

local typingLeave = function()
  if __isrunning == true then
    -- local msg = layer_change(false, 1, "")
    hidwrite(color_change(0, 20, 10, ""))
  end
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

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("HIDVimAutoLeave", { clear = true }),
  callback = function()
  end,
})

M.layer_change = layer_change()
M.color_change = color_change()
return M
