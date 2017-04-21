#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/a.g.bc ${1+"$@"}
