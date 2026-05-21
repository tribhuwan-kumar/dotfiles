require('nvim-treesitter').setup {
  ensure_installed = {},
  auto_install = true,
  highlight = { enable = true, },
  indent = { enable = true },
  folding = { enable = false },
  install_dir = vim.fn.stdpath('data') .. '/site',
  textobjects = {
    select = {
      enable = false,
    },
  },
}

require("tree-sitter-manager").setup({
  border = nil,
  auto_install = true,
  highlight = true,
  languages = {}, -- override or add new parser sources
  parser_dir = vim.fn.stdpath("data") .. "/site/parser",
  query_dir = vim.fn.stdpath("data") .. "/site/queries",
})
