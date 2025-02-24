#!/usr/bin/python
# 保存为 show_logo.py 后执行：python3 show_logo.py

import sys

# 定义颜色映射 (RGB 格式)
COLORS = {
    "b": "\033[38;2;51;153;255m",  # #3399ff
    "a": "\033[38;2;83;198;112m",  # #53C670
    "g": "\033[38;2;57;172;86m",  # #39ac56
    "h": "\033[38;2;51;153;77m",  # #33994d
    "i": "\033[38;2;57;172;86;48;2;51;153;77m",  # 前景+背景
    "j": "\033[38;2;83;198;112;48;2;51;153;77m",
    "k": "\033[38;2;48;165;114m",  # #30A572
}
RESET = "\033[0m"

# ASCII 艺术原始数据
logo = [
    "  ███       ███  ",
    "  ████      ████ ",
    "  ████     █████ ",
    " █ ████    █████ ",
    " ██ ████   █████ ",
    " ███ ████  █████ ",
    " ████ ████ ████ ",
    " █████  ████████ ",
    " █████   ███████ ",
    " █████    ██████ ",
    " █████     █████ ",
    " ████      ████ ",
    "  ███       ███  ",
    "                    ",
    "  N  E  O  V  I  M  ",
]

logo_colors = [
    "  kkkka       gggg  ",
    "  kkkkaa      ggggg ",
    " b kkkaaa     ggggg ",
    " bb kkaaaa    ggggg ",
    " bbb kaaaaa   ggggg ",
    " bbbb aaaaaa  ggggg ",
    " bbbbb aaaaaa igggg ",
    " bbbbb  aaaaaahiggg ",
    " bbbbb   aaaaajhigg ",
    " bbbbb    aaaaajhig ",
    " bbbbb     aaaaajhi ",
    " bbbbb      aaaaajh ",
    "  bbbb       aaaaa  ",
    "                    ",
    "  a  a  a  b  b  b  ",
]


def print_colored_art():
    for line, color_line in zip(logo, logo_colors):
        colored_line = []
        prev_color = None

        for char, color_key in zip(line, color_line):
            if color_key in COLORS:
                if COLORS[color_key] != prev_color:
                    colored_line.append(COLORS[color_key])
                    prev_color = COLORS[color_key]
                colored_line.append(char)
            else:
                if prev_color is not None:
                    colored_line.append(RESET)
                    prev_color = None
                colored_line.append(char)

        if prev_color is not None:
            colored_line.append(RESET)

        print("".join(colored_line))


if __name__ == "__main__":
    # 检查终端是否支持颜色
    if not sys.stdout.isatty():
        print("请在终端中运行此脚本以查看颜色效果")
        sys.exit(1)

    print_colored_art()
