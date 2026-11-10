-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- MERGED HYPRLAND CONFIG (desktop + laptop)             --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- https://wiki.hypr.land/Configuring/Start/


------------------
---- MONITORS ----
------------------

-- Both are defined. Hyprland ignores rules for outputs that don't exist.
-- Desktop
hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@180",
    position = "auto",
    scale    = "auto",
    bitdepth = 10,
})

-- Laptop
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.00",
    position = "auto",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal      = "alacritty"
local fileManager   = "doublecmd --no-splash"
local menu          = "fuzzel"
local browser       = "helium-browser"
local messenger     = "telegram-desktop"
local notifications = "mako --ignore-timeout 1 --default-timeout 5000"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("waybar & hyprpaper")
  hl.exec_cmd("gsr-ui")
  hl.exec_cmd(notifications)
  hl.exec_cmd(browser)
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("kdeconnect-indicator")
  hl.exec_cmd("waydroid session start")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("HYPRSHOT_DIR", "/home/sage/Screenshots")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QUICK_CONTROLS_STYLE", "org.kde.desktop")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 9,
        gaps_out = 28,
        float_gaps = 36,

        border_size = 1,

        col = {
            active_border   = { colors = {"rgba(8f008fff)", "rgba(008f8fff)", "rgba(8f8f00ff)"}, angle = 45 },
            inactive_border = "rgba(323232ff)",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 12,
        rounding_power = 2,

        dim_inactive = true,
        dim_strength = 0.2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled        = true,
            range          = 16,
            render_power   = 4,
            color          = { colors = {"rgba(8f008faa)", "rgba(008f8faa)", "rgba(8f8f00aa)"}, angle = 45 },
            color_inactive = 0x00000000,
        },


        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "borderangle", enabled = true, speed = 100, bezier = "linear", style = "loop" })
hl.animation({ leaf = "shadowangle", enabled = true, speed = 100, bezier = "linear", style = "loop" })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.3, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 1.5, spring = "easy" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 3, bezier = "easeOutQuint", style = "popin 80%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3, bezier = "easeOutQuint", style = "popin 80%" })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 2, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 1.5, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 1.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 2,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 2, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.5, bezier = "almostLinear" })

-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })

hl.animation({ leaf = "workspaces",    enabled = true,  speed = 2.5, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.5, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 2.5, bezier = "easeOutQuint", style = "slidefade 20%" })

hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- "Smart gaps" / "No gaps when only"
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

hl.config({
    dwindle = {
        force_split     = 2,
        preserve_split  = true,
        split_width_multiplier = 2.0,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo   = true,
    },
})

hl.config({
    cursor = {
        hide_on_key_press = true,
        inactive_timeout = 2,
        persistent_warps = true,
        no_hardware_cursors = true,
    },
})

hl.config({
    decoration = { dim_special = 0.6 },
})

hl.config({
    render = {
        cm_auto_hdr = 0,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape, grp:win_space_toggle, compose:ralt",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + End", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- Decide on this

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Float: large centered window (NO PIN)
hl.bind(mainMod .. " + V", function()
  local w = hl.get_active_window()
  if w == nil then return end

  if w.floating then
    hl.dispatch(hl.dsp.window.float({ action = "unset", window = w }))
  else
    hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
    hl.dispatch(hl.dsp.window.resize({ x = 1600, y = 1280, window = w }))
    hl.dispatch(hl.dsp.window.center({ window = w }))
  end
end)

-- Float: small window on the left (NO PIN)
hl.bind(mainMod .. " + SHIFT + V", function()
  local w = hl.get_active_window()
  if w == nil then return end

  if w.floating then
    hl.dispatch(hl.dsp.window.float({ action = "unset", window = w }))
  else
    hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
    hl.dispatch(hl.dsp.window.resize({ x = 440, y = 640, window = w }))
    hl.dispatch(hl.dsp.window.move({ x = 40, y = 300, window = w }))
  end
end)

-- Float: small window on the left (PIN)
hl.bind(mainMod .. " + CTRL + SHIFT + V", function()
  local w = hl.get_active_window()
  if w == nil then return end

  if w.floating then
    hl.dispatch(hl.dsp.window.pin({ action = "unset", window = w }))   -- NEW
    hl.dispatch(hl.dsp.window.float({ action = "unset", window = w }))
else
    hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
    hl.dispatch(hl.dsp.window.pin({ action = "set", window = w }))     -- NEW
    hl.dispatch(hl.dsp.window.resize({ x = 440, y = 640, window = w }))
    hl.dispatch(hl.dsp.window.move({ x = 40, y = 300, window = w }))
end
end)

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("cliphist list | fuzzel --dmenu --lines 20 --width 92 | cliphist decode | wl-copy"))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(messenger))

hl.bind(mainMod .. " + f12", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("systemctl hibernate"))

-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- Useless (?)

hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen", layout_aware = "false" }))

-- hyprshot & hyprpicker
--
-- Backslash — Open the Screenshot directory
-- 
-- Super + Semicolon                — Fullscreen
-- Super + Apostrophe               — Region
-- Super + Shift + Semicolon        — Window
--
-- Super + Shift + Apostrophe       — hyprpicker
--
-- Super + Ctrl + Semicolon         — Fullscreen + satty
-- Super + Ctrl + Apostrophe        — Region + satty
-- Super + Ctrl + Apostrophe        — Window + satty
--
--
hl.bind(mainMod .. " + backslash", hl.dsp.exec_cmd(fileManager .. " /home/sage/Screenshots"))

hl.bind(mainMod .. " + semicolon", hl.dsp.exec_cmd("hyprshot -m output -m active"))
hl.bind(mainMod .. " + apostrophe", hl.dsp.exec_cmd("hyprshot -m output -m region -z"))

hl.bind(mainMod .. " + SHIFT + semicolon", hl.dsp.exec_cmd("hyprshot -m window -m active"))
hl.bind(mainMod .. " + SHIFT + apostrophe", hl.dsp.exec_cmd([[hyprpicker -a | xargs -I{} notify-send "Color copied" "{}"]]))

hl.bind(mainMod .. " + CTRL + semicolon", hl.dsp.exec_cmd(
  [[hyprshot -m output -m active --raw | satty --filename - --early-exit --copy-command wl-copy]]))

hl.bind(mainMod .. " + CTRL + apostrophe", hl.dsp.exec_cmd(
  [[hyprshot -m output -m region -z --raw | satty --filename - --early-exit --copy-command wl-copy]]))
    
hl.bind(mainMod .. " + SHIFT + CTRL + semicolon", hl.dsp.exec_cmd(
  [[hyprshot -m window -m active --raw | satty --filename - --early-exit --copy-command wl-copy]]))

-- Move focus
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + Home", hl.dsp.exec_cmd("killall waybar && waybar"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.center())

hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -25, y = 0,    relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x =  25, y = 0,    relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0,    y = -25, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0,    y = 25,  relative = true }), { repeating = true })

