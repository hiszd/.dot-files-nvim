local config = function()
  local ft = require("guard.filetype")
  local g = require("guard")

  -- multiple files register
  ft("scss, css"):fmt("prettier")

  require("guard").setup({
    fmt_on_save = true,
    lsp_as_default_formatter = true,
  })
end

return {
  "nvimdev/guard.nvim",
  -- Builtin configuration, optional
  dependencies = {
    "nvimdev/guard-collection",
  },
  config = config,
}
