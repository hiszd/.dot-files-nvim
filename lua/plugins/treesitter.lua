local config = function()
  require("nvim-treesitter.configs").setup({
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
      enable = true,
      disable = { "org" },                           -- Remove this to use TS highlighter for some of the highlights (Experimental)
      additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    ensure_installed = {
      "comment",
      "lua",
      "tsx",
      "typescript",
      "javascript",
      "html",
      "css",
      "rust",
      "toml",
      "ocaml",
      "vimdoc",
      "markdown",
      "yaml",
      "json",
    }, -- Or run :TSUpdate org
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        scope_incremental = '<CR>',
        node_incremental = '<TAB>',
        node_decremental = '<S-TAB>',
      },
    },
  })

  -- Treesitter folding
  vim.wo.foldmethod = "expr"
  vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
  vim.cmd("set nofoldenable")


  local map = map_impl("Treesitter")
  map({ "n" }, "<leader>ht", "<Cmd>TSHighlightCapturesUnderCursor<cr>", { noremap = true })
end

local init = function()
  local ts_utils = require("nvim-treesitter.ts_utils")

  ---@param node TSNode
  ---@return boolean
  local filter_node = function(node)
    local type = node:type()
    if type == "parameters" then
      return false
    else
      return true
    end
  end

  local goto_parent = function()
    local node = ts_utils.get_node_at_cursor()
    local parent = node:parent()
    ts_utils.goto_node(parent:parent())
  end
  local goto_next_sibling = function()
    local node = ts_utils.get_node_at_cursor()
    local sibling = ts_utils.get_next_node(node, false, false)
    while sibling:parent() ~= node:parent() do
      sibling = ts_utils.get_next_node(node, false, false)
    end
    ts_utils.goto_node(sibling)
  end

  local goto_previous_sibling = function()
    local node = ts_utils.get_node_at_cursor()
    ts_utils.goto_node(node:prev_sibling())
  end

  local highlight_node = function()
    local node = ts_utils.get_node_at_cursor()
    if node ~= nil then
      local buf = vim.api.nvim_get_current_buf()
      local ns = vim.api.nvim_create_namespace("TSTest")
      local sr, _, er = node:range()
      ts_utils.highlight_node(node, buf, ns, "@text.warning")
      vim.defer_fn(function() vim.api.nvim_buf_clear_namespace(buf, ns, sr, er + 1) end, 3000)
    end
  end

  local map = map_impl("Treesitter")
  map({ "n" }, "]f", function() goto_next_sibling() end, { noremap = true, desc = "Goto Next Sibling" })
  map({ "n" }, "[f", function() goto_previous_sibling() end, { noremap = true, desc = "Goto Previous Sibling" })
  map({ "n" }, "[p", function() goto_parent() end, { noremap = true, desc = "Goto Parent" })
  map({ "n" }, "<localleader>hf", function() highlight_node() end, { noremap = true, desc = "Get Parent" })
end

return {
  "nvim-treesitter/nvim-treesitter",
  run = function()
    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
    ts_update()
  end,
  dependencies = {
    "nvim-treesitter/playground",
  },
  config = config,
  init = init,
}
