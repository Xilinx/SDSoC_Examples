; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu/_sds/vhls/mean_value_accel/solution/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@mean_value_accel_str = internal unnamed_addr constant [17 x i8] c"mean_value_accel\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@p_str7 = private unnamed_addr constant [13 x i8] c"output_write\00", align 1
@p_str6 = private unnamed_addr constant [8 x i8] c"calc_mv\00", align 1
@p_str5 = private unnamed_addr constant [11 x i8] c"input_read\00", align 1
@p_str4 = private unnamed_addr constant [4 x i8] c"out\00", align 1
@p_str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1
@p_str2 = private unnamed_addr constant [3 x i8] c"in\00", align 1
@p_str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @mean_value_accel(i32* %in_r, i32* %out_r, i32 %in_offset, i32 %out_offset, i32 %size) {
  %size_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %size)
  %out_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %out_offset)
  %in_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %in_offset)
  %out_offset3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %out_offset_read, i32 2, i32 31)
  %tmp_6 = zext i30 %out_offset3 to i32
  %out_addr = getelementptr i32* %out_r, i32 %tmp_6
  %in_offset1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %in_offset_read, i32 2, i32 31)
  %tmp_18 = zext i30 %in_offset1 to i32
  %in_addr = getelementptr i32* %in_r, i32 %tmp_18
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out_r), !map !16
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_r), !map !20
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %size) nounwind, !map !24
  call void (...)* @_ssdm_op_SpecTopModule([17 x i8]* @mean_value_accel_str) nounwind
  %local_buffer = alloca [2048 x i32], align 4
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_r, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [3 x i8]* @p_str2, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_r, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [4 x i8]* @p_str4, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %in_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %in_addr, i32 %size_read)
  br label %1

; <label>:1                                       ; preds = %2, %0
  %i = phi i31 [ 0, %0 ], [ %i_1, %2 ]
  %i_cast = zext i31 %i to i32
  %tmp = icmp slt i32 %i_cast, %size_read
  %i_1 = add i31 %i, 1
  br i1 %tmp, label %2, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  %tmp_2 = add nsw i32 %size_read, -1
  %local_buffer_addr_1 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 0
  br label %.preheader

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str5) nounwind
  %tmp_15 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str5) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 256, i32 256, i32 256, [1 x i8]* @p_str) nounwind
  %in_addr_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %in_addr)
  %local_buffer_addr = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %i_cast
  store i32 %in_addr_read, i32* %local_buffer_addr, align 4
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str5, i32 %tmp_15) nounwind
  br label %1

.preheader:                                       ; preds = %3, %.preheader.preheader
  %i1 = phi i31 [ %i_2, %3 ], [ 1, %.preheader.preheader ]
  %i1_cast = zext i31 %i1 to i32
  %tmp_3 = icmp slt i32 %i1_cast, %tmp_2
  br i1 %tmp_3, label %3, label %4

; <label>:3                                       ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([8 x i8]* @p_str6) nounwind
  %tmp_16 = call i32 (...)* @_ssdm_op_SpecRegionBegin([8 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 254, i32 254, i32 254, [1 x i8]* @p_str) nounwind
  %tmp_26 = trunc i31 %i1 to i13
  %tmp_4 = add i13 -1, %tmp_26
  %tmp_4_cast = zext i13 %tmp_4 to i32
  %local_buffer_addr_2 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_4_cast
  %local_buffer_load = load i32* %local_buffer_addr_2, align 4
  %local_buffer_addr_3 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %i1_cast
  %local_buffer_load_1 = load i32* %local_buffer_addr_3, align 4
  %i_2 = add i31 1, %i1
  %i_2_cast = zext i31 %i_2 to i32
  %local_buffer_addr_4 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %i_2_cast
  %local_buffer_load_2 = load i32* %local_buffer_addr_4, align 4
  %tmp1 = add i32 %local_buffer_load_2, %local_buffer_load
  %tmp_7 = add i32 %local_buffer_load_1, %tmp1
  %sext_cast = sext i32 %tmp_7 to i65
  %mul = mul i65 5726623062, %sext_cast
  %neg_mul = sub i65 0, %mul
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_7, i32 31)
  %tmp_28 = call i31 @_ssdm_op_PartSelect.i31.i65.i32.i32(i65 %neg_mul, i32 34, i32 64)
  %tmp_19 = sext i31 %tmp_28 to i32
  %tmp_29 = call i31 @_ssdm_op_PartSelect.i31.i65.i32.i32(i65 %mul, i32 34, i32 64)
  %tmp_20 = sext i31 %tmp_29 to i32
  %tmp_21 = select i1 %tmp_27, i32 %tmp_19, i32 %tmp_20
  %neg_ti = sub i32 0, %tmp_21
  %tmp_8 = select i1 %tmp_27, i32 %neg_ti, i32 %tmp_20
  %tmp_9 = add i13 1024, %tmp_26
  %tmp_9_cast = zext i13 %tmp_9 to i32
  %local_buffer_addr_5 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_9_cast
  store i32 %tmp_8, i32* %local_buffer_addr_5, align 4
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([8 x i8]* @p_str6, i32 %tmp_16) nounwind
  br label %.preheader

