require('dashboard').setup{
    theme = 'doom',
    config = {
        header = {
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
            '▀████▀   ▀███ ▀████▀ ████▄     ▄███▀',
            '  ▀██     ▄█    ██    ████    ████  ',
            '   ██▄   ▄█     ██    █ ██   ▄█ ██  ',
            '    ██▄  █▀     ██    █  █▓  █▀ ██  ',
            '    ▀▓█ ▓▀      █▓    ▓  █▓▄█▀  ██  ',
            '     ▓██▄       █▓    ▓  ▀▓█▀   ██  ',
            '     ▓▓ ▓▀      ▓▓    ▓  ▓▓▓▓▀  ▓▓  ',
            '     ▓▓▒▒       ▒▓    ▒  ▀▓▓▀   ▓▓  ',
            '      ▒       ▒▓▒ ▒▒  ▒▒▒ ▒    ▒▒▒  ',
            '                                    ',
            '                                    ',
            '                                    ',
            '                                    ',
        },
        center = {
            {
                icon = '󰌌 ',
                icon_hl = 'Title',
                desc = 'Find File',
                key = 'f',
                keymap = 'SPC',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'lua print(2)'
            },
            {
                icon = '󰌌 ',
                icon_hl = 'Title',
                desc = 'Open Tree',
                key = 'q',
                keymap = 'SPC',
                key_hl = 'Number',
                key_format = ' %s',
                action = 'lua print(2)'
            },
        },
        footer = {}
    }
}
