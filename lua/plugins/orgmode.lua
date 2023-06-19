local init = function()
  -- Load custom treesitter grammar for org filetype
  require('orgmode').setup_ts_grammar()

  -- Treesitter configuration
  require('nvim-treesitter.configs').setup {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop,
    -- highlighting will fallback to default Vim syntax highlighting
    highlight = {
      enable = true,
      -- Required for spellcheck, some LaTex highlights and
      -- code block highlights that do not have ts grammar
      additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' }, -- Or run :TSUpdate org
  }
end

return {
  -- {
  -- 'nvim-orgmode/orgmode',
  --   ft = { 'org' },
  --   init = init,
  -- }
  {
    "nvim-neorg/neorg",
    ft = { "norg" },
    build = ":Neorg sync-parsers",
    opts = {
      load = {
            ["core.itero"] = {},
            ["core.promo"] = {},
            ["core.autocommands"] = {},
            ["core.integrations.treesitter"] = {},
            ["core.esupports.indent"] = {},
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.concealer"] = {
          config = {
            icons = {
              heading = {
                icons = {
                  "",
                  "",
                  "",
                  "",
                  "",
                  "",
                }
              },
            },
          },
        },     -- Adds pretty icons to your documents
            ["core.keybinds"] = {
          config = {
            default_keybinds = true,
          }
        },
            ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
