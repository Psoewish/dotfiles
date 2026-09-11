function stow_sync
    set stow_source "$HOME/nixos-config/home"
    set stow_target "$HOME"

    stow --dir="$stow_source" --target="$stow_target" --dotfiles --adopt --restow .
end
