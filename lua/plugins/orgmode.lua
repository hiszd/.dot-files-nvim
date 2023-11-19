local opts = {
  load = {
    ["core.itero"] = {},
    ["core.promo"] = {},
    ["core.autocommands"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.esupports.indent"] = {},
    ["core.esupports.metagen"] = {},
    ["core.export.markdown"] = {},
    ["core.defaults"] = {},
    ["core.dirman"] = {},
    ["core.looking-glass"] = {},
    ["core.tangle"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode"
      }
    },
    ["core.qol.toc"] = {
      config = {
        close_after_use = true,
      }
    },
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      }
    },
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        hook = function(keybinds)
          keybinds.map("norg", "n", "<LocalLeader>lg", "<Cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>")
          keybinds.map("norg", "n", "<LocalLeader>nt", "<Cmd>Neorg tangle current-file<CR>")
          keybinds.remap_key("traverse-heading", "n", "j", "n")
          keybinds.remap_key("traverse-heading", "n", "k", "i")
        end,
      }
    },
  },
}

return {
  {
    "nvim-neorg/neorg",
    ft = { "norg" },
    build = ":Neorg sync-parsers",
    opts = opts,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/zen-mode.nvim"
    },
  },
}
