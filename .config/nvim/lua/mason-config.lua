require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'html',
    'cssls',
    'ts_ls',
    'jdtls',
    'vimls',
    'eslint',
    'bashls',
    'lua_ls',
    'clangd',
    'pyright',
    'tailwindcss',
    "rust_analyzer"
  },
})

