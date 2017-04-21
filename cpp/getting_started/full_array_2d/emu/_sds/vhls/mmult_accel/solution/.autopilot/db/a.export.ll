; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@mmult_accel_str = internal unnamed_addr constant [12 x i8] c"mmult_accel\00"
@p_str9 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str8 = private unnamed_addr constant [12 x i8] c"matrix_mult\00", align 1
@p_str7 = private unnamed_addr constant [12 x i8] c"read_data_b\00", align 1
@p_str6 = private unnamed_addr constant [12 x i8] c"read_data_a\00", align 1
@p_str5 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@p_str4 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@p_str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1
@p_str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@p_str11 = private unnamed_addr constant [11 x i8] c"write_data\00", align 1
@p_str10 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1
@p_str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @mmult_accel(i32* %a, i32* %b, i32* %c, i32 %a_offset, i32 %b_offset, i32 %c_offset, i32 %size) {
  %size_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %size)
  %c_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %c_offset)
  %b_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %b_offset)
  %a_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_offset)
  %c_offset5 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %c_offset_read, i32 2, i32 31)
  %tmp_14 = zext i30 %c_offset5 to i32
  %c_addr = getelementptr i32* %c, i32 %tmp_14
  %b_offset3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %b_offset_read, i32 2, i32 31)
  %tmp_15 = zext i30 %b_offset3 to i32
  %b_addr = getelementptr i32* %b, i32 %tmp_15
  %a_offset1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %a_offset_read, i32 2, i32 31)
  %tmp_16 = zext i30 %a_offset1 to i32
  %a_addr = getelementptr i32* %a, i32 %tmp_16
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %c), !map !10
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %b), !map !16
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %a), !map !20
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %size) nounwind, !map !24
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @mmult_accel_str) nounwind
  %bufa = alloca [65536 x i32], align 4
  %bufb = alloca [65536 x i32], align 4
  %bufc = alloca [65536 x i32], align 4
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %a, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [2 x i8]* @p_str2, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %c, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [2 x i8]* @p_str4, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %b, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [2 x i8]* @p_str5, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %matrix_size = mul nsw i32 %size_read, %size_read
  %tmp = add nsw i32 %size_read, -1
  %a_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %a_addr, i32 %matrix_size)
  br label %1

; <label>:1                                       ; preds = %2, %0
  %i = phi i31 [ 0, %0 ], [ %i_1, %2 ]
  %y = phi i17 [ 0, %0 ], [ %y_1, %2 ]
  %x = phi i17 [ 0, %0 ], [ %x_1, %2 ]
  %i_cast = zext i31 %i to i32
  %y_cast = zext i17 %y to i32
  %y_cast_cast = zext i17 %y to i18
  %tmp_17 = trunc i17 %x to i10
  %tmp_18_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_17, i8 0)
  %tmp_18 = add i18 %tmp_18_cast, %y_cast_cast
  %tmp_19_cast = zext i18 %tmp_18 to i32
  %bufa_addr = getelementptr [65536 x i32]* %bufa, i32 0, i32 %tmp_19_cast
  %tmp_1 = icmp slt i32 %i_cast, %matrix_size
  %i_1 = add i31 1, %i
  br i1 %tmp_1, label %2, label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %1
  %b_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %b_addr, i32 %matrix_size)
  br label %.preheader3

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @p_str6) nounwind
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str6) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @p_str) nounwind
  %tmpData_a = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %a_addr)
  store i32 %tmpData_a, i32* %bufa_addr, align 4
  %tmp_2 = icmp eq i32 %y_cast, %tmp
  %x_2 = add i17 %x, 1
  %y_2 = add i17 %y, 1
  %y_1 = select i1 %tmp_2, i17 0, i17 %y_2
  %x_1 = select i1 %tmp_2, i17 %x_2, i17 %x
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str6, i32 %tmp_8) nounwind
  br label %1

