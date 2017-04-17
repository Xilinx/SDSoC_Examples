#!/usr/bin/env bash
for d in */ ; do
    cd $d;
        source ../../utility/license/source_lic.sh
    cd ..
    echo "$d"
done
