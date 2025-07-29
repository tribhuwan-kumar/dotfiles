local cmp = require("cmp")
local npairs = require("nvim-autopairs")
local ts_utils = require("nvim-treesitter.ts_utils")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

npairs.setup({
  check_ts = true,
})

local ts_node_func_parens_disabled = {
  named_imports = true,
  use_declaration = true,
}

local default_handler = cmp_autopairs.filetypes["*"]["("].handler
cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
  local node_type = ts_utils.get_node_at_cursor():type()
  if ts_node_func_parens_disabled[node_type] then
    if item.data then
      item.data.funcParensDisabled = true
    else
      char = ""
    end
  end
  default_handler(char, item, bufnr, rules, commit_character)
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({
    sh = false,
  })
)

