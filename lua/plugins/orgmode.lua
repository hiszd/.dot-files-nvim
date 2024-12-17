local get_indent_size = function()
  -- Use vim.api.nvim_buf_get_option() to fetch the current buffer options
  local indent_size = tonumber(vim.api.nvim_get_option_value("shiftwidth", { buf = 0 }))

  -- If shiftwidth is not set, try using tabstop as a fallback
  if indent_size == nil then
    indent_size = tonumber(vim.api.nvim_get_option_value("tabstop", { buf = 0 }))
  end

  -- Return the value, or -1 if neither is set (this situation should be avoided)
  return indent_size ~= 0 and indent_size or -1
end

return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    dependencies = {
      {
        "nvim-orgmode/org-bullets.nvim",
        config = function()
          require("org-bullets").setup({
            concealcursor = "nc",
          })
        end,
      },
    },
    config = function()
      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
        mappings = {
          org = {
            org_toggle_checkbox = '<localleader>c',
          },
        },
      })

      local map = map_impl("Orgmode")

      map({ "i" }, "<C-o>p", function()
        require("orgmode").action("org_mappings.do_demote")
        local indent_size = get_indent_size()
        local base = "<right>"
        local keys = base:rep(indent_size)
        local key = vim.api.nvim_replace_termcodes(keys, true, false, true)
        vim.api.nvim_feedkeys(key, "n", false)
      end)
      map({ "i" }, "<C-o>d", function()
        require("orgmode").action("org_mappings.do_promote")
      end)


      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  }
}