.preheader3:                                      ; preds = %.preheader3.preheader, %3
  %y3 = phi i17 [ %y_4, %3 ], [ 0, %.preheader3.preheader ]
  %x2 = phi i17 [ %x_4, %3 ], [ 0, %.preheader3.preheader ]
  %i1 = phi i31 [ %i_2, %3 ], [ 0, %.preheader3.preheader ]
  %y3_cast = zext i17 %y3 to i32
  %y3_cast_cast = zext i17 %y3 to i18
  %tmp_19 = trunc i17 %x2 to i10
  %tmp_21_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_19, i8 0)
  %tmp_20 = add i18 %tmp_21_cast, %y3_cast_cast
  %tmp_22_cast = zext i18 %tmp_20 to i32
  %bufb_addr = getelementptr [65536 x i32]* %bufb, i32 0, i32 %tmp_22_cast
  %i1_cast = zext i31 %i1 to i32
  %tmp_6 = icmp slt i32 %i1_cast, %matrix_size
  %i_2 = add i31 1, %i1
  br i1 %tmp_6, label %3, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader3
  br label %.preheader2

; <label>:3                                       ; preds = %.preheader3
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @p_str7) nounwind
  %tmp_9 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str7) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @p_str) nounwind
  %tmpData_b = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %b_addr)
  store i32 %tmpData_b, i32* %bufb_addr, align 4
  %tmp_7 = icmp eq i32 %y3_cast, %tmp
  %x_3 = add i17 %x2, 1
  %y_3 = add i17 %y3, 1
  %y_4 = select i1 %tmp_7, i17 0, i17 %y_3
  %x_4 = select i1 %tmp_7, i17 %x_3, i17 %x2
  %empty_5 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str7, i32 %tmp_9) nounwind
  br label %.preheader3

.preheader2:                                      ; preds = %.preheader2.preheader, %10
  %row = phi i31 [ %row_1, %10 ], [ 0, %.preheader2.preheader ]
  %row_cast = zext i31 %row to i32
  %tmp_21 = trunc i31 %row to i10
  %tmp_24_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_21, i8 0)
  %tmp_s = icmp slt i32 %row_cast, %size_read
  %row_1 = add i31 1, %row
  br i1 %tmp_s, label %4, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader2
  %c_addr_1_wr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %c_addr, i32 %matrix_size)
  br label %.preheader

; <label>:4                                       ; preds = %.preheader2
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @p_str8) nounwind
  %tmp_10 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str8) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @p_str) nounwind
  br label %5

; <label>:5                                       ; preds = %9, %4
  %col = phi i17 [ 0, %4 ], [ %col_1, %9 ]
  %col_cast = zext i17 %col to i32
  %col_cast_cast = zext i17 %col to i18
  %tmp_22 = add i18 %tmp_24_cast, %col_cast_cast
  %tmp_25_cast = zext i18 %tmp_22 to i32
  %bufc_addr_1 = getelementptr [65536 x i32]* %bufc, i32 0, i32 %tmp_25_cast
  %exitcond1 = icmp eq i32 %col_cast, %size_read
  %col_1 = add i17 %col, 1
  br i1 %exitcond1, label %10, label %6

; <label>:6                                       ; preds = %5
  %tmp_12 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str9) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @p_str) nounwind
  br label %7

; <label>:7                                       ; preds = %8, %6
  %result = phi i32 [ 0, %6 ], [ %result_1, %8 ]
  %k = phi i32 [ 0, %6 ], [ %k_1, %8 ]
  %tmp_26 = trunc i32 %k to i18
  %tmp_27 = add i18 %tmp_26, %tmp_24_cast
  %tmp_29_cast = zext i18 %tmp_27 to i32
  %bufa_addr_1 = getelementptr [65536 x i32]* %bufa, i32 0, i32 %tmp_29_cast
  %tmp_28 = trunc i32 %k to i10
  %tmp_31_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_28, i8 0)
  %tmp_29 = add i18 %col_cast_cast, %tmp_31_cast
  %tmp_32_cast = zext i18 %tmp_29 to i32
  %bufb_addr_1 = getelementptr [65536 x i32]* %bufb, i32 0, i32 %tmp_32_cast
  %exitcond = icmp eq i32 %k, %size_read
  %k_1 = add nsw i32 1, %k
  br i1 %exitcond, label %9, label %8

; <label>:8                                       ; preds = %7
  %tmp_13 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str10) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind
  %bufa_load = load i32* %bufa_addr_1, align 4
  %bufb_load = load i32* %bufb_addr_1, align 4
  %tmp_5 = mul nsw i32 %bufb_load, %bufa_load
  %result_1 = add nsw i32 %tmp_5, %result
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str10, i32 %tmp_13) nounwind
  br label %7