; <label>:4                                       ; preds = %.preheader
  %local_buffer_load_3 = load i32* %local_buffer_addr_1, align 4
  %local_buffer_addr_6 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 1
  %local_buffer_load_4 = load i32* %local_buffer_addr_6, align 4
  %tmp_s = add nsw i32 %local_buffer_load_4, %local_buffer_load_3
  %tmp_30 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_s, i32 31)
  %p_neg3 = sub i32 0, %tmp_s
  %p_lshr4 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg3, i32 1, i32 31)
  %tmp_22 = zext i31 %p_lshr4 to i32
  %p_neg_t5 = sub i32 0, %tmp_22
  %p_lshr_f6 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_s, i32 1, i32 31)
  %tmp_23 = zext i31 %p_lshr_f6 to i32
  %tmp_1 = select i1 %tmp_30, i32 %p_neg_t5, i32 %tmp_23
  %local_buffer_addr_7 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 1024
  store i32 %tmp_1, i32* %local_buffer_addr_7, align 4
  %local_buffer_addr_8 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_2
  %local_buffer_load_5 = load i32* %local_buffer_addr_8, align 4
  %tmp_31 = trunc i32 %size_read to i13
  %tmp_5 = add i13 -2, %tmp_31
  %tmp_5_cast = zext i13 %tmp_5 to i32
  %local_buffer_addr_9 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_5_cast
  %local_buffer_load_6 = load i32* %local_buffer_addr_9, align 4
  %tmp_10 = add nsw i32 %local_buffer_load_6, %local_buffer_load_5
  %tmp_32 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_10, i32 31)
  %p_neg = sub i32 0, %tmp_10
  %p_lshr = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg, i32 1, i32 31)
  %tmp_24 = zext i31 %p_lshr to i32
  %p_neg_t = sub i32 0, %tmp_24
  %p_lshr_f = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_10, i32 1, i32 31)
  %tmp_25 = zext i31 %p_lshr_f to i32
  %tmp_11 = select i1 %tmp_32, i32 %p_neg_t, i32 %tmp_25
  %tmp_12 = add i13 1023, %tmp_31
  %tmp_12_cast = zext i13 %tmp_12 to i32
  %local_buffer_addr_10 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_12_cast
  store i32 %tmp_11, i32* %local_buffer_addr_10, align 4
  %out_addr_1_wr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %out_addr, i32 %size_read)
  br label %5

; <label>:5                                       ; preds = %6, %4
  %i2 = phi i31 [ 0, %4 ], [ %i_3, %6 ]
  %i2_cast = zext i31 %i2 to i32
  %tmp_13 = icmp slt i32 %i2_cast, %size_read
  %i_3 = add i31 %i2, 1
  br i1 %tmp_13, label %6, label %7

; <label>:6                                       ; preds = %5
  %tmp_33 = trunc i31 %i2 to i13
  call void (...)* @_ssdm_op_SpecLoopName([13 x i8]* @p_str7) nounwind
  %tmp_17 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str7) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 254, i32 254, i32 254, [1 x i8]* @p_str) nounwind
  %tmp_14 = add i13 1024, %tmp_33
  %tmp_14_cast = sext i13 %tmp_14 to i32
  %local_buffer_addr_11 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_14_cast
  %local_buffer_load_7 = load i32* %local_buffer_addr_11, align 4
  call void @_ssdm_op_Write.m_axi.i32P(i32* %out_addr, i32 %local_buffer_load_7, i4 -1)
  %empty_8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str7, i32 %tmp_17) nounwind
  br label %5

; <label>:7                                       ; preds = %5
  %out_addr_1_wr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %out_addr)
  ret void
}

declare i65 @llvm.part.select.i65(i65, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak i1 @_ssdm_op_WriteResp.m_axi.i32P(i32*) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_WriteReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

define weak void @_ssdm_op_Write.m_axi.i32P(i32*, i32, i4) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecLatency(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

define weak i32 @_ssdm_op_Read.m_axi.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i31 @_ssdm_op_PartSelect.i31.i65.i32.i32(i65, i32, i32) nounwind readnone {
entry:
  %empty = call i65 @llvm.part.select.i65(i65 %0, i32 %1, i32 %2)
  %empty_9 = trunc i65 %empty to i31
  ret i31 %empty_9
}

define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_10 = trunc i32 %empty to i31
  ret i31 %empty_10
}

define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_11 = trunc i32 %empty to i30
  ret i30 %empty_11
}

declare i13 @_ssdm_op_PartSelect.i13.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i13 @_ssdm_op_PartSelect.i13.i31.i32.i32(i31, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_12 = and i32 %0, %empty
  %empty_13 = icmp ne i32 %empty_12, 0
  ret i1 %empty_13
}

declare void @_ssdm_SpecDependence(...) nounwind

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!7}
!axi4.master.portmap = !{!14, !15}
!axi4.slave.bundlemap = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"int*", metadata !"int"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"in", metadata !"out", metadata !"size"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8, [1 x i32]* @llvm_global_ctors_0}
!8 = metadata !{metadata !9}
!9 = metadata !{i32 0, i32 31, metadata !10}
!10 = metadata !{metadata !11}
!11 = metadata !{metadata !"llvm.global_ctors.0", metadata !12, metadata !"", i32 0, i32 31}
!12 = metadata !{metadata !13}
!13 = metadata !{i32 0, i32 0, i32 1}
!14 = metadata !{metadata !"in", metadata !"in_offset", metadata !"READONLY"}
!15 = metadata !{metadata !"out", metadata !"out_offset", metadata !"WRITEONLY"}
!16 = metadata !{metadata !17}
!17 = metadata !{i32 0, i32 31, metadata !18}
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !"out", metadata !12, metadata !"int", i32 0, i32 31}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 31, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"in", metadata !12, metadata !"int", i32 0, i32 31}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 31, metadata !26}
!26 = metadata !{metadata !27}
!27 = metadata !{metadata !"size", metadata !28, metadata !"int", i32 0, i32 31}
!28 = metadata !{metadata !29}
!29 = metadata !{i32 0, i32 0, i32 0}
