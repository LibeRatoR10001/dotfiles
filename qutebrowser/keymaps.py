unbind = [
    "H",
    "J",
    "K",
    "L",
]

for unbind_key in unbind:
    config.unbind(unbind_key)

keymap = {
    "H": "tab-prev",
    "L": "tab-next",
    "J": "forward",
    "K": "back",
    "<Ctrl-d>": "cmd-run-with-count 15 scroll down",
    "<Ctrl-u>": "cmd-run-with-count 15 scroll up",
    "<Ctrl-f>": "hint all hover",
    "<Ctrl-y>": "hint links yank",
    "<Ctrl-m>": "hint video spawn mpv {hint-url} --keep-open=yes --geometry=80%+200+200",
}

for key, action in keymap.items():
    config.bind(key, action)
