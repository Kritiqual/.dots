-------------------------------------------------------
--/=================================================\--
--|>               WEZTERM COPY MODE               <|--
--\=================================================/--
-------------------------------------------------------
local wezterm = require("wezterm")
local act = wezterm.action
local cpm = act.CopyMode
--<~>--
return {
	-------------------------------------------------------
	----                Escape CopyMode                ----
	-------------------------------------------------------
	{ key = "Escape", mods = "NONE", action = cpm("Close") },
	{ key = "c", mods = "CTRL", action = cpm("Close") },
	{ key = "q", mods = "NONE", action = cpm("Close") },
	{ key = "q", mods = "CTRL", action = cpm("Close") },

	-------------------------------------------------------
	----             Change SelectionMode              ----
	-------------------------------------------------------
	{ key = "v", mods = "NONE", action = cpm({ SetSelectionMode = "Cell" }) },
	{ key = "v", mods = "SHIFT", action = cpm({ SetSelectionMode = "Line" }) },
	{ key = "v", mods = "CTRL", action = cpm({ SetSelectionMode = "Block" }) },

	-------------------------------------------------------
	----                    Moving                     ----
	-------------------------------------------------------
	{ key = "LeftArrow", mods = "NONE", action = cpm("MoveLeft") },
	{ key = "DownArrow", mods = "NONE", action = cpm("MoveDown") },
	{ key = "UpArrow", mods = "NONE", action = cpm("MoveUp") },
	{ key = "RightArrow", mods = "NONE", action = cpm("MoveRight") },

	{ key = "h", mods = "NONE", action = cpm("MoveLeft") },
	{ key = "j", mods = "NONE", action = cpm("MoveDown") },
	{ key = "k", mods = "NONE", action = cpm("MoveUp") },
	{ key = "l", mods = "NONE", action = cpm("MoveRight") },

	-------------------------------------------------------
	----                 Move by word                  ----
	-------------------------------------------------------
	{ key = "b", mods = "NONE", action = cpm("MoveBackwardWord") },
	{ key = "w", mods = "NONE", action = cpm("MoveForwardWord") },
	{ key = "LeftArrow", mods = "CTRL", action = cpm("MoveBackwardWord") },
	{ key = "RightArrow", mods = "CTRL", action = cpm("MoveForwardWord") },
	{ key = "Tab", mods = "SHIFT", action = cpm("MoveBackwardWord") },
	{ key = "Tab", mods = "NONE", action = cpm("MoveForwardWord") },

	-------------------------------------------------------
	----                 Move in-line                  ----
	-------------------------------------------------------
	{ key = "0", mods = "NONE", action = cpm("MoveToStartOfLine") },
	{ key = "^", mods = "NONE", action = cpm("MoveToStartOfLineContent") },
	{ key = "$", mods = "SHIFT", action = cpm("MoveToEndOfLineContent") },
	{ key = "o", mods = "ALT", action = cpm("MoveToSelectionOtherEndHoriz") },
	{ key = "o", mods = "NONE", action = cpm("MoveToSelectionOtherEnd") },

	-------------------------------------------------------
	----               Move by page/view               ----
	-------------------------------------------------------
	{ key = "h", mods = "SHIFT", action = cpm("MoveToViewportTop") },
	{ key = "m", mods = "SHIFT", action = cpm("MoveToViewportMiddle") },
	{ key = "l", mods = "SHIFT", action = cpm("MoveToViewportBottom") },
	--<~>--
	{ key = "g", mods = "NONE", action = cpm("MoveToScrollbackTop") },
	{ key = "g", mods = "SHIFT", action = cpm("MoveToScrollbackBottom") },
	{ key = "Home", mods = "CTRL", action = cpm("MoveToScrollbackTop") },
	{ key = "End", mods = "CTRL", action = cpm("MoveToScrollbackTop") },
	--<~>--
	{ key = "PageUp", mods = "NONE", action = cpm("PageUp") },
	{ key = "PageDown", mods = "NONE", action = cpm("PageDown") },
	{ key = "UpArrow", mods = "CTRL", action = cpm("PageUp") },
	{ key = "DownArrow", mods = "CTRL", action = cpm("PageDown") },

	-------------------------------------------------------
	----               Accept selection                ----
	-------------------------------------------------------
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = act.Multiple({
			{ CopyTo = "ClipboardAndPrimarySelection" },
			{ CopyMode = "Close" },
		}),
	},
	{
		key = "y",
		mods = "NONE",
		action = act.Multiple({
			{ CopyTo = "ClipboardAndPrimarySelection" },
			{ CopyMode = "Close" },
		}),
	},
}
