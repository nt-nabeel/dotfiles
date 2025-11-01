function random_string
    set length $argv[1]
    if test -z "$length"
        set length 10
    end
    set charset $argv[2]
    if test -z "$charset"
        set charset a-z0-9
    end
    set str ""
    while test (string length $str) -lt $length
        set char (dd if=/dev/urandom bs=1 count=1 2>/dev/null | tr -dc $charset)
        if test -n "$char"
            set str $str$char
        end
    end
    echo $str
end
