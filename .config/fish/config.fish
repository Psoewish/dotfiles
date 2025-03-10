set -U fish_greeting

if set -q ZELLIJ
else
    zellij
end

# Set Helix as the default editor
set -gx VISUAL helix
set -gx EDITOR helix

# Sponge settings
set sponge_purge_only_on_exit true

# Zide path
fish_add_path ~/.config/zide/bin

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

# Load Starship prompt
starship init fish | source

# Zoxide settings
zoxide init fish --cmd cd | source
fzf --fish | source
