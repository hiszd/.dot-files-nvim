local init = function()
  -- Load custom tree-sitter grammar for org filetype
  require("orgmode").setup_ts_grammar()

  require("orgmode").setup({
    org_agenda_files = { "~/org/*", "~/my-orgs/**/*" },
    org_default_notes_file = "~/org/refile.org",
    org_hide_leading_stars = true,
    mappings = {
      org = {
        org_toggle_checkbox = "<C-c>",
      },
    },
  })
end

return {
  "nvim-orgmode/orgmode",
  ft = { "org" },
  config = function()
    require("orgmode").setup({})
  end,
  init = init,
}
