#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    ../../common/readme_gen/readme_gen.py description.json
    cd ..
    echo "$d"
done
