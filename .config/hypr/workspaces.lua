-- Primary monitor workspaces
hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
    default = true,
    persistent = true,
})
hl.workspace_rule({
    workspace = "2",
    monitor = "DP-1",
    persistent = true,
})
hl.workspace_rule({
    workspace = "3",
    monitor = "DP-1",
    persistent = true,
})
hl.workspace_rule({
    workspace = "4",
    monitor = "DP-1",
    persistent = true,
})

-- Secondary monitor workspaces
hl.workspace_rule({
    workspace = "5",
    monitor = "DP-2",
    default = true,
    persistent = true,
})
