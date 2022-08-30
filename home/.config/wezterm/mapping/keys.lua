-------------------------------------------------------
--/=================================================\--
--|>             WEZTERM KEYS SETTINGS             <|--
--\=================================================/--
-------------------------------------------------------
local wezterm = require("wezterm")
local act = wezterm.action
local nop = act.Nop
local dsb = act.DisableDefaultAssignment
local m = {
    n = "NONE",

    c = "CTRL",
    s = "SHIFT",
    a = "ALT",
    l = "LEADER",

    ca = "CTRL|ALT",
    cs = "CTRL|SHIFT",
    as = "ALT|SHIFT",

    la = "LEADER|ALT",
    lc = "LEADER|CTRL",
    ls = "LEADER|SHIFT",

    las = "LEADER|ALT|SHIFT",
    lca = "LEADER|CTRL|ALT",
    lcs = "LEADER|CTRL|SHIFT",

    lcsa = "LEADER|CTRL|SHIFT|ALT",

    w = "SUPER",
    ws = "SUPER|SHIFT",
}
local d = {
    h = "Left",
    j = "Down",
    k = "Up",
    l = "Right",
}
local dis = {
    ["NONE"] = {},

    ["ALT"] = { "Enter" },
    ["CTRL"] = { "M" },
    ["SHIFT"] = {},

    ["CTRL|ALT"] = {},
    ["CTRL|SHIFT"] = { "m", "M" },
    ["ALT|SHIFT"] = {},

    ["LEADER|ALT"] = {},
    ["LEADER|CTRL"] = {},
    ["LEADER|SHIFT"] = {},

    ["LEADER|CTRL|SHIFT"] = {},
    ["LEADER|CTRL|ALT"] = {},
    ["LEADER|ALT|SHIFT"] = {},

    ["LEADER|CTRL|SHIFT|ALT"] = {},

    ["SUPER"] = { "m" },
    ["SUPER|SHIFT"] = { "T", "[", "]", "{", "}", "PageUp", "PageDown" },
}
local function DoN(mykeys, dis, DoN)
    for k, v in pairs(dis) do
        if #v ~= 0 then
            for _, j in pairs(v) do
                if DoN then
                    table.insert(mykeys, { key = j, mods = k, action = nop })
                end
                table.insert(mykeys, { key = j, mods = k, action = dis })
            end
        end
    end
end

-- Check if key is a table
-- If key is a table, then
--      check if table has element or not, then
--          each element will be check:
--              If element is in alphabet, it will be inserted 3 times
--              If element is not, it will be inseted 1 times
-- If not a table
--      Check for if a string.len() is a len of character:
--          If yes, inserted it 3 times
--          Else, inseted it 1 times
--      But need to check if mods if a table or not:
--          If is a table, insert x times
local function assign(tbl, key, mods, act)
    if type(key) == "table" and #key ~= 0 then
        for _, v in pairs(key) do
            table.insert(tbl, { key = key, mods = mods, action = act })
        end
    elseif type(key) == "string" then
        if type(mods) == "table" and #mods ~= 0 then
            for _, v in pairs(mods) do
                table.insert(tbl, { key = key, mods = v, action = act })
            end
        else
            table.insert(tbl, { key = key, mods = mods, action = act })
        end
    end
end
--<~>--
local mykeys = {
    -------------------------------------------------------
    ----                     Mode                      ----
    -------------------------------------------------------
    { key = "c", mods = m.lc, action = act.ActivateCopyMode },
    { key = "x", mods = m.lc, action = act.QuickSelect },
    { key = "z", mods = m.cs, action = act.TogglePaneZoomState },

    -------------------------------------------------------
    ----                     Font                      ----
    -------------------------------------------------------

    -------------------------------------------------------
    ----                    General                    ----
    -------------------------------------------------------

    -------------------------------------------------------
    ----                     Pane                      ----
    -------------------------------------------------------
    { key = "Enter", mods = m.cs, action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

    -------------------------------------------------------
    ----                      Tab                      ----
    -------------------------------------------------------
}
assign(mykeys, "+", nil, act.IncreaseFontSize)
assign(mykeys, { "-", "_" }, nil, act.DecreaseFontSize)
-- assign(mykeys, "Backspace", { m.c, m.cs }, act.ResetFontSize)
assign(mykeys, "0", { m.c, m.cs }, act.ResetFontSize)

-- for i = 1, 9 do
--     table.insert(mykeys, {
--         key = tostring(i - 1),
--         mods = m.a,
--         action = act.ActivatePaneByIndex(i - 1),
--     })
--     table.insert(mykeys, {
--         key = "F" .. tostring(i),
--         action = act.ActivateTab(i - 1),
--     })
--     table.insert(mykeys, {
--         key = "F" .. tostring(i),
--         mods = m.cs,
--         action = act.MoveTab(i - 1),
--     })
-- end
-- for k, v in pairs(d) do
--     table.insert(mykeys, {
--         key = string.upper(k),
--         mods = m.sa,
--         action = act.ActivatePaneDirection(v),
--     })
--     table.insert(mykeys, {
--         key = v .. "Arrow",
--         mods = m.sa,
--         action = act.ActivatePaneDirection(v),
--     })
--     table.insert(mykeys, {
--         key = string.upper(k),
--         mods = m.cs,
--         action = act.AdjustPaneSize({ v, 5 }),
--     })
--     table.insert(mykeys, {
--         key = v .. "Arrow",
--         mods = m.cs,
--         action = act.AdjustPaneSize({ v, 5 }),
--     })
-- end
-- DoN(mykeys, dis)
return mykeys
