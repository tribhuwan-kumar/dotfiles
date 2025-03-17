require'nvim-treesitter.configs'.setup {
  ensure_installed = {},
  auto_install = true,
  highlight = { enable = true, },
  indent = { enable = true },
  folding = { enable = false },
  textobjects = {
    select = {
      enable = false,
    },
  },
}
