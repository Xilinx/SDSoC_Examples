open_project mean_value_accel
set_top mean_value_accel
add_files /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/mean_value.cpp -cflags "-I/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/libs/sds_utils -Wall -O3 -std=c++0x -D __SDSCC__ -m32 -I /proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/target/aarch32-linux/include -I/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src -D __SDSVHLS__ -D __SDSVHLS_SYNTHESIS__ -I /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu -w"
open_solution "solution" -reset
set_part { xc7z045ffg900-2 }
# synthesis directives
create_clock -period 7.000001
config_rtl -reset_level low
source /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu/_sds/vhls/mean_value_accel.tcl
# end synthesis directives
csynth_design
export_design -acc
exit
