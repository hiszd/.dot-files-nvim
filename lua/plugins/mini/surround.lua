return function()
  return {
    mappings = {
      add = "<leader>sa",                  -- Add surrounding in Normal and Visual modes
      delete = "<leader>sd",               -- Delete surrounding
      find = "<leader>sf",                 -- Find surrounding (to the right)
      find_left = "<leader>sF",            -- Find surrounding (to the left)
      highlight = "<leader>sh",            -- Highlight surrounding
      replace = "<leader>sr",              -- Replace surrounding
      update_n_lines = "<leader>sn",       -- Update `n_lines`
      suffix_last = "",                    -- Suffix to search with "prev" method
      suffix_next = "",                    -- Suffix to search with "next" method
    },
  }
end
