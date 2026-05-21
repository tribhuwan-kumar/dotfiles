require('nvim-highlight-colors').setup({
	render = 'virtual',
	virtual_symbol = '',
	enable_tailwind = true,
	enable_var_usage = true,
  exclude_filetypes = {
    'copilot-chat'
  },
})

vim.lsp.document_color.enable(false)
