require("neo-tree").setup({
  window = {
    position = "right",
    width =  30,
  },
  filesystem = {
    hijack_netrw_behavior = "disabled",
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = false,
      hide_by_name = {
        "venv",
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

