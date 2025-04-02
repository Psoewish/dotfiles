function copycat
    if type -q wl-copy
        cat $argv | wl-copy
    else
        echo "figure out what clipboard manager you're using and fix this function, dummy"
    end
end
