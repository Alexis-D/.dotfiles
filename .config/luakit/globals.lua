-- Global variables for luakit
globals = {
    homepage            = "https://encrypted.google.com/",
 -- homepage            = "http://github.com/mason-larobina/luakit",
    scroll_step         = 40,
    zoom_step           = 0.1,
    max_cmd_history     = 100,
    max_srch_history    = 100,
 -- http_proxy          = "http://example.com:3128",
    default_window_size = "800x600",

 -- Disables loading of hostnames from /etc/hosts (for large host files)
 -- load_etc_hosts      = false,
 -- Disables checking if a filepath exists in search_open function
 -- check_filepath      = false,
}

-- Make useragent
local arch = string.match(({luakit.spawn_sync("uname -sm")})[2], "([^\n]*)")
local lkv  = string.format("luakit/%s", luakit.version)
local wkv  = string.format("WebKitGTK+/%d.%d.%d", luakit.webkit_major_version, luakit.webkit_minor_version, luakit.webkit_micro_version)
local awkv = string.format("AppleWebKit/%s.%s+", luakit.webkit_user_agent_major_version, luakit.webkit_user_agent_minor_version)
globals.useragent = string.format("Mozilla/5.0 (%s) %s %s %s", arch, awkv, wkv, lkv)

-- list of predefined user-agents
globals.available_useragents = {
    default = globals.useragent,
    chrome = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/42.0.000.00 Safari/535.1",
    firefox = "Mozilla/5.0 (X11; Linux i686 on x86_64; rv:42) Gecko/20110524 Firefox/42.0",
    ie = "Mozilla/5.0 (compatible; MSIE 42.0; Windows NT 6.1; WOW64; Trident/6.0)",
}

globals.useragent = globals.available_useragents.chrome

-- Search common locations for a ca file which is used for ssl connection validation.
local ca_files = {
    -- $XDG_DATA_HOME/luakit/ca-certificates.crt
    luakit.data_dir .. "/ca-certificates.crt",
    "/etc/certs/ca-certificates.crt",
    "/etc/ssl/certs/ca-certificates.crt",
}
-- Use the first ca-file found
for _, ca_file in ipairs(ca_files) do
    if os.exists(ca_file) then
        soup.set_property("ssl-ca-file", ca_file)
        break
    end
end

-- Change to stop navigation sites with invalid or expired ssl certificates
soup.set_property("ssl-strict", false)

-- Set cookie acceptance policy
cookie_policy = { always = 0, never = 1, no_third_party = 2 }
soup.set_property("accept-policy", cookie_policy.always)

-- List of search engines. Each item must contain a single %s which is
-- replaced by URI encoded search terms. All other occurances of the percent
-- character (%) may need to be escaped by placing another % before or after
-- it to avoid collisions with lua's string.format characters.
-- See: http://www.lua.org/manual/5.1/manual.html#pdf-string.format
search_engines = {
    g           = "https://encrypted.google.com/search?hl=fr&q=%s",
    gen         = "https://encrypted.google.com/search?hl=en&q=%s",
    goo         = "http://www.google.com/search?q=%s",
    w           = "http://fr.wikipedia.org/w/index.php?title=Spécial:Recherche&search=%s",
    wen         = "http://en.wikipedia.org/w/index.php?title=Special:Search&search=%s",
    yt          = "http://www.youtube.com/results?search_query=%s",
    enfr        = "http://www.wordreference.com/enfr/%s",
    fren        = "http://www.wordreference.com/fren/%s",

    -- better bookmarks :D
    gg          = "http://www.google.com/",
    fb          = "http://www.facebook.com/",
    hn          = "http://news.ycombinator.com/",
    rss         = "http://www.google.com/reader/view/",
    plurk       = "http://www.plurk.com/Cerium",
    edt         = "http://edt.polytech.unice.fr/etudiant?FD=1",
    sdz         = "http://www.siteduzero.com/forum.html",
    wa          = "http://www.wolframalpha.com/",
    mail        = "https://mail.google.com/mail/u/0/?shva=1#mbox",
    gitref      = "http://gitref.org/",
    github      = "http://github.com/",
    home        = "file:///home/alexis/",
    plus        = "https://plus.google.com/?hl=en&tab=wX",
}

-- Set google as fallback search engine
search_engines.default = search_engines.g
-- Use this instead to disable auto-searching
--search_engines.default = "%s"

-- Per-domain webview properties
-- See http://webkitgtk.org/reference/webkitgtk-WebKitWebSettings.html
domain_props = { --[[
    ["all"] = {
        ["enable-scripts"]          = false,
        ["enable-plugins"]          = false,
        ["enable-private-browsing"] = false,
        ["user-stylesheet-uri"]     = "",
    },
    ["youtube.com"] = {
        ["enable-scripts"] = true,
        ["enable-plugins"] = true,
    },
    ["bbs.archlinux.org"] = {
        ["user-stylesheet-uri"]     = "file://" .. luakit.data_dir .. "/styles/dark.css",
        ["enable-private-browsing"] = true,
    }, ]]
}

-- vim: et:sw=4:ts=8:sts=4:tw=80
