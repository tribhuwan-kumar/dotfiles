local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({"i"}, "<Nop>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<Nop>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<Nop>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<Nop>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})
