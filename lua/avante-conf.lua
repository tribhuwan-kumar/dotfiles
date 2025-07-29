require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})

require('avante').setup({
  provider = "gemini",
  input = {
    provider = "native",
    provider_opts = {
      title = "Avante Input",
      icon = " ",
      placeholder = "Enter your API key...",
    },
  },
})
