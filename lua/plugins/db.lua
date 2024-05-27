return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup({
        sources = {
          require("dbee.sources").MemorySource:new({
            {
              id = "psql_elixir",  -- only mandatory if you edit a file by hand. IT'S YOUR JOB TO KEEP THESE UNIQUE!
              name = "psql_elixir",
              type = "postgres", -- type of database driver
              url = "postgres://postgres:H@ck3r345@localhost:5432/openticket_dev?sslmode=disable",
            },
          }),
        },
      })
    end,
  },
}
