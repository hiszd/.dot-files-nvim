local relpath = "plugins.mini."

local surround = require(relpath .. "surround")
local starter = require(relpath .. "starter")

local none = function() return {} end

local config = function()
  reqs({
    ["mini.pairs"] = none,
    ["mini.sessions"] = none,
    ["mini.doc"] = none,
    ["mini.indentscope"] = none,
    ["mini.surround"] = surround,
    ["mini.starter"] = starter,
  })
end
return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = config,
  },
}
