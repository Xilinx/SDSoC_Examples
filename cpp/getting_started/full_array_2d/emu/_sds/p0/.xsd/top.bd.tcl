
if {[llength [get_files *.bd]] == 1} {
  set diagram_handle [open_bd_design [get_files *.bd]]
} else {
  set diagram_handle [open_bd_design [get_files zc706.bd]]
}


#---------------------------
# Constant blocks
#---------------------------

#---------------------------
# Platform Parameters for zc706
#---------------------------
set ps7 [get_bd_cell /ps7]
    
set_property -dict [ list \
  CONFIG.PCW_USE_M_AXI_GP0 1 \
  CONFIG.PCW_USE_S_AXI_ACP 1 \
  CONFIG.PCW_USE_DEFAULT_ACP_USER_VAL 1 \
  ] $ps7
set xlconcat [get_bd_cell /xlconcat]
    
set_property -dict [ list \
  CONFIG.NUM_PORTS 16 \
  ] $xlconcat

#---------------------------
# Instantiating mmult_accel_1
#---------------------------
set mmult_accel_1 [create_bd_cell -type ip -vlnv xilinx.com:hls:mmult_accel:1.0 mmult_accel_1]
  

#---------------------------
# Instantiating mmult_accel_1_if
#---------------------------
set mmult_accel_1_if [create_bd_cell -type ip -vlnv xilinx.com:ip:adapter_v3_0:1.0 mmult_accel_1_if]
  
set_property -dict [ list \
  CONFIG.M_AXIMM_ADDR_WIDTH {32} \
  CONFIG.C_INPUT_SCALAR_0_WIDTH {32} \
  CONFIG.C_INPUT_SCALAR_1_WIDTH {32} \
  CONFIG.C_INPUT_SCALAR_2_WIDTH {32} \
  CONFIG.C_INPUT_SCALAR_3_WIDTH {32} \
  CONFIG.C_N_INPUT_SCALARS {4} \
  CONFIG.C_NUM_AXIMMs {3} \
  ] $mmult_accel_1_if

#---------------------------
# Instantiating axi_ic_ps7_M_AXI_GP0
#---------------------------
set axi_ic_ps7_M_AXI_GP0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps7_M_AXI_GP0]
  
set_property -dict [ list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_REGSLICE {1} \
  ] $axi_ic_ps7_M_AXI_GP0

#---------------------------
# Instantiating axi_ic_ps7_S_AXI_ACP
#---------------------------
set axi_ic_ps7_S_AXI_ACP [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps7_S_AXI_ACP]
  
set_property -dict [ list \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {3} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M00_HAS_DATA_FIFO {2} \
  CONFIG.S00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_DATA_FIFO {2} \
  CONFIG.S01_HAS_REGSLICE {1} \
  CONFIG.S01_HAS_DATA_FIFO {2} \
  CONFIG.S02_HAS_REGSLICE {1} \
  CONFIG.S02_HAS_DATA_FIFO {2} \
  ] $axi_ic_ps7_S_AXI_ACP

#---------------------------
# Instantiating sds_irq_const
#---------------------------
set sds_irq_const [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 sds_irq_const]
  
set_property -dict [ list \
  CONFIG.CONST_WIDTH {1} \
  CONFIG.CONST_VAL {0} \
  ] $sds_irq_const

#---------------------------
# Instantiating acp_axcache_0xE
#---------------------------
set acp_axcache_0xE [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 acp_axcache_0xE]
  
set_property -dict [ list \
  CONFIG.CONST_WIDTH {4} \
  CONFIG.CONST_VAL {14} \
  ] $acp_axcache_0xE

#---------------------------
# Connectivity
#---------------------------
connect_bd_net  \
  [get_bd_pins /mmult_accel_1_if/ap_clk] \
  [get_bd_pins /mmult_accel_1/ap_clk] \

connect_bd_net  \
  [get_bd_pins /mmult_accel_1_if/ap_resetn] \
  [get_bd_pins /mmult_accel_1/ap_rst_n] \

connect_bd_net  \
  [get_bd_pins /mmult_accel_1_if/ap_iscalar_0_dout] \
  [get_bd_pins /mmult_accel_1/a_offset] \

connect_bd_net  \
  [get_bd_pins /mmult_accel_1_if/ap_iscalar_1_dout] \
  [get_bd_pins /mmult_accel_1/b_offset] \

connect_bd_net  \
  [get_bd_pins /mmult_accel_1_if/ap_iscalar_2_dout] \
  [get_bd_pins /mmult_accel_1/c_offset] \

connect_bd_net  \
  [get_bd_pins /mmult_accel_1_if/ap_iscalar_3_dout] \
  [get_bd_pins /mmult_accel_1/size] \

connect_bd_net  \
  [get_bd_pins /ps7/FCLK_CLK1] \
  [get_bd_pins /ps7/M_AXI_GP0_ACLK] \
  [get_bd_pins /mmult_accel_1_if/s_axi_aclk] \
  [get_bd_pins /mmult_accel_1_if/acc_aclk] \
  [get_bd_pins /axi_ic_ps7_M_AXI_GP0/S00_ACLK] \
  [get_bd_pins /axi_ic_ps7_M_AXI_GP0/M00_ACLK] \
  [get_bd_pins /axi_ic_ps7_M_AXI_GP0/ACLK] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/M00_ACLK] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S00_ACLK] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S01_ACLK] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S02_ACLK] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/ACLK] \
  [get_bd_pins /ps7/S_AXI_ACP_ACLK] \

