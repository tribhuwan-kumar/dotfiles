local function trim_buffers_by_filetype(bufnr, max_per_type)
  local ft = vim.bo[bufnr].filetype
  if ft == "" or vim.bo[bufnr].buftype ~= "" then
    return
  end

  local same_ft = {}

  for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if info.bufnr ~= bufnr and vim.api.nvim_buf_is_loaded(info.bufnr) then
      if vim.bo[info.bufnr].buftype == "" and vim.bo[info.bufnr].filetype == ft then
        table.insert(same_ft, info)
      end
    end
  end

  if #same_ft < max_per_type then
    return
  end

  table.sort(same_ft, function(a, b)
    return (a.lastused or 0) < (b.lastused or 0)
  end)

  for _, info in ipairs(same_ft) do
    if info.changed == 0 then
      pcall(vim.api.nvim_buf_delete, info.bufnr, { force = false })
      break
    end
  end
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    trim_buffers_by_filetype(args.buf, 100)
  end,
})
