require("kulala").setup({
  keys = {
    { "<Nop>", desc = "Send request" },
    { "<Nop>", desc = "Send all requests" },
    { "<Nop>", desc = "Open scratchpad" },
  },
  ft = {"http", "rest"},
  opts = {
    global_keymaps = false,
    global_keymaps_prefix = "<Nop>",
    kulala_keymaps_prefix = "",
  },
})
