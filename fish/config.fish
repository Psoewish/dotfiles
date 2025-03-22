set -U fish_greeting

# if set -q ZELLIJ
# else
#     zellij
# end

# Set Helix as the default editor
set -gx VISUAL helix
set -gx EDITOR helix

# Sponge settings
set sponge_purge_only_on_exit true

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
    alias ls='eza -a --group-directories-first --icons="auto"'
    alias ll='eza -al --group-directories-first --icons="auto"'
    alias lt='eza -aT -L=3 --icons="auto" --git-ignore'
end

alias mkdir='mkdir -pv'
alias cp='rsync -ah --info=progress2'

# Load Starship prompt
starship init fish | source

# Zoxide settings
zoxide init fish --cmd cd | source

# fzf settings
fzf --fish | source
function fzf --wraps="fzf"
    set -Ux FZF_DEFAULT_OPTS "
	    --color=fg:#908caa,bg:#191724,hl:#ebbcba
	    --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	    --color=border:#403d52,header:#31748f,gutter:#191724
	    --color=spinner:#f6c177,info:#9ccfd8
	    --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
    command fzf
end
