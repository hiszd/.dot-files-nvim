return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  opts = {
    strategies = {
      chat = {
        adapter = "ollama",
      },
      inline = {
        adapter = "ollama",
      },
    },
    adapters = {
      http = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "qwen2.5-coder:latest",
              },
            },
            env = {
              url = "http://192.168.1.4:11434",
            },
          })
        end,
      },
    },

  },
  init = function()
    local map = map_impl("CodeCompanion")
    map({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>")
    map({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>")
    map({ "v" }, "<LocalLeader>ga", "<cmd>CodeCompanionChat Add<cr>")
  end,
}
