--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "inconsolata normal 10"
theme.fg   = "#888"
theme.bg   = "#222"

-- Genaral colours
theme.success_fg = "#0f0"
theme.loaded_fg  = "#3ad"
theme.error_fg = "#fff"
theme.error_bg = "#f00"

-- Warning colours
theme.warning_fg = "#f00"
theme.warning_bg = "#fff"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#fff"

-- Menu colours
theme.menu_fg                   = "#888"
theme.menu_bg                   = "#222"
theme.menu_selected_fg          = "#fff"
theme.menu_selected_bg          = "#257"
theme.menu_title_bg             = "#222"
theme.menu_primary_title_fg     = "#257"
theme.menu_secondary_title_fg   = "#fff"

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#fff'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#fff'

-- Statusbar specific
theme.sbar_fg         = "#888"
theme.sbar_bg         = "#222"

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = "#000"
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = "#888"
theme.ibar_bg           = "#222"

-- Tab label
theme.tab_fg            = "#888"
theme.tab_bg            = "#222"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#fff"
theme.selected_bg       = "#257"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#3ad"
theme.loading_bg        = "#000"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0e0"
theme.notrust_fg        = "#e00"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
