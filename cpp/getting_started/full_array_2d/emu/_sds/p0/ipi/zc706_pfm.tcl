# zc706_pfm.tcl --
#
# This file uses the SDSoC Tcl Platform API to create the
# zc706 hardware platform file
#
# Copyright (c) 2015 Xilinx, Inc.
#

set pfm [sdsoc::create_pfm zc706.hpfm]
sdsoc::pfm_name        $pfm "xilinx.com" "xd" "zc706" "1.0"
sdsoc::pfm_description $pfm "Basic platform targeting the ZC706 board, which includes 1GB of DDR3 for the Processing System, 1GB DDR3 for the Programmable Logic, 2x16MB Quad-SPI Flash and an SDIO card interface. More information at https://www.xilinx.com/products/boards-and-kits/ek-z7-zc706-g.html"
sdsoc::pfm_clock       $pfm FCLK_CLK0 ps7 0 false proc_sys_reset_0
sdsoc::pfm_clock       $pfm FCLK_CLK1 ps7 1 true  proc_sys_reset_1
sdsoc::pfm_clock       $pfm FCLK_CLK2 ps7 2 false proc_sys_reset_2
sdsoc::pfm_clock       $pfm FCLK_CLK3 ps7 3 false proc_sys_reset_3
sdsoc::pfm_axi_port    $pfm M_AXI_GP0 ps7 M_AXI_GP
sdsoc::pfm_axi_port    $pfm M_AXI_GP1 ps7 M_AXI_GP
sdsoc::pfm_axi_port    $pfm S_AXI_ACP ps7 S_AXI_ACP
sdsoc::pfm_axi_port    $pfm S_AXI_HP0 ps7 S_AXI_HP
sdsoc::pfm_axi_port    $pfm S_AXI_HP1 ps7 S_AXI_HP
sdsoc::pfm_axi_port    $pfm S_AXI_HP2 ps7 S_AXI_HP
sdsoc::pfm_axi_port    $pfm S_AXI_HP3 ps7 S_AXI_HP
for {set i 0} {$i < 16} {incr i} {
  sdsoc::pfm_irq       $pfm In$i xlconcat
}
sdsoc::generate_hw_pfm $pfm
