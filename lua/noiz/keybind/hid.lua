local rstswt = function(on)
  if on == true then
    vim.fn.jobstart({ "node", "/home/zion/programming/node/qmkhid/app.js", "exec", "--op", "layer_on", "--layer",
      "1" }
      , {
      on_stdout = function(_, data)
        P(data)
      end,
    })
  else
    vim.fn.jobstart({ "node", "/home/zion/programming/node/qmkhid/app.js", "exec", "--op", "layer_off", "--layer",
      "1" }
      , {
      on_stdout = function(_, data)
        P(data)
      end,
    })
  end
end

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("HIDInsertAutoEnter", { clear = true }),
  callback = rstswt(true)
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("HIDInsertAutoLeave", { clear = true }),
  callback = rstswt(false)
})
