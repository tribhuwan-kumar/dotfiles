local lspconfig = require('lspconfig')
local lsp_format = require("lsp-format").setup()

local on_attach = function(client, bufnr)
  lsp_format.on_attach(client, bufnr)
end
lspconfig.gopls.setup { on_attach = on_attach }

