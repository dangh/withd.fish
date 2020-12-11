function withd --argument-names directory --description "execute command in specified directory"
  set --local command $argv[2..-1]
  if test (realpath .) = (realpath $directory)
    echo $command | source
    return $status
  else
    set --local status_file (mktemp)
    set --local cmd_status
    echo 1 > $status_file
    command fish --private --command="cd '$directory'; and $command; and echo yes; and echo 0 > $status_file;"
    read cmd_status < $status_file
    rm $status_file
    return $cmd_status
  end
end
