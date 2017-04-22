#!/usr/bin/env bash
cp ../../utility/license/lic.txt ~/.vim/
echo "map :lic :0r ~/.vim/lic.txt" | cat - ~/.vimrc > temp && mv temp ~/.vimrc
echo "map :lic :0r ~/.vim/lic.txt" | cat - ~/.exrc > temp && mv temp ~/.exrc
for d in */ ; do
    cd $d;
        source ../../utility/license/source_lic.sh
    cd ..
    echo "$d"
done
