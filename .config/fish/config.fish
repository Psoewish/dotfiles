status is-interactive; and begin
    # Remove greeting
    set -U fish_greeting

    # Set theme
    source ./themes/rose-pine.fish

    # Set Helix as the default editor
    set -gx VISUAL helix
    set -gx EDITOR helix

    # Sponge settings
    set sponge_purge_only_on_exit true

    # Set fish to look for functions recursively
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path

    # Aliases
    # Check if this system's command is 'helix' or 'hx', and alias appropriately
    if type -q helix
        alias hx helix
        alias shx 'sudo helix'
    else if type -q hx
        and ! type -q helix
        alias shx 'sudo hx'
    end

    alias mkdir 'mkdir -pv'
    alias rsync 'rsync -ah --info=progress2'

    # bat & bat-extras
    if type -q bat
        alias cat bat
    end
    if type -q batman
        alias man batman
    end
    if type -q ripgrep; and type -q batgrep
        alias grep 'batgrep --color --paging="never"'
    end

    # eza
    if type -q eza
        alias eza 'eza --icons auto --color always --git --all --group-directories-first'
        alias ls eza
        alias ll 'eza --long'
        alias lt 'eza --tree --level 3 --git-ignore'
    end

    # Initialize tools
    # starship
    if type -q starship
        starship init fish | source
    end

    # zoxide
    if type -q zoxide
        zoxide init fish --cmd cd | source
    end

    # fzf
    if type -q fzf
        fzf --fish | source
        function fzf --wraps="fzf"
            set -Ux FZF_DEFAULT_OPTS "
	        --color=fg:#908caa,bg:#191724,hl:#ebbcba
	        --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	        --color=border:#403d52,header:#31748f,gutter:#191724
	        --color=spinner:#f6c177,info:#9ccfd8
	        --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
	        --height ~100%"
            if type -q fd
                command fd --type f
            else
                command fzf
            end
        end
    end
end
