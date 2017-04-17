#!/usr/bin/env bash
for filename in src/*.cpp; do
    vim -s ../../utility/license/commands.txt "$filename"
done
for filename in src/*.h; do
    vim -s ../../utility/license/commands.txt "$filename"
done
