require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'html',
    'cssls',
    'ts_ls',
    'eslint',
    'tailwindcss',
    "rust_analyzer"
  },
})

