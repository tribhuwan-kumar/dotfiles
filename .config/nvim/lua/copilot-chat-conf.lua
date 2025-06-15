local chat = require("CopilotChat")
local select = require("CopilotChat.select")
require("CopilotChat").setup {
  selection = select.unnamed,
  debug = true,
  show_help = false,
  show_folds = false,
  language = "English",
  auto_follow_cursor = false,
  highlight_selection = false,
  context = "buffers",
  build = "make tiktoken",
  disable_extra_info = 'no',
  question_header = '## Me ',
  error_header = '## Error ',
  answer_header = '## Copilot ',
  mappings = {
    complete = {
      detail = 'Use @<Tab> or /<Tab> for options.',
      insert ='<C-l>',
    },
    close = {
      normal = '<C-x>',
      insert = '<C-x>'
    },
    reset = {
      normal ='<C-z>',
      insert = '<C-z>'
    },
    submit_prompt = {
      normal = '<CR>',
      insert = '<C-s>'
    },
    accept_diff = {
      normal = '<Leader>gy',
      insert = '<C-y>'
    },
    show_diff = {
      normal = '<Leader>gd'
    },
    show_info = {
      normal = '<Leader>gp'
    },
    show_context = {
      normal = '<Leader>gs'
    },
  },
}

vim.api.nvim_set_keymap('v', '<Leader>gc', '', {
  noremap = true,
  silent = true,
  callback = function()
    local input = vim.fn.input("Chat: ")
    if input ~= "" then
      chat.ask(input, { selection = select.visual })
    end
  end,
  desc = "CopilotChat - chat",
})