hl.bind(mainMod .. " + SHIFT + ALT + H", hl.dsp.window.resize({ x = -350, y = 0,    relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + ALT + L", hl.dsp.window.resize({ x =  350, y = 0,    relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + ALT + K", hl.dsp.window.resize({ x = 0,    y = -350, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + ALT + J", hl.dsp.window.resize({ x = 0,    y = 350,  relative = true }), { repeating = true })

-- Cycle focus
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + TAB",         hl.dsp.window.cycle_next({ next = false }))

-- Cycle through floating windows
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.cycle_next({ floating = true }))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.cycle_next({ next = false, floating = true }))

-- Volume
-- Desktop (media keys)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })

hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-"),      { locked = true, repeating = true })

hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioMute",    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

-- Laptop (SUPER + F1/F2/F3)
hl.bind(mainMod .. " + f3", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + f2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })

hl.bind(mainMod .. " + f1", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

hl.bind(mainMod .. " + SHIFT + f3", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SOURCE@ 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + f2", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 5%-"),      { locked = true, repeating = true })

hl.bind(mainMod .. " + SHIFT + f1", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Switch the output
-- Toggle default sink port: headphones <-> line out (speakers)
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd([[
sink=$(pactl get-default-sink)
port=$(pactl list sinks | awk -v s="$sink" '$1=="Name:"{c=$2} c==s && $1=="Active" && $2=="Port:"{print $3; exit}')
case "$port" in
  *headphone*) new=analog-output-lineout ;;
  *)           new=analog-output-headphones ;;
esac
pactl set-sink-port "$sink" "$new"
]]), { locked = true })

-- Brightness
-- hl.bind(mainMod .. " + equal",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 32%+"), { locked = true, repeating = true })
-- hl.bind(mainMod .. " + minus",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 32%-"), { locked = true, repeating = true })

-- Desktop (external monitor via DDC)
hl.bind(mainMod .. " + minus", hl.dsp.exec_cmd("ddcutil --noverify setvcp 10 - 32"), { locked = true, repeating = false })
hl.bind(mainMod .. " + equal", hl.dsp.exec_cmd("ddcutil --noverify setvcp 10 + 32"), { locked = true, repeating = false })
-- Laptop (internal panel)
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.exec_cmd("brightnessctl set 32%-"), { locked = true, repeating = false })
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.exec_cmd("brightnessctl set +32%"), { locked = true, repeating = false })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- KDEConnect Pointer
hl.window_rule({
    name = "kdeconnect-pointer",
    match = { class = "^org\\.kde\\.kdeconnect\\.daemon$" },
    float = true,
    pin = true,
    no_initial_focus = true,
    no_focus = true,
    no_anim = true,
    no_blur = true,
    no_dim = true,
    no_shadow = true,
    decorate = false,
    border_size = 0,
    rounding = 0,
    size = { "monitor_w", "monitor_h" },
})

-- Waydroid

hl.window_rule({
    name   = "waydroid-full-ui",
    match  = { class = "^Waydroid$" },
    float  = true,
    size   = { "500", "800" },
    center = true,
})

hl.window_rule({
    name   = "waydroid-phone",
    match  = { class = "^waydroid\\..*$" },
    float  = true,
    size   = { "500", "800" },
    center = true,
})

hl.on("window.open", function(w)
    if w.class == "org.kde.kdeconnect.daemon" then
        hl.timer(function()
            hl.dispatch(hl.dsp.window.move({ x = 0, y = 0, window = w }))
        end, { timeout = 50, type = "oneshot" })
    end
end)
