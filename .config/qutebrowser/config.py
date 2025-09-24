# config.py
import catppuccin

on = True
off = False
config.load_autoconfig(off)

catppuccin.setup(c, "mocha", on)

c.fonts.default_family = "Maple Mono"
c.fonts.default_size = "16px"

c.colors.webpage.darkmode.enabled = on

c.content.cookies.accept = "no-3rdparty"

c.content.blocking.enabled = off

c.backend = "webengine"

c.downloads.location.directory = "~/new/"
c.downloads.location.prompt = off
c.downloads.remove_finished = 3000

c.url.searchengines = {
    "DEFAULT": "https://noai.duckduckgo.com/?q={}",
    "ud": "https://urbandictionary.com/define.php?term={}",
    "gh": "https://github.com/{}",
    "ghp": "https://{}.github.io/",
    "ptn": "https://{}.proton.me/",
    "r": "https://reddit.com/r/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "dle": "https://dle.rae.es/{}",
}

