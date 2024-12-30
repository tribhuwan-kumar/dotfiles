require("neo-tree").setup({
  window = {
    position = "right",
    width =  30,
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_by_name = {
        "target",
        "__pycache__",
        "node_modules",
      },
      always_show = {
        ".local",
        ".config",
        ".bashrc",
        ".tmux.conf"
      },
    },
  },
  default_component_configs = {
    diagnostics = {
      symbols = {
        hint = "󰁙 ",
        info = " ",
        warn = " ",
        error = " ",
      },
      highlights = {
        hint = "DiagnosticSignHint",
        info = "DiagnosticSignInfo",
        warn = "DiagnosticSignWarn",
        error = "DiagnosticSignError",
      },
    },
  }
})

