require("catppuccin").setup({ 
    coc_nvim = true,
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { 
        comments = { "italic" }, 
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        mocha = {
            base = "#090909",
            mantle = "#090909",
            crust = "#090909",
        },
    },
})

vim.cmd.colorscheme "catppuccin"


