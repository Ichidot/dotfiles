function reset
    killall $argv[1]
    $argv[1] & disown
end
