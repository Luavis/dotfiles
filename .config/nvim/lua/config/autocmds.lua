vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
})
