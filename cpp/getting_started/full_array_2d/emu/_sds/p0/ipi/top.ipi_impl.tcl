puts "Running ipi tcl"
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
generate_target all [get_files *.bd]
# ***************************************************
# Run synthesis and implementation
# ***************************************************
set_property STEPS.OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.OPT_DESIGN.ARGS.DIRECTIVE Default [get_runs impl_1]
set_msg_config -id {[Pfi 67-13]} -new_severity INFO
reset_run synth_1
launch_runs synth_1 -jobs 16
wait_on_run synth_1
set synth_ok 0
set synth_status [get_property STATUS [get_runs synth_1]]
set synth_progress [get_property PROGRESS [get_runs synth_1]]
if {$synth_status == "synth_design Complete!" && $synth_progress == "100%"} {
  set synth_ok 1
}
if {$synth_ok == 0} {
  puts "ERROR: \[SDSoC 0-0\]: Synthesis failed : status $synth_status : progress $synth_progress"
  exit 1
}
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
# ***************************************************
# Save bitstream for SD card creation
# ***************************************************
set bitstream [get_property top [current_fileset]].bit
set directory [get_property directory [current_run]]
file copy -force [file join $directory $bitstream] [file join $directory bitstream.bit]
open_bd_design [get_files *.bd]
open_run impl_1
file mkdir /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/p0/ipi/zc706.sdk
write_hwdef -force -file /proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/p0/ipi/zc706.sdk/zc706.hdf
