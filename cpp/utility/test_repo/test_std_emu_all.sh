#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    make ultraclean
    make check TARGET_OS=standalone 
    cd ..
    echo "$d"
done
