local neogit_init = function()
  local neogit = require("neogit")
  neogit.setup({
    integrations = {
      diffview = true,
      telescope = true
    }
  })

  local map = map_impl("NeoGit")

  map({ "n" }, "<leader>gc", function()
    neogit.open({ "commit", kind = "replace" })
  end, { desc = "Open Neogit Commit" })
  map({ "n" }, "<leader>go", function()
    neogit.open({ kind = "replace" })
  end, { desc = "Open Neogit" })
end

local gitsigns_opts = {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = map_impl("GitSigns")
    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = "Next Hunk" })
    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = "Previous Hunk" })
    -- Actions
    map('n', '<localleader>gsh', gs.stage_hunk, { desc = "Stage Hunk" })
    map('n', '<localleader>grh', gs.reset_hunk, { desc = "Reset Hunk" })
    map('v', '<localleader>gsh', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
      { desc = "Stage Hunk" })
    map('v', '<localleader>grh', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
      { desc = "Reset Hunk" })
    map('n', '<localleader>gsb', gs.stage_buffer, { desc = "Stage Buffer" })
    map('n', '<localleader>gush', gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
    map('n', '<localleader>grb', gs.reset_buffer, { desc = "Reset Buffer" })
    map('n', '<localleader>gph', gs.preview_hunk, { desc = "Preview Hunk" })
    map('n', '<localleader>ghb', function() gs.blame_line { full = true } end, { desc = "Blame Line" })
    map('n', '<localleader>gtlb', gs.toggle_current_line_blame, { desc = "Toggle Line Blame" })
    map('n', '<localleader>ghd', gs.diffthis, { desc = "Diff This" })
    map('n', '<localleader>ghD', function() gs.diffthis('~') end, { desc = "Diff This ~" })
    map('n', '<localleader>gtd', gs.toggle_deleted, { desc = "Toggle Deleted" })

    -- Text object
    map({ 'o', 'x' }, 'kh', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select Hunk" })
  end
}

return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim",
    },
    config = true,
    init = neogit_init,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = gitsigns_opts,
    config = true,
  }
}
