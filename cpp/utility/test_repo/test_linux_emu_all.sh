#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    make ultraclean
    make check PLATFORM=zcu102 
    cd ..
    echo "$d"
done
