local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("luasnip.loaders.from_vscode").lazy_load()

-- diagnostic icons
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = "󰁙 ",
      [vim.diagnostic.severity.HINT] = " ",
    },
    linehl = {},
    numhl = {},
  },
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- border
local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}

-- servers
local servers = {
  'html',
  'cssls',
  'ts_ls',
  'jdtls',
  'vimls',
  'cmake',
  'taplo',
  'yamlls',
  'jsonls',
  'bashls',
  'lua_ls',
  'clangd',
  'eslint',
  'pyright',
  'marksman',
  'dockerls',
  'tailwindcss',
  'mdx_analyzer',
  'rust_analyzer',
  'css_variables',
  'cssmodules_ls',
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

vim.lsp.config('clangd', {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})

vim.lsp.config('rust_analyzer', {
  capabilities = vim.tbl_extend('keep', capabilities or {}, {
    offsetEncoding = { "utf-16" },
  }),
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true,
        autoreload = true,
      },
      checkOnSave = true,
    },
  },
})

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
