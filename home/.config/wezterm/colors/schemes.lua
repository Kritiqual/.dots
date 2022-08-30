-------------------------------------------------------
--/=================================================\--
--|>              WEZTERM COLORSCHEME              <|--
--\=================================================/--
-------------------------------------------------------
return {
    ["Dracula"] = {
        foreground = "#f8f8f2",
        background = "#282a36",

        cursor_bg = "#f8f8f2",
        cursor_fg = "#282a36",
        cursor_border = "#f8f8f2",
        compose_cursor = "#ffb86c",

        split = "#50fa7b",
        scrollbar_thumb = "#44475a",

        ansi = {
            "#21222C",
            "#FF5555",
            "#50FA7B",
            "#F1FA8C",
            "#BD93F9",
            "#FF79C6",
            "#8BE9FD",
            "#F8F8F2",
        },
        brights = {
            "#6272A4",
            "#FF6E6E",
            "#69FF94",
            "#FFFFA5",
            "#D6ACFF",
            "#FF92DF",
            "#A4FFFF",
            "#FFFFFF",
        },

        selection_fg = "none",
        selection_bg = "#44475a",
        copy_mode_active_highlight_bg = { Color = "none" },
        copy_mode_active_highlight_fg = { Color = "#50fa7b" },
        copy_mode_inactive_highlight_bg = { Color = "none" },
        copy_mode_inactive_highlight_fg = { Color = "#ff5555" },
        quick_select_label_bg = { Color = "none" },
        quick_select_label_fg = { Color = "#50fa7b" },
        quick_select_match_bg = { Color = "none" },
        quick_select_match_fg = { Color = "#ff5555" },
    },
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
