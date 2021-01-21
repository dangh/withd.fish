function withd --argument-names directory --description "execute command in specified directory"
  test -d "$directory" || return 1
  set --local command $argv[2..-1]
  command sh --noprofile --norc -c "cd $directory; $SHELL --private --command='$command'"
end
