set C_TypeInfoList {{ 
"mean_value_accel" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"in": [[],{ "pointer":  {"scalar": "int"}}] }, {"out": [[],{ "pointer":  {"scalar": "int"}}] }, {"size": [[], {"scalar": "int"}] }],[],""]
}}
set moduleName mean_value_accel
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mean_value_accel}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_r int 32 regular {axi_master 0}  }
	{ out_r int 32 regular {axi_master 1}  }
	{ in_offset int 32 regular  }
	{ out_offset int 32 regular  }
	{ size int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_r", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "in","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "in_offset"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_r", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "out","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "out_offset"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "in_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "size","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 99
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_in_r_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_in_r_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_in_r_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_in_r_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_in_r_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_in_r_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_in_r_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_in_r_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_in_r_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_in_r_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_in_r_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_in_r_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_in_r_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_in_r_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_in_r_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_in_r_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_in_r_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_in_r_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_in_r_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_in_r_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_in_r_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_in_r_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_in_r_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_in_r_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_in_r_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_in_r_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_in_r_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_in_r_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_in_r_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_in_r_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_in_r_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_in_r_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_in_r_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_in_r_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_in_r_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_in_r_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_in_r_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_in_r_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_in_r_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_out_r_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_out_r_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_out_r_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_out_r_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_out_r_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_out_r_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_out_r_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_out_r_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_out_r_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_out_r_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_out_r_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_out_r_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_out_r_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_out_r_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_out_r_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_out_r_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_out_r_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_out_r_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_out_r_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_out_r_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_out_r_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_out_r_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_out_r_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_out_r_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_out_r_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_out_r_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_out_r_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_out_r_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_out_r_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_out_r_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_out_r_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_out_r_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_out_r_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_out_r_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_out_r_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_out_r_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_out_r_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_out_r_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_out_r_BUSER sc_in sc_lv 1 signal 1 } 
	{ in_offset sc_in sc_lv 32 signal 2 } 
	{ out_offset sc_in sc_lv 32 signal 3 } 
	{ size sc_in sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_in_r_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "AWVALID" }} , 
 	{ "name": "m_axi_in_r_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "AWREADY" }} , 
 	{ "name": "m_axi_in_r_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_r", "role": "AWADDR" }} , 
 	{ "name": "m_axi_in_r_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "AWID" }} , 
 	{ "name": "m_axi_in_r_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_r", "role": "AWLEN" }} , 
 	{ "name": "m_axi_in_r_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_r", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_in_r_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_r", "role": "AWBURST" }} , 
 	{ "name": "m_axi_in_r_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_r", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_in_r_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_in_r_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_r", "role": "AWPROT" }} , 
 	{ "name": "m_axi_in_r_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "AWQOS" }} , 
 	{ "name": "m_axi_in_r_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "AWREGION" }} , 
 	{ "name": "m_axi_in_r_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "AWUSER" }} , 
 	{ "name": "m_axi_in_r_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "WVALID" }} , 
 	{ "name": "m_axi_in_r_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "WREADY" }} , 
 	{ "name": "m_axi_in_r_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_r", "role": "WDATA" }} , 
 	{ "name": "m_axi_in_r_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "WSTRB" }} , 
 	{ "name": "m_axi_in_r_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "WLAST" }} , 
 	{ "name": "m_axi_in_r_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "WID" }} , 
 	{ "name": "m_axi_in_r_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "WUSER" }} , 
 	{ "name": "m_axi_in_r_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "ARVALID" }} , 
 	{ "name": "m_axi_in_r_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "ARREADY" }} , 
 	{ "name": "m_axi_in_r_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_r", "role": "ARADDR" }} , 
 	{ "name": "m_axi_in_r_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "ARID" }} , 
 	{ "name": "m_axi_in_r_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_r", "role": "ARLEN" }} , 
 	{ "name": "m_axi_in_r_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_r", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_in_r_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_r", "role": "ARBURST" }} , 
 	{ "name": "m_axi_in_r_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_r", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_in_r_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_in_r_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_r", "role": "ARPROT" }} , 
 	{ "name": "m_axi_in_r_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "ARQOS" }} , 
 	{ "name": "m_axi_in_r_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_r", "role": "ARREGION" }} , 
 	{ "name": "m_axi_in_r_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "ARUSER" }} , 
 	{ "name": "m_axi_in_r_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "RVALID" }} , 
 	{ "name": "m_axi_in_r_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "RREADY" }} , 
 	{ "name": "m_axi_in_r_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_r", "role": "RDATA" }} , 
 	{ "name": "m_axi_in_r_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "RLAST" }} , 
 	{ "name": "m_axi_in_r_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "RID" }} , 
 	{ "name": "m_axi_in_r_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "RUSER" }} , 
 	{ "name": "m_axi_in_r_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_r", "role": "RRESP" }} , 
 	{ "name": "m_axi_in_r_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "BVALID" }} , 
 	{ "name": "m_axi_in_r_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "BREADY" }} , 
 	{ "name": "m_axi_in_r_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "in_r", "role": "BRESP" }} , 
 	{ "name": "m_axi_in_r_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "BID" }} , 
 	{ "name": "m_axi_in_r_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_r", "role": "BUSER" }} , 
 	{ "name": "m_axi_out_r_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "AWVALID" }} , 
 	{ "name": "m_axi_out_r_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "AWREADY" }} , 
 	{ "name": "m_axi_out_r_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_r", "role": "AWADDR" }} , 
 	{ "name": "m_axi_out_r_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "AWID" }} , 
 	{ "name": "m_axi_out_r_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_r", "role": "AWLEN" }} , 
 	{ "name": "m_axi_out_r_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_r", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_out_r_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_r", "role": "AWBURST" }} , 
 	{ "name": "m_axi_out_r_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_r", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_out_r_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_out_r_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_r", "role": "AWPROT" }} , 
 	{ "name": "m_axi_out_r_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "AWQOS" }} , 
 	{ "name": "m_axi_out_r_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "AWREGION" }} , 
 	{ "name": "m_axi_out_r_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "AWUSER" }} , 
 	{ "name": "m_axi_out_r_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "WVALID" }} , 
 	{ "name": "m_axi_out_r_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "WREADY" }} , 
 	{ "name": "m_axi_out_r_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_r", "role": "WDATA" }} , 
 	{ "name": "m_axi_out_r_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "WSTRB" }} , 
 	{ "name": "m_axi_out_r_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "WLAST" }} , 
 	{ "name": "m_axi_out_r_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "WID" }} , 
 	{ "name": "m_axi_out_r_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "WUSER" }} , 
 	{ "name": "m_axi_out_r_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "ARVALID" }} , 
 	{ "name": "m_axi_out_r_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "ARREADY" }} , 
 	{ "name": "m_axi_out_r_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_r", "role": "ARADDR" }} , 
 	{ "name": "m_axi_out_r_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "ARID" }} , 
 	{ "name": "m_axi_out_r_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_r", "role": "ARLEN" }} , 
 	{ "name": "m_axi_out_r_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_r", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_out_r_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_r", "role": "ARBURST" }} , 
 	{ "name": "m_axi_out_r_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_r", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_out_r_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_out_r_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_r", "role": "ARPROT" }} , 
 	{ "name": "m_axi_out_r_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "ARQOS" }} , 
 	{ "name": "m_axi_out_r_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_r", "role": "ARREGION" }} , 
 	{ "name": "m_axi_out_r_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "ARUSER" }} , 
 	{ "name": "m_axi_out_r_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "RVALID" }} , 
 	{ "name": "m_axi_out_r_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "RREADY" }} , 
 	{ "name": "m_axi_out_r_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_r", "role": "RDATA" }} , 
 	{ "name": "m_axi_out_r_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "RLAST" }} , 
 	{ "name": "m_axi_out_r_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "RID" }} , 
 	{ "name": "m_axi_out_r_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "RUSER" }} , 
 	{ "name": "m_axi_out_r_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_r", "role": "RRESP" }} , 
 	{ "name": "m_axi_out_r_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "BVALID" }} , 
 	{ "name": "m_axi_out_r_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "BREADY" }} , 
 	{ "name": "m_axi_out_r_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "out_r", "role": "BRESP" }} , 
 	{ "name": "m_axi_out_r_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "BID" }} , 
 	{ "name": "m_axi_out_r_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_r", "role": "BUSER" }} , 
 	{ "name": "in_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_offset", "role": "default" }} , 
 	{ "name": "out_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_offset", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "mean_value_accel",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "in_r", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_r_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "in_r_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "out_r", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "out_r_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "out_r_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "in_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "size", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mean_value_accel_in_r_m_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mean_value_accel_out_r_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.local_buffer_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mean_value_accel_cud_U1", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mean_value_accel {
		in_r {Type I LastRead 8 FirstWrite -1}
		out_r {Type O LastRead 18 FirstWrite 19}
		in_offset {Type I LastRead 0 FirstWrite -1}
		out_offset {Type I LastRead 6 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2566", "Max" : "2566"}
	, {"Name" : "Interval", "Min" : "2567", "Max" : "2567"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	in_r { m_axi {  { m_axi_in_r_AWVALID VALID 1 1 }  { m_axi_in_r_AWREADY READY 0 1 }  { m_axi_in_r_AWADDR ADDR 1 32 }  { m_axi_in_r_AWID ID 1 1 }  { m_axi_in_r_AWLEN LEN 1 8 }  { m_axi_in_r_AWSIZE SIZE 1 3 }  { m_axi_in_r_AWBURST BURST 1 2 }  { m_axi_in_r_AWLOCK LOCK 1 2 }  { m_axi_in_r_AWCACHE CACHE 1 4 }  { m_axi_in_r_AWPROT PROT 1 3 }  { m_axi_in_r_AWQOS QOS 1 4 }  { m_axi_in_r_AWREGION REGION 1 4 }  { m_axi_in_r_AWUSER USER 1 1 }  { m_axi_in_r_WVALID VALID 1 1 }  { m_axi_in_r_WREADY READY 0 1 }  { m_axi_in_r_WDATA DATA 1 32 }  { m_axi_in_r_WSTRB STRB 1 4 }  { m_axi_in_r_WLAST LAST 1 1 }  { m_axi_in_r_WID ID 1 1 }  { m_axi_in_r_WUSER USER 1 1 }  { m_axi_in_r_ARVALID VALID 1 1 }  { m_axi_in_r_ARREADY READY 0 1 }  { m_axi_in_r_ARADDR ADDR 1 32 }  { m_axi_in_r_ARID ID 1 1 }  { m_axi_in_r_ARLEN LEN 1 8 }  { m_axi_in_r_ARSIZE SIZE 1 3 }  { m_axi_in_r_ARBURST BURST 1 2 }  { m_axi_in_r_ARLOCK LOCK 1 2 }  { m_axi_in_r_ARCACHE CACHE 1 4 }  { m_axi_in_r_ARPROT PROT 1 3 }  { m_axi_in_r_ARQOS QOS 1 4 }  { m_axi_in_r_ARREGION REGION 1 4 }  { m_axi_in_r_ARUSER USER 1 1 }  { m_axi_in_r_RVALID VALID 0 1 }  { m_axi_in_r_RREADY READY 1 1 }  { m_axi_in_r_RDATA DATA 0 32 }  { m_axi_in_r_RLAST LAST 0 1 }  { m_axi_in_r_RID ID 0 1 }  { m_axi_in_r_RUSER USER 0 1 }  { m_axi_in_r_RRESP RESP 0 2 }  { m_axi_in_r_BVALID VALID 0 1 }  { m_axi_in_r_BREADY READY 1 1 }  { m_axi_in_r_BRESP RESP 0 2 }  { m_axi_in_r_BID ID 0 1 }  { m_axi_in_r_BUSER USER 0 1 } } }
	out_r { m_axi {  { m_axi_out_r_AWVALID VALID 1 1 }  { m_axi_out_r_AWREADY READY 0 1 }  { m_axi_out_r_AWADDR ADDR 1 32 }  { m_axi_out_r_AWID ID 1 1 }  { m_axi_out_r_AWLEN LEN 1 8 }  { m_axi_out_r_AWSIZE SIZE 1 3 }  { m_axi_out_r_AWBURST BURST 1 2 }  { m_axi_out_r_AWLOCK LOCK 1 2 }  { m_axi_out_r_AWCACHE CACHE 1 4 }  { m_axi_out_r_AWPROT PROT 1 3 }  { m_axi_out_r_AWQOS QOS 1 4 }  { m_axi_out_r_AWREGION REGION 1 4 }  { m_axi_out_r_AWUSER USER 1 1 }  { m_axi_out_r_WVALID VALID 1 1 }  { m_axi_out_r_WREADY READY 0 1 }  { m_axi_out_r_WDATA DATA 1 32 }  { m_axi_out_r_WSTRB STRB 1 4 }  { m_axi_out_r_WLAST LAST 1 1 }  { m_axi_out_r_WID ID 1 1 }  { m_axi_out_r_WUSER USER 1 1 }  { m_axi_out_r_ARVALID VALID 1 1 }  { m_axi_out_r_ARREADY READY 0 1 }  { m_axi_out_r_ARADDR ADDR 1 32 }  { m_axi_out_r_ARID ID 1 1 }  { m_axi_out_r_ARLEN LEN 1 8 }  { m_axi_out_r_ARSIZE SIZE 1 3 }  { m_axi_out_r_ARBURST BURST 1 2 }  { m_axi_out_r_ARLOCK LOCK 1 2 }  { m_axi_out_r_ARCACHE CACHE 1 4 }  { m_axi_out_r_ARPROT PROT 1 3 }  { m_axi_out_r_ARQOS QOS 1 4 }  { m_axi_out_r_ARREGION REGION 1 4 }  { m_axi_out_r_ARUSER USER 1 1 }  { m_axi_out_r_RVALID VALID 0 1 }  { m_axi_out_r_RREADY READY 1 1 }  { m_axi_out_r_RDATA DATA 0 32 }  { m_axi_out_r_RLAST LAST 0 1 }  { m_axi_out_r_RID ID 0 1 }  { m_axi_out_r_RUSER USER 0 1 }  { m_axi_out_r_RRESP RESP 0 2 }  { m_axi_out_r_BVALID VALID 0 1 }  { m_axi_out_r_BREADY READY 1 1 }  { m_axi_out_r_BRESP RESP 0 2 }  { m_axi_out_r_BID ID 0 1 }  { m_axi_out_r_BUSER USER 0 1 } } }
	in_offset { ap_none {  { in_offset in_data 0 32 } } }
	out_offset { ap_none {  { out_offset in_data 0 32 } } }
	size { ap_none {  { size in_data 0 32 } } }
}

set busDeadlockParameterList { 
	{ in_r { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ out_r { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ in_r 1 }
	{ out_r 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ in_r 1 }
	{ out_r 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
