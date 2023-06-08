-------------------------------------------------------
--/=================================================\--
--|>              WEZTERM COLORSCHEME              <|--
--\=================================================/--
-------------------------------------------------------
return {
    ["Edracula"] = {
        foreground = "#ffffff",
        background = "#191a2e",

        cursor_bg = "#ffffff",
        cursor_fg = "#191a2e",
        cursor_border = "#ffffff",
        compose_cursor = "#ffb86c",

        split = "#20e3b2",
        scrollbar_thumb = "#44475a",

        ansi = {
            "#191a2e",
            "#FF5555",
            "#20e3b2",
            "#fde181",
            "#9b87fd",
            "#ff6bcb",
            "#2cccff",
            "#ffffff",
        },
        brights = {
            "#6272A4",
            "#FF6E6E",
            "#50fa7b",
            "#f1fa8c",
            "#bd93f9",
            "#ff79c6",
            "#8be9fd",
            "#f8f8f2",
        },

        selection_fg = "none",
        selection_bg = "#44475a",
        copy_mode_active_highlight_bg = { Color = "none" },
        copy_mode_active_highlight_fg = { Color = "#20e3b2" },
        copy_mode_inactive_highlight_bg = { Color = "none" },
        copy_mode_inactive_highlight_fg = { Color = "#ff5555" },
        quick_select_label_bg = { Color = "none" },
        quick_select_label_fg = { Color = "#20e3b2" },
        quick_select_match_bg = { Color = "none" },
        quick_select_match_fg = { Color = "#ff5555" },
    },
}
