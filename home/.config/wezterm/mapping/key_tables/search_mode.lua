-------------------------------------------------------
--/=================================================\--
--|>              WEZTERM SEARCH MODE              <|--
--\=================================================/--
-------------------------------------------------------
local wezterm = require("wezterm")
local act = wezterm.action
local cpm = act.CopyMode
--<~>--
return {
    { key = "Escape", mods = "NONE", action = cpm("Close") },

    { key = "Enter", mods = "NONE", action = cpm("PriorMatch") },
    { key = "p", mods = "CTRL", action = cpm("PriorMatch") },
    { key = "n", mods = "CTRL", action = cpm("NextMatch") },
    { key = "UpArrow", mods = "NONE", action = cpm("PriorMatch") },
    { key = "DownArrow", mods = "NONE", action = cpm("NextMatch") },

    { key = "PageUp", mods = "NONE", action = cpm("PriorMatchPage") },
    { key = "PageDown", mods = "NONE", action = cpm("NextMatchPage") },

    { key = "l", mods = "CTRL", action = cpm("ClearPattern") },

    { key = "r", mods = "CTRL", action = cpm("CycleMatchType") },
}
