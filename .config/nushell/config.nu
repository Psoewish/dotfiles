source ./zoxide.nu

# Set default editor
$env.config.buffer_editor = 'helix'
$env.EDITOR = 'helix'
$env.VISUAL = 'zed'
# $env.MANPAGER = 'sh -c "sed -u -e \'s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\' | bat -p -lman"'

# Aliases
alias hx = helix
alias shx = sudo helix
alias cat = bat
alias grep = ripgrep
alias ls = ls -a
alias ll = ls -al

# Completions
# Fish completer
let fish_completer = {|spans|
  fish --command $'complete "--do-complete=($spans | str join " ")"'
  | from tsv --flexible --noheaders --no-infer
  | rename value description
}

# Zoxide completer
let zoxide_completer = {|spans|
  $spans | skip 1 | zoxide query -l ...$in | lines | where {|x| $x != $env.PWD}
}

let external_completer = {|spans|
  # Fix alias completions
  let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i expansion
  let spans = if $expanded_alias != null {
    $spans
    | skip 1
    | prepend ($expanded_alias | split row " " | take 1)
  } else {
    $spans
  }

  # Assign completers
  match $spans.0 {
    __zoxide_z | __zoxide_zi => $zoxide_completer
    _ => $fish_completer
  } | do $in $spans
}

$env.config = {
  completions: {
    external: {
      enable: true
      completer: $external_completer
    }
  }
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