connect_bd_net  \
  [get_bd_pins /proc_sys_reset_1/interconnect_aresetn] \
  [get_bd_pins /axi_ic_ps7_M_AXI_GP0/S00_ARESETN] \
  [get_bd_pins /axi_ic_ps7_M_AXI_GP0/M00_ARESETN] \
  [get_bd_pins /axi_ic_ps7_M_AXI_GP0/ARESETN] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/M00_ARESETN] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S00_ARESETN] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S01_ARESETN] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S02_ARESETN] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/ARESETN] \

connect_bd_net  \
  [get_bd_pins /proc_sys_reset_1/peripheral_aresetn] \
  [get_bd_pins /mmult_accel_1_if/s_axi_aresetn] \
  [get_bd_pins /mmult_accel_1_if/acc_aresetn] \

connect_bd_net  \
  [get_bd_pins /sds_irq_const/dout] \
  [get_bd_pins /xlconcat/In0] \
  [get_bd_pins /xlconcat/In1] \
  [get_bd_pins /xlconcat/In2] \
  [get_bd_pins /xlconcat/In3] \
  [get_bd_pins /xlconcat/In4] \
  [get_bd_pins /xlconcat/In5] \
  [get_bd_pins /xlconcat/In6] \
  [get_bd_pins /xlconcat/In7] \
  [get_bd_pins /xlconcat/In8] \
  [get_bd_pins /xlconcat/In9] \
  [get_bd_pins /xlconcat/In10] \
  [get_bd_pins /xlconcat/In11] \
  [get_bd_pins /xlconcat/In12] \
  [get_bd_pins /xlconcat/In13] \
  [get_bd_pins /xlconcat/In14] \
  [get_bd_pins /xlconcat/In15] \

connect_bd_net  \
  [get_bd_pins /acp_axcache_0xE/dout] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S00_AXI_arcache] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S00_AXI_awcache] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S01_AXI_arcache] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S01_AXI_awcache] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S02_AXI_arcache] \
  [get_bd_pins /axi_ic_ps7_S_AXI_ACP/S02_AXI_awcache] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1_if/ap_ctrl] \
  [get_bd_intf_pins /mmult_accel_1/ap_ctrl] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1/m_axi_a] \
  [get_bd_intf_pins /mmult_accel_1_if/AP_AXIMM_0] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1/m_axi_b] \
  [get_bd_intf_pins /mmult_accel_1_if/AP_AXIMM_1] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1/m_axi_c] \
  [get_bd_intf_pins /mmult_accel_1_if/AP_AXIMM_2] \

connect_bd_intf_net \
  [get_bd_intf_pins /ps7/M_AXI_GP0] \
  [get_bd_intf_pins /axi_ic_ps7_M_AXI_GP0/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins /axi_ic_ps7_S_AXI_ACP/M00_AXI] \
  [get_bd_intf_pins /ps7/S_AXI_ACP] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1_if/M_AXIMM_0] \
  [get_bd_intf_pins /axi_ic_ps7_S_AXI_ACP/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1_if/M_AXIMM_1] \
  [get_bd_intf_pins /axi_ic_ps7_S_AXI_ACP/S01_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins /mmult_accel_1_if/M_AXIMM_2] \
  [get_bd_intf_pins /axi_ic_ps7_S_AXI_ACP/S02_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins /axi_ic_ps7_M_AXI_GP0/M00_AXI] \
  [get_bd_intf_pins /mmult_accel_1_if/S_AXI] \

#---------------------------
# Automation Commands
#---------------------------
assign_bd_address

include_bd_addr_seg [get_bd_addr_segs -excluded -of_objects [get_bd_addr_segs -of_objects [get_bd_intf_pin -of_objects [get_bd_cells] -filter "Mode==Slave"]]]


#---------------------------
# Create Address Map file
#---------------------------
set xml_file address_map.xml
set fp [open ${xml_file} w]
set addr_segs [get_bd_addr_segs -hier]
puts $fp "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
puts $fp "<xd:addressMap xmlns:xd=\"http://www.xilinx.com/xd\">"
foreach addr_seg $addr_segs {
  set path [get_property PATH $addr_seg]
  set offset [get_property OFFSET $addr_seg]
  if {$offset != ""} {
    set range [format 0x%X [get_property RANGE $addr_seg]]
    set high_addr [format 0x%X [expr $offset + $range - 1]]
    set slave [get_bd_addr_segs -of_object $addr_seg]
    regexp {([^/]+)/([^/]+)/([^/]+)$} $path match componentRef addressSpace segment
    regexp {([^/]+)/([^/]+)/([^/]+)$} $slave match slaveRef slaveMemoryMap slaveSegment  
    set slaveIntfPin [get_bd_intf_pins -of_objects $slave]
    regexp {([^/]+)$} $slaveIntfPin match slaveInterface
    puts $fp "  <xd:addressRange xd:componentRef=\"${componentRef}\" xd:addressSpace=\"${addressSpace}\" xd:segment=\"${segment}\" xd:slaveRef=\"${slaveRef}\" xd:slaveInterface=\"${slaveInterface}\" xd:slaveSegment=\"${slaveSegment}\" xd:baseAddr=\"${offset}\" xd:range=\"${range}\"/>"
  }
}
puts $fp "</xd:addressMap>"

close $fp
