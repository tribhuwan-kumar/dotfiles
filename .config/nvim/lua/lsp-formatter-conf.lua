require("lsp-format").setup {}

local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end
require("lspconfig").gopls.setup { on_attach = on_attach }
