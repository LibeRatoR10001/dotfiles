import catppuccin

config.load_autoconfig(False)
# colorscheme
catppuccin.setup(c, "mocha", True)
config.source("keymaps.py")

c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.headers.accept_language = "zh-CN;q=0.9,en-US,en;q=0.8"
c.content.headers.user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) qutebrowser/2.4.0 QtWebEngine/5.15.6 Chrome/95.0.4628.2 Safari/537.36"
# Chrome
# Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) qutebrowser/2.4.0 QtWebEngine/5.15.6 Chrome/95.0.4628.2 Safari/537.36
# Firefox

# save session
c.auto_save.session = True

# hints
c.hints.padding = {"bottom": 1, "left": 5, "right": 3, "top": 1}
c.hints.border = "none"
c.hints.chars = "asdfghjklzxcvbnm"
c.hints.selectors["video"] = ["video"]

# scrolling
c.scrolling.bar = "always"
c.scrolling.smooth = True

# status bar
c.statusbar.padding = {"bottom": 2, "left": 0, "right": 5, "top": 2}
c.statusbar.widgets = ["search_match", "text:|", "url", "text:|", "scroll"]

# tab
c.tabs.padding = {"bottom": 5, "left": 10, "right": 10, "top": 5}

# search
c.url.searchengines = {"DEFAULT": "https://cn.bing.com/search?q={}"}
c.url.start_pages = ["https://cn.bing.com/"]

# font
c.fonts.default_family = "ComicMonoNF"
c.fonts.default_size = "14pt"
c.fonts.web.family.sans_serif = "MiSans"
c.fonts.web.family.standard = "ComicMonoNF"
c.fonts.web.size.default = 16

# darkmode
c.colors.webpage.darkmode.enabled = True

# config editor
c.editor.command = ["nvim", "{file}", "-c", "normal {line}G{column0}l"]
