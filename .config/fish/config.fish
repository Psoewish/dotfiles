status is-interactive; and begin
    set -gx fish_greeting
    set -gx sponge_purge_only_on_exit true
    set -gx MANPAGER 'bat -l man -p'
    set -gx EDITOR hx

    # Misc alternatives/defaults
    alias cat 'bat --style=plain --paging=never --italic-text=always'
    alias cp 'rsync -ah --info=progress2'
    alias mkdir 'mkdir -pv'

    # Lazy aliases :)
    alias ff fastfetch
    alias lg lazygit

    # Better ls
    alias eza 'eza --icons always --color always --git --group-directories-first'
    alias ls eza
    alias la 'eza --all'
    alias ll 'eza --long --all'
    alias lt 'eza --tree --level 3 --git-ignore'

    # Allow function and completion subdirectories
    set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
    set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

    # Pure prompt config
    set -gx pure_show_numbered_git_indicator true
    set -gx pure_enable_nixdevshell true
    set -gx fish_transient_prompt 1
    set -gx pure_enable_single_line_prompt true
    set -gx pure_show_prefix_root_prompt true
    set -gx async_prompt_functions _pure_prompt_git
end
