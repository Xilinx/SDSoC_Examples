#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    make ultraclean
    cd ..
    echo "$d"
done
