function withd -a directory -d "execute command in specified directory"
    test -d "$directory" || return 1
    set -l command (string replace -a '\\"' '\\\"' -- $argv[2..-1])
    command sh --noprofile --norc -c "cd $directory; $SHELL --private --command=\"$command\""
end
