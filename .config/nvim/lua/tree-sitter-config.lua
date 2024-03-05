require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "json", "python", "javascript", "typescript", "html", "css", "bash", "yaml", "json", "rust", "toml", "go", "java", "php", "ruby", "regex", "comment", "dockerfile", "rust", "toml", "yaml"},

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
