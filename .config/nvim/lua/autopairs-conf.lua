local cmp = require("cmp")
local npairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

npairs.setup({
  check_ts = true,
  disable_in_visualblock = true,
})

local default_handler = cmp_autopairs.filetypes["*"]["("].handler
cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
  default_handler(char, item, bufnr, rules, commit_character)
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({
    sh = false,
  })
)
