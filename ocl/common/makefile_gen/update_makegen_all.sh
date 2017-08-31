#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    ../../common/makefile_gen/makegen.py description.json
    cd ..
    echo "$d"
done
