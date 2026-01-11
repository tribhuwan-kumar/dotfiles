require("conform").setup({
  formatters = {
    kulala = {
      command = "kulala-fmt",
      args = { "format", "$FILENAME" },
      stdin = false,
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    http = { "kulala" },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
})
