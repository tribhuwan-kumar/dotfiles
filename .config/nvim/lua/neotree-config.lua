require("neo-tree").setup({
    window = {
        position = "right",
        width =  30,
    },
    filesystem = {
        filtered_items = {
            visible = false,
            hide_by_name = {
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
})

