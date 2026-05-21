vim.api.nvim_create_autocmd({ "FocusLost", "InsertLeave", "TextChanged" }, {
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})
