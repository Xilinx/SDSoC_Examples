#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    make ultraclean
    make check PLATFORM=zcu102  
    make check PLATFORM=zcu102 TARGET_OS=standalone
    cd ..
    echo "$d"
done
