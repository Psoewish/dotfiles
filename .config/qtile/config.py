from libqtile import layout, bar, widget
from libqtile.config import Group, Key, DropDown, ScratchPad, Screen
from libqtile.lazy import lazy

terminal = "wezterm"
launcher = "rofi -show drun"
browser = "qutebrowser"
filemanager = "wezterm start -- yazi"
audiomixer = "wezterm start -- pulsemixer"

# Set up main workspaces
workspaces = ["1", "2", "3", "4", "5"]

# Set up scratchpads
scratchpads = [
    ScratchPad(
        "scratchpad",
        [
            DropDown("terminal", "wezterm"),
            DropDown("mixer", "wezterm start -- pulsemixer"),
            DropDown("filemanager", "wezterm start -- yazi"),
        ],
    )
]

# Add workspaces and scratchpads to groups
groups = []
for i in workspaces:
    if int(i) < 5:
        groups.append(Group(i))
    else:
        groups.append(Group(i))

for i in scratchpads:
    groups.append(Group(i))

layouts = [
    layout.MonadTall(
        border_width=1,
        margin=10,
        single_margin=10,
        new_client_position="bottom",
    ),
    layout.Max(),
]

mod = "mod4"


# Toggle "Max layout"
@lazy.function
def toggle_max(qtile):
    current_layout = qtile.current_group.layout.name
    if current_layout != "Max":
        last_layout = current_layout
        qtile.current_group.setlayout = "Max"
    elif last_layout is not None:
        qtile.current_group.setlayout = last_layout
    else:
        qtile.current_group.setlayout = "MonadTall"


keys = [
    # Launch programs
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "Space", lazy.spawn(launcher)),
    Key([mod], "e", lazy.spawn(filemanager)),
    Key([mod], "p", lazy.spawn(audiomixer)),
    Key([mod], "b", lazy.spawn(browser)),
    # Reload config
    Key([mod, "shift"], "Escape", lazy.reload_config()),
    # Close active window
    Key([mod], "q", lazy.window.kill()),
    # Toggle window state
    Key([mod], "f", toggle_max()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "v", lazy.window.toggle_floating()),
    # Window focus changing
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    # Window moving
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    # Window resizing
    Key([mod, "control", "shift"], "Left", lazy.layout.grow_left()),
    Key([mod, "control", "shift"], "Right", lazy.layout.grow_right()),
    Key([mod, "control", "shift"], "Up", lazy.layout.grow_up()),
    Key([mod, "control", "shift"], "Down", lazy.layout.grow_down()),
    # Scratchpads
    Key([mod, "shift"], "Return", lazy.group["scratchpad"].dropdown_toggle("terminal")),
    Key([mod, "shift"], "p", lazy.group["scratchpad"].dropdown_toggle("audiomixer")),
    Key([mod, "shift"], "e", lazy.group["scratchpad"].dropdown_toggle("filemanager")),
]

for i in workspaces:
    keys.append(Key([mod], i, lazy.group[i].toscreen))
    keys.append(Key([mod, "shift"], i, lazy.group[i].toscreen))

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.WindowName(),
            ],
            30,
        ),
    ),
    Screen(),
]

