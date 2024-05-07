require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "json", "python", "javascript", "typescript", "html", "css", "bash", "yaml", "rust", "toml", "go", "java", "php", "ruby", "regex", "comment", "dockerfile", "rust", "toml", "xml", "http", "graphql" },

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
