require("keybinds")
require("monitors")
require("workspaces")
require("windowrules")
require("autostart")

hl.config({
    general = {
        border_size = 1,
        gaps_in = 5,
        gaps_out = 10,
        layout = "master",
        resize_on_border = true,
        extend_border_grab_area = true,
        allow_tearing = false,
    },
    decoration = {
        rounding = 0,
        rounding_power = 2,
        dim_inactive = false,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 2,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },

    misc = {
        vrr = 1,
        enable_swallow = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        mouse_move_focuses_monitor = true,
        close_special_on_empty = true,
        middle_click_paste = true,
        on_focus_under_fullscreen = 1,
    },

    cursor = {
        no_hardware_cursors = false,
        no_break_fs_vrr = false,
        min_refresh_rate = 30,
        warp_on_change_workspace = 1,
        default_monitor = "DP-1",
        use_cpu_buffer = 1,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },

    master = {
        allow_small_split = true,
        special_scale_factor = 1,
        mfact = 0.5,
        new_status = "slave",
        new_on_top = false,
        new_on_active = "none",
        slave_count_for_center_master = 0,
    },
})

hl.animation({ leaf = "windows", enabled = false })
hl.animation({ leaf = "global", enabled = false })


-- For Noctalia Color templates
require("noctalia").apply_theme()
