--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "droid sans mono 9"
theme.fg   = "#5fafd7"
theme.bg   = "#1c1c1c"

-- Genaral colours
theme.success_fg = "#0f0"
--theme.loaded_fg  = "#3ad"
theme.loaded_fg  = "#afd787"
theme.error_fg = "#fff"
theme.error_bg = "#f00"

-- Warning colours
theme.warning_fg = "#f00"
theme.warning_bg = "#fff"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#fff"

-- Menu colours
theme.menu_fg                   = "#5fafd7"
theme.menu_bg                   = "#1c1c1c"
theme.menu_selected_fg          = "#afd787"
theme.menu_selected_bg          = "#444444"
theme.menu_title_bg             = "#1c1c1c"
theme.menu_primary_title_fg     = "#afd787"
theme.menu_secondary_title_fg   = "#fff"

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#fff'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#fff'

-- Statusbar specific
theme.sbar_fg         = "#5fafd7"
theme.sbar_bg         = "#1c1c1c"

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = "#000"
theme.dbar_error_fg   = "#f00"

-- Input bar specific
theme.ibar_fg           = "#5fafd7"
theme.ibar_bg           = "#1c1c1c"

-- Tab label
theme.tab_fg            = "#5fafd7"
theme.tab_bg            = "#1c1c1c"
theme.tab_ntheme        = "#5fafd7"
theme.selected_fg       = "#afd787"
theme.selected_bg       = "#2d2d2d"
theme.selected_ntheme   = "#afd787"
theme.loading_fg        = "#3ad"
theme.loading_bg        = "#000"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0e0"
theme.notrust_fg        = "#e00"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
