from libqtile import bar, layout, hook, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, DropDown, ScratchPad
from libqtile.lazy import lazy


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
        Key([mod], "Tab", lazy.next_layout()),
        Key([mod], "w", lazy.window.kill()),
        Key([mod], "v", lazy.window.toggle_floating()),
        Key([mod, "control"], "r", lazy.reload_config()),
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
    def _groupkeys(key, name):
        keys.append(Key([mod], key, lazy.group[name].toscreen()))
        keys.append(Key([mod, "shift"], key, lazy.window.togroup(name)))
        return Group(name)

    groups = [Group(i) for i in "12345"]
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
        layout.MonadTall(border_width=border, margin=margin, single_margin=margin),
        layout.Max(border_width=border, margin=margin),
    ]
    return layouts


def init_floating_layout():
    return layout.Floating()


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
        ),
        Screen(wallpaper=wallpaper),
    ]
    return screens


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

keys = init_keys()
mouse = init_mouse()
groups = init_groups()
layouts = init_layouts()
screens = init_screens()
floating_layout = init_floating_layout()

# Still not sure if I need this but I'll just keep it in lol
wmname = "LG3D"
