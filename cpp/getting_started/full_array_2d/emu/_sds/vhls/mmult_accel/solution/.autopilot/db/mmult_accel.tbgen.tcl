set C_TypeInfoList {{ 
"mmult_accel" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"a": [[],{ "pointer":  {"scalar": "int"}}] }, {"b": [[],{ "pointer":  {"scalar": "int"}}] }, {"c": [[],{ "pointer":  {"scalar": "int"}}] }, {"size": [[], {"scalar": "int"}] }],[],""]
}}
set moduleName mmult_accel
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {mmult_accel}
set C_modelType { void 0 }
set C_modelArgList {
	{ a int 32 regular {axi_master 0}  }
	{ b int 32 regular {axi_master 0}  }
	{ c int 32 regular {axi_master 1}  }
	{ a_offset int 32 regular  }
	{ b_offset int 32 regular  }
	{ c_offset int 32 regular  }
	{ size int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "a", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "a","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "a_offset"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "b", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "b","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "b_offset"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "c", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "c","cData": "int","bit_use": { "low": 0,"up": 31},"offset": { "type": "dynamic","port_name": "c_offset"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "a_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "b_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_offset", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "size", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "size","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 145
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_a_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_a_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_a_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_a_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_a_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_a_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_a_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_a_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_a_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_a_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_a_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_a_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_a_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_a_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_a_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_a_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_a_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_a_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_b_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_b_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_b_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_b_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_b_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_b_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_b_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_b_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_b_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_b_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_b_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_b_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_b_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_b_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_b_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_b_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_b_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_b_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_b_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_b_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_b_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_b_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_b_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_b_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_b_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_b_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_b_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_b_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_b_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_b_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_b_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_c_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_c_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_c_AWADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_c_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_c_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_c_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_c_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_c_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_c_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_c_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_c_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_c_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_c_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_c_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_c_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_c_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_c_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_c_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_c_ARADDR sc_out sc_lv 32 signal 2 } 
	{ m_axi_c_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_c_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_c_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_c_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_c_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_c_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_c_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_c_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_c_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_c_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_c_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_c_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_c_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_c_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_c_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_c_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_c_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_c_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_c_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_c_BUSER sc_in sc_lv 1 signal 2 } 
	{ a_offset sc_in sc_lv 32 signal 3 } 
	{ b_offset sc_in sc_lv 32 signal 4 } 
	{ c_offset sc_in sc_lv 32 signal 5 } 
	{ size sc_in sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "m_axi_a_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "AWVALID" }} , 
 	{ "name": "m_axi_a_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "AWREADY" }} , 
 	{ "name": "m_axi_a_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "AWADDR" }} , 
 	{ "name": "m_axi_a_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "AWID" }} , 
 	{ "name": "m_axi_a_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "a", "role": "AWLEN" }} , 
 	{ "name": "m_axi_a_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_a_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a", "role": "AWBURST" }} , 
 	{ "name": "m_axi_a_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_a_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_a_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a", "role": "AWPROT" }} , 
 	{ "name": "m_axi_a_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "AWQOS" }} , 
 	{ "name": "m_axi_a_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "AWREGION" }} , 
 	{ "name": "m_axi_a_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "AWUSER" }} , 
 	{ "name": "m_axi_a_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "WVALID" }} , 
 	{ "name": "m_axi_a_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "WREADY" }} , 
 	{ "name": "m_axi_a_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "WDATA" }} , 
 	{ "name": "m_axi_a_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "WSTRB" }} , 
 	{ "name": "m_axi_a_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "WLAST" }} , 
 	{ "name": "m_axi_a_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "WID" }} , 
 	{ "name": "m_axi_a_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "WUSER" }} , 
 	{ "name": "m_axi_a_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "ARVALID" }} , 
 	{ "name": "m_axi_a_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "ARREADY" }} , 
 	{ "name": "m_axi_a_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "ARADDR" }} , 
 	{ "name": "m_axi_a_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "ARID" }} , 
 	{ "name": "m_axi_a_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "a", "role": "ARLEN" }} , 
 	{ "name": "m_axi_a_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_a_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a", "role": "ARBURST" }} , 
 	{ "name": "m_axi_a_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_a_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_a_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "a", "role": "ARPROT" }} , 
 	{ "name": "m_axi_a_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "ARQOS" }} , 
 	{ "name": "m_axi_a_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "a", "role": "ARREGION" }} , 
 	{ "name": "m_axi_a_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "ARUSER" }} , 
 	{ "name": "m_axi_a_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "RVALID" }} , 
 	{ "name": "m_axi_a_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "RREADY" }} , 
 	{ "name": "m_axi_a_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a", "role": "RDATA" }} , 
 	{ "name": "m_axi_a_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "RLAST" }} , 
 	{ "name": "m_axi_a_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "RID" }} , 
 	{ "name": "m_axi_a_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "RUSER" }} , 
 	{ "name": "m_axi_a_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a", "role": "RRESP" }} , 
 	{ "name": "m_axi_a_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "BVALID" }} , 
 	{ "name": "m_axi_a_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "BREADY" }} , 
 	{ "name": "m_axi_a_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "a", "role": "BRESP" }} , 
 	{ "name": "m_axi_a_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "BID" }} , 
 	{ "name": "m_axi_a_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "a", "role": "BUSER" }} , 
 	{ "name": "m_axi_b_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "AWVALID" }} , 
 	{ "name": "m_axi_b_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "AWREADY" }} , 
 	{ "name": "m_axi_b_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b", "role": "AWADDR" }} , 
 	{ "name": "m_axi_b_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "AWID" }} , 
 	{ "name": "m_axi_b_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b", "role": "AWLEN" }} , 
 	{ "name": "m_axi_b_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_b_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b", "role": "AWBURST" }} , 
 	{ "name": "m_axi_b_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_b_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_b_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b", "role": "AWPROT" }} , 
 	{ "name": "m_axi_b_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "AWQOS" }} , 
 	{ "name": "m_axi_b_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "AWREGION" }} , 
 	{ "name": "m_axi_b_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "AWUSER" }} , 
 	{ "name": "m_axi_b_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "WVALID" }} , 
 	{ "name": "m_axi_b_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "WREADY" }} , 
 	{ "name": "m_axi_b_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b", "role": "WDATA" }} , 
 	{ "name": "m_axi_b_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "WSTRB" }} , 
 	{ "name": "m_axi_b_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "WLAST" }} , 
 	{ "name": "m_axi_b_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "WID" }} , 
 	{ "name": "m_axi_b_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "WUSER" }} , 
 	{ "name": "m_axi_b_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "ARVALID" }} , 
 	{ "name": "m_axi_b_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "ARREADY" }} , 
 	{ "name": "m_axi_b_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b", "role": "ARADDR" }} , 
 	{ "name": "m_axi_b_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "ARID" }} , 
 	{ "name": "m_axi_b_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "b", "role": "ARLEN" }} , 
 	{ "name": "m_axi_b_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_b_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b", "role": "ARBURST" }} , 
 	{ "name": "m_axi_b_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_b_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_b_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "b", "role": "ARPROT" }} , 
 	{ "name": "m_axi_b_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "ARQOS" }} , 
 	{ "name": "m_axi_b_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "b", "role": "ARREGION" }} , 
 	{ "name": "m_axi_b_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "ARUSER" }} , 
 	{ "name": "m_axi_b_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "RVALID" }} , 
 	{ "name": "m_axi_b_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "RREADY" }} , 
 	{ "name": "m_axi_b_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b", "role": "RDATA" }} , 
 	{ "name": "m_axi_b_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "RLAST" }} , 
 	{ "name": "m_axi_b_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "RID" }} , 
 	{ "name": "m_axi_b_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "RUSER" }} , 
 	{ "name": "m_axi_b_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b", "role": "RRESP" }} , 
 	{ "name": "m_axi_b_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "BVALID" }} , 
 	{ "name": "m_axi_b_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "BREADY" }} , 
 	{ "name": "m_axi_b_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "b", "role": "BRESP" }} , 
 	{ "name": "m_axi_b_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "BID" }} , 
 	{ "name": "m_axi_b_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "b", "role": "BUSER" }} , 
 	{ "name": "m_axi_c_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "AWVALID" }} , 
 	{ "name": "m_axi_c_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "AWREADY" }} , 
 	{ "name": "m_axi_c_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c", "role": "AWADDR" }} , 
 	{ "name": "m_axi_c_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "AWID" }} , 
 	{ "name": "m_axi_c_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "c", "role": "AWLEN" }} , 
 	{ "name": "m_axi_c_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "c", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_c_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "c", "role": "AWBURST" }} , 
 	{ "name": "m_axi_c_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "c", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_c_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_c_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "c", "role": "AWPROT" }} , 
 	{ "name": "m_axi_c_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "AWQOS" }} , 
 	{ "name": "m_axi_c_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "AWREGION" }} , 
 	{ "name": "m_axi_c_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "AWUSER" }} , 
 	{ "name": "m_axi_c_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "WVALID" }} , 
 	{ "name": "m_axi_c_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "WREADY" }} , 
 	{ "name": "m_axi_c_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c", "role": "WDATA" }} , 
 	{ "name": "m_axi_c_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "WSTRB" }} , 
 	{ "name": "m_axi_c_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "WLAST" }} , 
 	{ "name": "m_axi_c_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "WID" }} , 
 	{ "name": "m_axi_c_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "WUSER" }} , 
 	{ "name": "m_axi_c_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "ARVALID" }} , 
 	{ "name": "m_axi_c_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "ARREADY" }} , 
 	{ "name": "m_axi_c_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c", "role": "ARADDR" }} , 
 	{ "name": "m_axi_c_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "ARID" }} , 
 	{ "name": "m_axi_c_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "c", "role": "ARLEN" }} , 
 	{ "name": "m_axi_c_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "c", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_c_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "c", "role": "ARBURST" }} , 
 	{ "name": "m_axi_c_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "c", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_c_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_c_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "c", "role": "ARPROT" }} , 
 	{ "name": "m_axi_c_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "ARQOS" }} , 
 	{ "name": "m_axi_c_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "c", "role": "ARREGION" }} , 
 	{ "name": "m_axi_c_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "ARUSER" }} , 
 	{ "name": "m_axi_c_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "RVALID" }} , 
 	{ "name": "m_axi_c_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "RREADY" }} , 
 	{ "name": "m_axi_c_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c", "role": "RDATA" }} , 
 	{ "name": "m_axi_c_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "RLAST" }} , 
 	{ "name": "m_axi_c_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "RID" }} , 
 	{ "name": "m_axi_c_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "RUSER" }} , 
 	{ "name": "m_axi_c_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "c", "role": "RRESP" }} , 
 	{ "name": "m_axi_c_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "BVALID" }} , 
 	{ "name": "m_axi_c_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "BREADY" }} , 
 	{ "name": "m_axi_c_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "c", "role": "BRESP" }} , 
 	{ "name": "m_axi_c_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "BID" }} , 
 	{ "name": "m_axi_c_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "c", "role": "BUSER" }} , 
 	{ "name": "a_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_offset", "role": "default" }} , 
 	{ "name": "b_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b_offset", "role": "default" }} , 
 	{ "name": "c_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_offset", "role": "default" }} , 
 	{ "name": "size", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "size", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8"],
		"CDFG" : "mmult_accel",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"VariableLatency" : "1",
		"Port" : [
			{"Name" : "a", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "a_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "a_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "b", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "b_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "b_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "c", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "c_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "c_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "c_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "a_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "b_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "c_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "size", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mmult_accel_a_m_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mmult_accel_b_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mmult_accel_c_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bufa_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bufb_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bufc_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mmult_accel_mul_3bkb_U1", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mmult_accel_mul_3bkb_U2", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mmult_accel {
		a {Type I LastRead 9 FirstWrite -1}
		b {Type I LastRead 16 FirstWrite -1}
		c {Type O LastRead 18 FirstWrite 20}
		a_offset {Type I LastRead 2 FirstWrite -1}
		b_offset {Type I LastRead 8 FirstWrite -1}
		c_offset {Type I LastRead 8 FirstWrite -1}
		size {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "38", "Max" : "17629718"}
	, {"Name" : "Interval", "Min" : "39", "Max" : "17629719"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	a { m_axi {  { m_axi_a_AWVALID VALID 1 1 }  { m_axi_a_AWREADY READY 0 1 }  { m_axi_a_AWADDR ADDR 1 32 }  { m_axi_a_AWID ID 1 1 }  { m_axi_a_AWLEN LEN 1 8 }  { m_axi_a_AWSIZE SIZE 1 3 }  { m_axi_a_AWBURST BURST 1 2 }  { m_axi_a_AWLOCK LOCK 1 2 }  { m_axi_a_AWCACHE CACHE 1 4 }  { m_axi_a_AWPROT PROT 1 3 }  { m_axi_a_AWQOS QOS 1 4 }  { m_axi_a_AWREGION REGION 1 4 }  { m_axi_a_AWUSER USER 1 1 }  { m_axi_a_WVALID VALID 1 1 }  { m_axi_a_WREADY READY 0 1 }  { m_axi_a_WDATA DATA 1 32 }  { m_axi_a_WSTRB STRB 1 4 }  { m_axi_a_WLAST LAST 1 1 }  { m_axi_a_WID ID 1 1 }  { m_axi_a_WUSER USER 1 1 }  { m_axi_a_ARVALID VALID 1 1 }  { m_axi_a_ARREADY READY 0 1 }  { m_axi_a_ARADDR ADDR 1 32 }  { m_axi_a_ARID ID 1 1 }  { m_axi_a_ARLEN LEN 1 8 }  { m_axi_a_ARSIZE SIZE 1 3 }  { m_axi_a_ARBURST BURST 1 2 }  { m_axi_a_ARLOCK LOCK 1 2 }  { m_axi_a_ARCACHE CACHE 1 4 }  { m_axi_a_ARPROT PROT 1 3 }  { m_axi_a_ARQOS QOS 1 4 }  { m_axi_a_ARREGION REGION 1 4 }  { m_axi_a_ARUSER USER 1 1 }  { m_axi_a_RVALID VALID 0 1 }  { m_axi_a_RREADY READY 1 1 }  { m_axi_a_RDATA DATA 0 32 }  { m_axi_a_RLAST LAST 0 1 }  { m_axi_a_RID ID 0 1 }  { m_axi_a_RUSER USER 0 1 }  { m_axi_a_RRESP RESP 0 2 }  { m_axi_a_BVALID VALID 0 1 }  { m_axi_a_BREADY READY 1 1 }  { m_axi_a_BRESP RESP 0 2 }  { m_axi_a_BID ID 0 1 }  { m_axi_a_BUSER USER 0 1 } } }
	b { m_axi {  { m_axi_b_AWVALID VALID 1 1 }  { m_axi_b_AWREADY READY 0 1 }  { m_axi_b_AWADDR ADDR 1 32 }  { m_axi_b_AWID ID 1 1 }  { m_axi_b_AWLEN LEN 1 8 }  { m_axi_b_AWSIZE SIZE 1 3 }  { m_axi_b_AWBURST BURST 1 2 }  { m_axi_b_AWLOCK LOCK 1 2 }  { m_axi_b_AWCACHE CACHE 1 4 }  { m_axi_b_AWPROT PROT 1 3 }  { m_axi_b_AWQOS QOS 1 4 }  { m_axi_b_AWREGION REGION 1 4 }  { m_axi_b_AWUSER USER 1 1 }  { m_axi_b_WVALID VALID 1 1 }  { m_axi_b_WREADY READY 0 1 }  { m_axi_b_WDATA DATA 1 32 }  { m_axi_b_WSTRB STRB 1 4 }  { m_axi_b_WLAST LAST 1 1 }  { m_axi_b_WID ID 1 1 }  { m_axi_b_WUSER USER 1 1 }  { m_axi_b_ARVALID VALID 1 1 }  { m_axi_b_ARREADY READY 0 1 }  { m_axi_b_ARADDR ADDR 1 32 }  { m_axi_b_ARID ID 1 1 }  { m_axi_b_ARLEN LEN 1 8 }  { m_axi_b_ARSIZE SIZE 1 3 }  { m_axi_b_ARBURST BURST 1 2 }  { m_axi_b_ARLOCK LOCK 1 2 }  { m_axi_b_ARCACHE CACHE 1 4 }  { m_axi_b_ARPROT PROT 1 3 }  { m_axi_b_ARQOS QOS 1 4 }  { m_axi_b_ARREGION REGION 1 4 }  { m_axi_b_ARUSER USER 1 1 }  { m_axi_b_RVALID VALID 0 1 }  { m_axi_b_RREADY READY 1 1 }  { m_axi_b_RDATA DATA 0 32 }  { m_axi_b_RLAST LAST 0 1 }  { m_axi_b_RID ID 0 1 }  { m_axi_b_RUSER USER 0 1 }  { m_axi_b_RRESP RESP 0 2 }  { m_axi_b_BVALID VALID 0 1 }  { m_axi_b_BREADY READY 1 1 }  { m_axi_b_BRESP RESP 0 2 }  { m_axi_b_BID ID 0 1 }  { m_axi_b_BUSER USER 0 1 } } }
	c { m_axi {  { m_axi_c_AWVALID VALID 1 1 }  { m_axi_c_AWREADY READY 0 1 }  { m_axi_c_AWADDR ADDR 1 32 }  { m_axi_c_AWID ID 1 1 }  { m_axi_c_AWLEN LEN 1 8 }  { m_axi_c_AWSIZE SIZE 1 3 }  { m_axi_c_AWBURST BURST 1 2 }  { m_axi_c_AWLOCK LOCK 1 2 }  { m_axi_c_AWCACHE CACHE 1 4 }  { m_axi_c_AWPROT PROT 1 3 }  { m_axi_c_AWQOS QOS 1 4 }  { m_axi_c_AWREGION REGION 1 4 }  { m_axi_c_AWUSER USER 1 1 }  { m_axi_c_WVALID VALID 1 1 }  { m_axi_c_WREADY READY 0 1 }  { m_axi_c_WDATA DATA 1 32 }  { m_axi_c_WSTRB STRB 1 4 }  { m_axi_c_WLAST LAST 1 1 }  { m_axi_c_WID ID 1 1 }  { m_axi_c_WUSER USER 1 1 }  { m_axi_c_ARVALID VALID 1 1 }  { m_axi_c_ARREADY READY 0 1 }  { m_axi_c_ARADDR ADDR 1 32 }  { m_axi_c_ARID ID 1 1 }  { m_axi_c_ARLEN LEN 1 8 }  { m_axi_c_ARSIZE SIZE 1 3 }  { m_axi_c_ARBURST BURST 1 2 }  { m_axi_c_ARLOCK LOCK 1 2 }  { m_axi_c_ARCACHE CACHE 1 4 }  { m_axi_c_ARPROT PROT 1 3 }  { m_axi_c_ARQOS QOS 1 4 }  { m_axi_c_ARREGION REGION 1 4 }  { m_axi_c_ARUSER USER 1 1 }  { m_axi_c_RVALID VALID 0 1 }  { m_axi_c_RREADY READY 1 1 }  { m_axi_c_RDATA DATA 0 32 }  { m_axi_c_RLAST LAST 0 1 }  { m_axi_c_RID ID 0 1 }  { m_axi_c_RUSER USER 0 1 }  { m_axi_c_RRESP RESP 0 2 }  { m_axi_c_BVALID VALID 0 1 }  { m_axi_c_BREADY READY 1 1 }  { m_axi_c_BRESP RESP 0 2 }  { m_axi_c_BID ID 0 1 }  { m_axi_c_BUSER USER 0 1 } } }
	a_offset { ap_none {  { a_offset in_data 0 32 } } }
	b_offset { ap_none {  { b_offset in_data 0 32 } } }
	c_offset { ap_none {  { c_offset in_data 0 32 } } }
	size { ap_none {  { size in_data 0 32 } } }
}

set busDeadlockParameterList { 
	{ a { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ b { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ c { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ a 1 }
	{ b 1 }
	{ c 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ a 1 }
	{ b 1 }
	{ c 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
