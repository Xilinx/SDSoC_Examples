#!/usr/bin/env bash
for d in */ ; do
    cd $d;
    ../../utility/readme_gen/readme_gen.py description.json
    cd ..
    echo "$d"
done
