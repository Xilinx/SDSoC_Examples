#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    make ultraclean
    make check PLATFORM=$1 TARGET_OS=$2  
    cd ..
    echo "$d"
done
