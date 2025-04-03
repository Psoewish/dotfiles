import subprocess
from libqtile import bar, layout, hook, widget
from libqtile.config import Click, Drag, Group, Key, Screen, DropDown, ScratchPad, Match
from libqtile.lazy import lazy

mod = "mod4"
terminal = "wezterm"
launcher = "rofi -show drun"
browser = "qutebrowser"
browser2 = "zen-browser"

follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
widget_defaults = {
    "font": "CaskaydiaCove Nerd Font",
    "fontsize": 12,
    "padding": 3,
}


@hook.subscribe.startup_once
def autostart():
    processes = [["~/.screenlayout/desktop.sh"], ["vesktop"], ["steam -silent"]]
    for p in processes:
        subprocess.Popen(p)


def init_keys():
    keys = [
        Key([mod], "Left", lazy.layout.left()),
        Key([mod], "Right", lazy.layout.right()),
        Key([mod], "Down", lazy.layout.down()),
        Key([mod], "Up", lazy.layout.up()),
        Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),
        Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),
        Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
        Key([mod, "control"], "Left", lazy.layout.grow_left()),
        Key([mod, "control"], "Right", lazy.layout.grow_right()),
        Key([mod, "control"], "Down", lazy.layout.grow_down()),
        Key([mod, "control"], "Up", lazy.layout.grow_up()),
        Key([mod], "m", lazy.layout.normalize()),
        Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
        Key([mod], "Return", lazy.spawn(terminal)),
        Key([mod], "B", lazy.spawn(browser)),
        Key([mod], "Tab", lazy.next_layout()),
        Key([mod], "q", lazy.window.kill()),
        Key([mod], "v", lazy.window.toggle_floating()),
        Key([mod, "shift"], "Escape", lazy.reload_config()),
        Key([mod, "control"], "q", lazy.shutdown()),
        Key([mod], "Space", lazy.spawn(launcher)),
        # Key([mod], "f", lazy.function(toggle_max())),
    ]
    return keys


def init_mouse():
    mouse = [
        Drag(
            [mod],
            "Button1",
            lazy.window.set_position_floating(),
            start=lazy.window.get_position(),
        ),
        Drag(
            [mod],
            "Button3",
            lazy.window.set_size_floating(),
            start=lazy.window.get_size(),
        ),
        Click([mod], "Button2", lazy.window.bring_to_front()),
    ]
    return mouse


def init_groups():
    groups = [Group(i) for i in "12345"]

    for i in groups:
        keys.extend(
            [
                Key(
                    [mod],
                    i.name,
                    lazy.to_screen(0) if i.name in "1234" else lazy.to_screen(1),
                    lazy.group[i.name].toscreen(),
                ),
                Key(
                    [mod, "shift"],
                    i.name,
                    lazy.window.togroup(i.name, switch_group=True),
                ),
            ]
        )

    dropdowns = [
        DropDown("term", "wezterm"),
        DropDown("yazi", "wezterm start -- yazi"),
        DropDown("pulsemixer", "wezterm start -- pulsemixer"),
    ]
    groups.append(ScratchPad("scratchpad", dropdowns))
    return groups


def init_layouts():
    margin = 10
    border = 1

    layouts = [
        # layout.Columns(border_width=border, margin=margin, single_margin=margin),
        layout.Tile(
            border_width=border,
            margin=margin,
            add_after_last=True,
            ratio=0.5,
            master_match=[Match(wm_class="qutebrowser"), Match(wm_class="vesktop")],
        ),
        layout.Max(border_width=border, margin=margin),
    ]
    return layouts


@hook.subscribe.client_new
def set_floating(window):
    floating_classes = "steam"
    try:
        if window.window.get_wm_class()[0] in floating_classes:
            window.floating = True
    except IndexError:
        pass


def init_screens():
    wallpaper = "~/dotfiles/wallpapers/anime-wallpaper-night.jpg"
    screens = [
        Screen(
            top=bar.Bar(
                [
                    widget.GroupBox(),
                    widget.WindowName(),
                    widget.Clock(),
                    widget.Systray(),
                ],
                24,
            ),
            wallpaper=wallpaper,
            wallpaper_mode="fill",
        ),
        Screen(wallpaper=wallpaper, wallpaper_mode="fill"),
    ]
    return screens


keys = init_keys()
mouse = init_mouse()
groups = init_groups()
layouts = init_layouts()
screens = init_screens()

# Still not sure if I need this but I'll just keep it in lol
wmname = "LG3D"
