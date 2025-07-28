require("oil").setup({
  float = {
    padding = 2,
    max_width = 0.5,
    max_height = 0.6,
    border = "rounded",
    win_options = {
      winblend = 1,
    },
    get_win_title = nil,
    preview_split = "auto",
    override = function(conf)
      return conf
    end,
  },
  default_file_explorer = false,
})
