local surround = loadfile(".\\surround.lua") or {}
local starter = loadfile(".\\starter.lua") or {}

local config = function()
  reqs({
    ["mini.pairs"] = {},
    ["mini.sessions"] = {},
    ["mini.doc"] = {},
    ["mini.indentscope"] = {},
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
