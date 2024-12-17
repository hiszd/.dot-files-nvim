return {
  -- lazy.nvim
  {
    "robitx/gp.nvim",
    config = function()
      local conf = {
        providers = {
          ollama = {
            endpoint = "http://192.168.1.4:11434/v1/chat/completions",
          },
        },
        agents = {
          {
            name = "ChatGPT3-5",
            disable = true,
          },
          {
            name = "Codellama",
            chat = true,
            command = true,
            provider = "ollama",
            model = {
              model = "qwen2.5-coder",
              temperature = 1.1,
              top_p = 1,
              min_p = 0.05,
            },
            system_prompt = "I am an AI meticulously crafted to provide programming guidance and code assistance. "
                .. "To best serve you as a computer programmer, please provide detailed inquiries and code snippets when necessary, "
                .. "and expect precise, technical responses tailored to your development needs.\n",
          },
          {
            name = "ChatAgent",
            provider = "ollama",
            chat = true,
            command = true,
            model = {
              model = "llama3.2",
              temperature = 1.1,
              top_p = 1,
              min_p = 0.05,
            },

            system_prompt = "I am an AI meticulously crafted to provide programming guidance and code assistance. "
                .. "To best serve you as a computer programmer, please provide detailed inquiries and code snippets when necessary, "
                .. "and expect precise, technical responses tailored to your development needs.\n",
          },
        },
        default_command_agent = "Codellama",
        default_chat_agent = "Codellama",
      }
      require("gp").setup(conf)

      local map = map_impl("GP")

      map({ "n" }, "<leader>Gp", "<cmd>GpChatToggle<cr>")
      map({ "n" }, "<leader>Gi", "<cmd>GpRewrite<cr>")
      map({ "v" }, "<C-g>i", ":<C-u>'<,'>GpRewrite<cr>")
      map({ "v" }, "<C-g>a", ":<C-u>'<,'>GpAppend<cr>")
    end,
  }
}
