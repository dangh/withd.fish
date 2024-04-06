function withd -a directory -d "execute command in specified directory"
    pushd $PWD
    fish -P -c "cd $directory; $argv[2..]"
    popd
end