; <label>:9                                       ; preds = %7
  store i32 %result, i32* %bufc_addr_1, align 4
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str9, i32 %tmp_12) nounwind
  br label %5

; <label>:10                                      ; preds = %5
  %empty_8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str8, i32 %tmp_10) nounwind
  br label %.preheader2

.preheader:                                       ; preds = %.preheader.preheader, %11
  %m = phi i32 [ %m_1, %11 ], [ 0, %.preheader.preheader ]
  %n = phi i32 [ %n_1, %11 ], [ 0, %.preheader.preheader ]
  %i4 = phi i31 [ %i_3, %11 ], [ 0, %.preheader.preheader ]
  %tmp_23 = trunc i32 %n to i18
  %tmp_24 = trunc i32 %m to i10
  %tmp_27_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_24, i8 0)
  %tmp_25 = add i18 %tmp_23, %tmp_27_cast
  %tmp_28_cast = zext i18 %tmp_25 to i32
  %bufc_addr = getelementptr [65536 x i32]* %bufc, i32 0, i32 %tmp_28_cast
  %i4_cast = zext i31 %i4 to i32
  %tmp_3 = icmp slt i32 %i4_cast, %matrix_size
  %i_3 = add i31 1, %i4
  br i1 %tmp_3, label %11, label %12

; <label>:11                                      ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str11) nounwind
  %tmp_11 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str11) nounwind
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @p_str) nounwind
  %tmpData_c = load i32* %bufc_addr, align 4
  call void @_ssdm_op_Write.m_axi.i32P(i32* %c_addr, i32 %tmpData_c, i4 -1)
  %tmp_4 = icmp eq i32 %n, %tmp
  %m_2 = add nsw i32 %m, 1
  %n_2 = add nsw i32 %n, 1
  %m_1 = select i1 %tmp_4, i32 %m_2, i32 %m
  %n_1 = select i1 %tmp_4, i32 0, i32 %n_2
  %empty_9 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str11, i32 %tmp_11) nounwind
  br label %.preheader

; <label>:12                                      ; preds = %.preheader
  %c_addr_1_wr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %c_addr)
  ret void
}

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

define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_10 = trunc i32 %empty to i30
  ret i30 %empty_10
}

declare i18 @_ssdm_op_PartSelect.i18.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i10 @_ssdm_op_PartSelect.i10.i31.i32.i32(i31, i32, i32) nounwind readnone

declare i10 @_ssdm_op_PartSelect.i10.i17.i32.i32(i17, i32, i32) nounwind readnone

define weak i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10, i8) nounwind readnone {
entry:
  %empty = zext i10 %0 to i18
  %empty_11 = zext i8 %1 to i18
  %empty_12 = shl i18 %empty, 8
  %empty_13 = or i18 %empty_12, %empty_11
  ret i18 %empty_13
}

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}
!axi4.master.portmap = !{!7, !8, !9}
!axi4.slave.bundlemap = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 0}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"int*", metadata !"int*", metadata !"int"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"a", metadata !"b", metadata !"c", metadata !"size"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !"a", metadata !"a_offset", metadata !"READONLY"}
!8 = metadata !{metadata !"b", metadata !"b_offset", metadata !"READONLY"}
!9 = metadata !{metadata !"c", metadata !"c_offset", metadata !"WRITEONLY"}
!10 = metadata !{metadata !11}
!11 = metadata !{i32 0, i32 31, metadata !12}
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !"c", metadata !14, metadata !"int", i32 0, i32 31}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 0, i32 1}
!16 = metadata !{metadata !17}
!17 = metadata !{i32 0, i32 31, metadata !18}
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !"b", metadata !14, metadata !"int", i32 0, i32 31}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 31, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"a", metadata !14, metadata !"int", i32 0, i32 31}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 31, metadata !26}
!26 = metadata !{metadata !27}
!27 = metadata !{metadata !"size", metadata !28, metadata !"int", i32 0, i32 31}
!28 = metadata !{metadata !29}
!29 = metadata !{i32 0, i32 0, i32 0}
