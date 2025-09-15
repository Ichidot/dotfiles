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
    "wp": "https://en.wikipedia.org/w/index.php?search={}",
    "ud": "https://urbandictionary.com/define.php?term={}",
    "gh": "https://github.com/{}",
    "md": "https://mastodon.social/@{}",
    "bk": "https://bsky.app/profile/{}",
    "ghp": "https://{}.github.io/",
    "pro": "https://{}.proton.me/",
    "neo": "https://{}.neocities.org",
    "r": "https://reddit.com/r/{}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "inv": "https://inv.nadeko.net/search?q={}",
    "dle": "https://dle.rae.es/{}",
    "wh": "https://wallhaven.cc/search?q={}"
}

