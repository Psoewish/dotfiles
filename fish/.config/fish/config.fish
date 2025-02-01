# Set Helix as the default editor
set VISUAL helix
set EDITOR helix

# Pure promps settings
set --universal pure_check_for_new_updates
set --universal pure_show_prefix_root_prompt

# Sponge settings
set sponge_purge_only_on_exit true

# Make sure helix is hx regardless of distro
if type -q helix
    alias hx='helix'
    alias shx='sudo helix'
end

if type -q hx
    and ! type -q helix
    alias shx='sudo hx'
end

if type -q bat
    alias cat='bat'
    set -x MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
end

if type -q ripgrep; and type -q batgrep
    alias grep='batgrep --color --paging="never"'
end

if type -q eza
    alias ls='eza -a --group-directories-first --icons="always"'
    alias ll='eza -al --group-directories-first --icons="always"'
    alias l.="eza -a | grep -e '^\.'"
end

alias mkdir='mkdir -pv'
alias cp='rsync -ah --info=progress2'
