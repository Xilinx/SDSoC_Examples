open_project mmult_accel
set_top mmult_accel
add_files /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/src/mmult.cpp -cflags "-I/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/libs/sds_utils -Wall -O3 -std=c++0x -D __SDSCC__ -m32 -I /proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/target/aarch32-linux/include -I/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/src -D __SDSVHLS__ -D __SDSVHLS_SYNTHESIS__ -I /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu -w"
open_solution "solution" -reset
set_part { xc7z045ffg900-2 }
# synthesis directives
create_clock -period 7.000001
config_rtl -reset_level low
source /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel.tcl
# end synthesis directives
csynth_design
export_design -acc
exit
