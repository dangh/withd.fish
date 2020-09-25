function withd --argument-names directory --description "execute command in specified directory"
  set --local command $argv[2..-1]
  command fish --private --command="cd '$directory'; $command;"
end
