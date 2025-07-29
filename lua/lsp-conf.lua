local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("luasnip.loaders.from_vscode").lazy_load()

-- diagnostic icons
local signs = { Error = "󰁙 ", Warn = " ", Hint = "󰁙 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- diagnostic config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- border
local border = {
  {"🭽", "FloatBorder"},
  {"▔", "FloatBorder"},
  {"🭾", "FloatBorder"},
  {"▕", "FloatBorder"},
  {"🭿", "FloatBorder"},
  {"▁", "FloatBorder"},
  {"🭼", "FloatBorder"},
  {"▏", "FloatBorder"},
}

-- servers
local servers = {
  'html',
  'cssls',
  'ts_ls',
  'clangd',
  'taplo',
  'eslint',
  'yamlls',
  'pyright',
  'tailwindcss',
  'rust_analyzer',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

lspconfig['clangd'].setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig['rust_analyzer'].setup {
  capabilities = vim.tbl_extend('keep', capabilities or {}, {
    offsetEncoding = { "utf-16" },
  }),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true, -- Automatically reload Cargo.toml changes
        autoreload = true,          -- Enable autoreload for Cargo.toml
      },
      checkOnSave = {
        command = "clippy",         -- Run `cargo clippy` on save
      },
    },
  },
}

-- float border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- cursor only
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic_cursor", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
  end
})

-- completion config
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- icons
lspkind.init({
  mode = 'symbol',
  preset = 'codicons',
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "ƒ",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "♛",
  },
})

