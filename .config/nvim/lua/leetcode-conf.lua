require("leetcode").setup({
  lang = "rust",
  picker = { provider = "fzf-lua" },
  plugins = {
    non_standalone = true,
  },
  ---@type table<lc.lang, lc.inject>
  injector = {
    ["rust"] = {
      before = { '#[allow(dead_code)]', 'fn main(){}', '#[allow(dead_code)]', 'struct Solution;' },
    },
  },
  hooks = {
    ---@type fun(question: lc.ui.Question)[]
    ['question_enter'] = {
      function(question)
        local problem_dir = vim.fn.stdpath 'data' .. '/leetcode/Cargo.toml'
        local content = [[
              [package]
              name = "leetcode"
              edition = "2024"

              [lib]
              name = "%s"
              path = "%s"

              [dependencies]
              rand = "0.8"
              regex = "1"
              itertools = "0.14.0"
            ]]
        local file = io.open(problem_dir, 'w')
        if file then
          local formatted = (content:gsub(' +', '')):format(question.q.frontend_id, question:path())
          file:write(formatted)
          file:close()
        else
          print('Failed to open file: ' .. problem_dir)
        end
      end,
    },
  },
})
