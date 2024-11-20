local relpath = "plugins.mini."

local surround = require(relpath .. "surround")
local starter = require(relpath .. "starter")
local ai = require(relpath .. "ai")
-- local pairs = require(relpath .. "pairs")

local none = function() return {} end

local config = function()
  reqs({
    -- ["mini.pairs"] = pairs,
    ["mini.operators"] = none,
    ["mini.sessions"] = none,
    ["mini.doc"] = none,
    ["mini.indentscope"] = none,
    ["mini.surround"] = surround,
    ["mini.starter"] = starter,
    ["mini.ai"] = ai,
  })
end
return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = config,
  },
}
