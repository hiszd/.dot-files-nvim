---@type table
local icons = {
  Codeium = "☢",
  Text = "",
  Method = "",
  Function = "",
  Constructor = "⌘",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

---@type table
local sources = {
  nvim_lsp = "LSP",
  luasnip = "SNP",
  treesitter = "TSI",
  path = "PTH",
  buffer = "BUF",
  nvim_lsp_signature_help = "SIG",
  codeium = "CDE",
  orgmode = "ORG",
}

return {
  sources = sources,
  icons = icons,
}
