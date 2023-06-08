-------------------------------------------------------
--/=================================================\--
--|>                WEZTERM CONFIG                 <|--
--\=================================================/--
-------------------------------------------------------
local wezterm = require("wezterm")
--<~>--
return {
    -------------------------------------------------------
    ----                     Test                      ----
    -------------------------------------------------------
    front_end = "OpenGL",
    -------------------------------------------------------
    ----               General settings                ----
    -------------------------------------------------------
    term = "wezterm",
    enable_wayland = false,
    dpi = 96.0,
    use_resize_increments = true,
    initial_cols = 80,
    initial_rows = 27,
    cell_width = 1.0,
    line_height = 1.0,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    animation_fps = 1,
    max_fps = 144,

    scrollback_lines = 10000,
    selection_word_boundary = "",

    -------------------------------------------------------
    ----                    Default                    ----
    -------------------------------------------------------
    set_environment_variables = {},
    default_cwd = "/home/kritiqual",
    default_workspace = "default",
    default_domain = "local",
    ssh_domains = {},
    unix_domains = { { name = "unix" } },
    tiling_desktop_environments = {
        "X11 awesome",
        "X11 bspwm",
        "X11 dwm",
        "X11 qtile",
        "X11 LG3D",
    },

    disable_default_quick_select_patterns = false,
    -- quick_select_alphabet = "qwerty",
    quick_select_patterns = {},
    hyperlink_rules = {},
    launch_menu = {
        {
            label = "Ranger file manager",
            args = { "ranger" },
        },
        {
            label = "System monitor",
            args = { "bpytop" },
        },
    },

    -------------------------------------------------------
    ----               Reload and update               ----
    -------------------------------------------------------
    automatically_reload_config = false,
    show_update_window = false,
    check_for_updates = true,
    check_for_updates_interval_seconds = 86400,

    -------------------------------------------------------
    ----                     Exit                      ----
    -------------------------------------------------------
    clean_exit_codes = { 0, 130 },
    exit_behavior = "Close",
    window_close_confirmation = "NeverPrompt",
    skip_close_confirmation_for_processes_named = {},

    -------------------------------------------------------
    ----                  Text blink                   ----
    -------------------------------------------------------
    text_blink_ease_in = "Linear",
    text_blink_ease_out = "Linear",
    text_blink_rapid_ease_in = "Linear",
    text_blink_rapid_ease_out = "Linear",
    text_blink_rate = 500,
    text_blink_rate_rapid = 250,

    -------------------------------------------------------
    ----                     Bell                      ----
    -------------------------------------------------------
    audible_bell = "Disabled",
    visual_bell = {
        fade_in_duration_ms = 0,
        fade_out_duration_ms = 0,
        fade_in_function = "Linear",
        fade_out_function = "Linear",
        target = "CursorColor",
    },

    -------------------------------------------------------
    ----                 Font settings                 ----
    -------------------------------------------------------
    font = wezterm.font("Cascadia Code PL"),
    font_size = 11.0,
    command_palette_font_size = 11.0,
    underline_thickness = 1.5,
    harfbuzz_features = {
        "ss02=1",
        "ss03=1",
        "ss04=1",
        "ss05=1",
        "ss06=1",
        "ss07=1",
        "ss08=1",
        "ss09=1",
        "ss10=1",
        "ss19=1",
        "ss20=1",
        "zero=1",
        "onum=1",
    },
    font_rules = {},
    custom_block_glyphs = true,
    warn_about_missing_glyphs = false,
    bold_brightens_ansi_colors = true,
    use_cap_height_to_scale_fallback_fonts = true,
    adjust_window_size_when_changing_font_size = false,
    allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",

    -------------------------------------------------------
    ----              Background settings              ----
    -------------------------------------------------------
    background = require("backgrounds"),
    -- window_background_image = os.getenv("XDG_CONFIG_HOME") .. "/awesome/themes/bg.jpg",
    -- window_background_image_hsb = {
    --     brightness = 0.3,
    --     hue = 0.75,
    --     saturation = 0.75,
    -- },

    -------------------------------------------------------
    ----                 Bar settings                  ----
    -------------------------------------------------------
    enable_scroll_bar = false,
    min_scroll_bar_height = "0.5cell",
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    enable_tab_bar = true,
    use_fancy_tab_bar = true,
    tab_bar_at_bottom = false,
    tab_max_width = 16,
    tab_bar_style = {},
    hide_tab_bar_if_only_one_tab = false,
    show_tab_index_in_tab_bar = true,
    tab_and_split_indices_are_zero_based = false,
    switch_to_last_active_tab_when_closing_tab = true,
    integrated_title_button_alignment = "Right",
    integrated_title_button_color = "Auto",
    integrated_title_button_style = "Windows",
    integrated_title_buttons = { "Hide", "Maximize", "Close" },
    status_update_interval = 1000,
    unzoom_on_switch_pane = true,

    -------------------------------------------------------
    ----                    Colors                     ----
    -------------------------------------------------------
    color_scheme = "Edracula",
    color_schemes = require("colors.schemes"),
    colors = { tab_bar = require("colors.edracula_tb") },
    window_frame = require("colors.dracula_wf"),
    command_palette_bg_color = "#282a36",
    command_palette_fg_color = "#ffffff",
    foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },

    -------------------------------------------------------
    ----                Keyboard input                 ----
    -------------------------------------------------------
    use_ime = true,
    allow_win32_input_mode = true,
    swap_backspace_and_delete = false,
    enable_kitty_keyboard = true,
    scroll_to_bottom_on_input = true,
    quote_dropped_files = "SpacesOnly",
    debug_key_events = false,
    detect_password_input = true,
    canonicalize_pasted_newlines = "LineFeed",
    enable_csi_u_key_encoding = false,
    leader = {
        key = "/",
        mods = "CTRL",
        timeout_milliseconds = 1000,
    },
    disable_default_key_bindings = false,
    keys = require("mapping.keys"),
    -- key_tables = require("mapping.key_tables"),
    -------------------------------------------------------
    -------------------------------------------------------
    ----              Mouse/cursor input               ----
    -------------------------------------------------------
    default_cursor_style = "BlinkingBar",
    cursor_thickness = 2,
    cursor_blink_rate = 750,
    cursor_blink_ease_in = "Linear",
    cursor_blink_ease_out = "Linear",
    alternate_buffer_wheel_scroll_speed = 5,

    hide_mouse_cursor_when_typing = false,
    bypass_mouse_reporting_modifiers = "SHIFT",
    pane_focus_follows_mouse = true,
    swallow_mouse_click_on_pane_focus = false,
    swallow_mouse_click_on_window_focus = false,
    force_reverse_video_cursor = false,
    disable_default_mouse_bindings = false,
    mouse_bindings = require("mapping.mouses"),
}
