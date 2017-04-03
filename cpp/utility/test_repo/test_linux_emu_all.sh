#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    make ultraclean
    make check 
    cd ..
    echo "$d"
done
