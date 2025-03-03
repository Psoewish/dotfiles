local astal = require("astal")
local Widget = require("astal.gtk3.widget")
local Variable = astal.Variable
local GLib = astal.require("GLib")
local bind = astal.bind

local Wp = astal.require("AstalWp")
local Mpris = astal.require("AstalMpris")
local Hyprland = astal.require("AstalHyprland")
local Network = astal.require("AstalNetwork")
local Tray = astal.require("AstalTray")
local map = require("lib").map

local function Workspaces()
    local hypr = Hyprland.get_default()

    return Widget.Box({
        class_name = "Workspaces",
        bind(hypr, "workspaces"):as(function(wss)
            table.sort(wss, function(a, b)
                return a.id < b.id
            end)

            return map(wss, function(ws)
                if not (ws.id <= 0) then
                    return Widget.Button({
                        class_name = bind(hypr, "focused-workspace"):as(
                            function(fw)
                                return fw == ws and "focused" or ""
                            end
                        ),
                        on_clicked = function()
                            ws:focus()
                        end,
                        label = bind(ws, "id"):as(
                            function(v)
                                return type(v) == "number" and string.format("%.0f", v) or v
                            end
                        ),
                    })
                end
            end)
        end),
    })
end

local function FocusedClient()
    local hypr = Hyprland.get_default()
    local focused = bind(hypr, "focused-client")

    return Widget.Box({
        class_name = "Focused",
        visible = focused,
        focused:as(
            function(client)
                return client and Widget.Label({
                    label = bind(client, "title"):as(tostring),
                })
            end
        ),
    })
end

local function Time(format)
    local time = Variable(""):poll(
        1000,
        function()
            return GLib.DateTime.new_now_local():format(format)
        end
    )
    return Widget.Label({
        class_name = "Time",
        on_destroy = function() time:drop() end,
        label = time(),
    })
end

local function Media()
    local player = Mpris.Player.new("cider")

    return Widget.Box({
        class_name = "Media",
        visible = bind(player, "available"),
        Widget.Label({
            label = bind(player, "metadata"):as(
                function()
                    return (player.title or "") .. " - " .. (player.artist or "")
                end
            ),
        }),
    })
end

local function SysTray()
    local tray = Tray.get_default()

    return Widget.Box({
        class_name = "SysTray",
        bind(tray, "items"):as(function(items)
            return map(items, function(item)
                return Widget.MenuButton({
                    tooltip_markup = bind(item, "tooltip_markup"),
                    use_popover = false,
                    menu_model = bind(item, "menu_model"),
                    action_group = bind(item, "action_group"):as(
                        function(ag) return { "dbusmenu", ag } end),
                    Widget.Icon({ gicon = bind(item, "gicon"), }),
                })
            end)
        end),
    })
end


return function(gdkmonitor)
    local Anchor = astal.require("Astal").WindowAnchor
    return Widget.Window({
        class_name = "Bar",
        gdkmonitor = gdkmonitor,
        anchor = Anchor.TOP + Anchor.LEFT + Anchor.RIGHT,
        exclusivity = "EXCLUSIVE",
        Widget.CenterBox({
            Widget.Box({
                halign = "START",
                Workspaces(),
                FocusedClient(),
            }),
            Widget.Box({
                Time("%H:%M"),
            }),
            Widget.Box({
                halign = "END",
                Media(),
                SysTray(),
            }),
        })
    })
end
