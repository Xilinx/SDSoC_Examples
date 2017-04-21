puts "Running ipi tcl"
open_project /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/p0/ipi/zc706.xpr
set_param cg.skipHiddenCheck true
set_property ip_repo_paths {/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/iprepo/repo /proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/data/ip/xilinx /proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/data/cache/xilinx} [current_fileset]
set_param bd.skipSupportedIPCheck true
update_ip_catalog -rebuild
close_project
open_project /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/p0/ipi/zc706.xpr
set_param bd.get_bd_obj.warning_on_empty_result true
set_param bd.propagate.allow_set_readonly_param true
source top.bd.tcl
regenerate_bd_layout
bd::util_cmd set_bd_source SDSoC [current_bd_design]
save_bd_design
report_ip_status
validate_bd_design
update_compile_order -fileset sim_1
update_compile_order -fileset sources_1
if {[llength [get_files *.bd]] == 1 } {
  set bd_file [get_files *.bd]
} else {
  set bd_file [get_files zc706.bd]
}
set_property synth_checkpoint_mode Hierarchical [get_files $bd_file]
check_ip_cache -use_project_cache
generate_target all [get_files $bd_file]
file mkdir /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/p0/ipi/zc706.sdk
write_hwdef -force -file /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/p0/ipi/zc706.sdk/zc706.hdf
close_project
