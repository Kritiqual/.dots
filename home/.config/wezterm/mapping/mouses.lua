-------------------------------------------------------
--/=================================================\--
--|>            WEZTERM MOUSE SETTINGS             <|--
--\=================================================/--
-------------------------------------------------------
local wezterm = require("wezterm")
local act = wezterm.action
local m = {
    n = "NONE",
    c = "CTRL",
    s = "SHIFT",
    a = "ALT",
    ca = "CTRL|ALT",
    cs = "CTRL|SHIFT",
    sa = "ALT|SHIFT",
    la = "LEADER|ALT",
    lc = "LEADER|CTRL",
    ls = "LEADER|SHIFT",
    lsa = "LEADER|ALT|SHIFT",
    lca = "LEADER|CTRL|ALT",
    lcs = "LEADER|CTRL|SHIFT",
    lcsa = "LEADER|CTRL|SHIFT|ALT",
}
local d = {
    l = "Left",
    m = "Middle",
    r = "Right",
}
local b = {}
for k, v in pairs(d) do
    table.insert(b, {
        s = { streak = 1, button = v },
        d = { streak = 2, button = v },
        t = { streak = 3, button = v },
    })
end
local DoN = function(event, button, mods, DoN)
    local ev = {}
    if event == "Drag" then
        ev = { Drag = button }
    elseif event == "Up" then
        ev = { Up = button }
    elseif event == "Down" then
        ev = { Down = button }
    end
    if DoN then
        return { event = ev, mods = mods, action = act.Nop }
    end
    return { event = ev, mods = mods, action = act.DisableDefaultAssignment }
end
--<~>--
local mybuttons = {
    DoN("Drag", b[1].s, "SUPER"),
}
return mybuttons
