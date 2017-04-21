; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu/_sds/vhls/mean_value_accel/solution/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@mean_value_accel_str = internal unnamed_addr constant [17 x i8] c"mean_value_accel\00" ; [#uses=1 type=[17 x i8]*]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@p_str7 = private unnamed_addr constant [13 x i8] c"output_write\00", align 1 ; [#uses=3 type=[13 x i8]*]
@p_str6 = private unnamed_addr constant [8 x i8] c"calc_mv\00", align 1 ; [#uses=3 type=[8 x i8]*]
@p_str5 = private unnamed_addr constant [11 x i8] c"input_read\00", align 1 ; [#uses=3 type=[11 x i8]*]
@p_str4 = private unnamed_addr constant [4 x i8] c"out\00", align 1 ; [#uses=1 type=[4 x i8]*]
@p_str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=2 type=[7 x i8]*]
@p_str2 = private unnamed_addr constant [3 x i8] c"in\00", align 1 ; [#uses=1 type=[3 x i8]*]
@p_str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=2 type=[6 x i8]*]
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=14 type=[1 x i8]*]

; [#uses=0]
define void @mean_value_accel(i32* %in, i32* %out, i32 %in_offset, i32 %out_offset, i32 %size) {
  %size_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %size) ; [#uses=6 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %size_read}, i64 0, metadata !16), !dbg !25 ; [debug line = 56:46] [debug variable = size]
  %out_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %out_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %out_offset_read}, i64 0, metadata !26), !dbg !27 ; [debug line = 56:37] [debug variable = out]
  %in_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %in_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %in_offset_read}, i64 0, metadata !28), !dbg !29 ; [debug line = 56:28] [debug variable = in]
  %out_offset3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %out_offset_read, i32 2, i32 31) ; [#uses=1 type=i30]
  %tmp_6 = zext i30 %out_offset3 to i32           ; [#uses=1 type=i32]
  %out_addr = getelementptr i32* %out, i32 %tmp_6 ; [#uses=3 type=i32*]
  %in_offset1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %in_offset_read, i32 2, i32 31) ; [#uses=1 type=i30]
  %tmp_18 = zext i30 %in_offset1 to i32           ; [#uses=1 type=i32]
  %in_addr = getelementptr i32* %in, i32 %tmp_18  ; [#uses=2 type=i32*]
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out), !map !30
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in), !map !34
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %size) nounwind, !map !38
  call void (...)* @_ssdm_op_SpecTopModule([17 x i8]* @mean_value_accel_str) nounwind
  %local_buffer = alloca [2048 x i32], align 4    ; [#uses=12 type=[2048 x i32]*]
  call void @llvm.dbg.value(metadata !{i32 %in_offset}, i64 0, metadata !28), !dbg !29 ; [debug line = 56:28] [debug variable = in]
  call void @llvm.dbg.value(metadata !{i32 %out_offset}, i64 0, metadata !26), !dbg !27 ; [debug line = 56:37] [debug variable = out]
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !16), !dbg !25 ; [debug line = 56:46] [debug variable = size]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str) nounwind, !dbg !44 ; [debug line = 58:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %in, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [3 x i8]* @p_str2, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !44 ; [debug line = 58:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %out, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [4 x i8]* @p_str4, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !44 ; [debug line = 58:1]
  call void @llvm.dbg.declare(metadata !{[2048 x i32]* %local_buffer}, metadata !46), !dbg !50 ; [debug line = 59:9] [debug variable = local_buffer]
  %in_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %in_addr, i32 %size_read), !dbg !51 ; [#uses=0 type=i1] [debug line = 65:2]
  br label %1, !dbg !54                           ; [debug line = 62:31]

; <label>:1                                       ; preds = %2, %0
  %i = phi i31 [ 0, %0 ], [ %i_1, %2 ]            ; [#uses=2 type=i31]
  %i_cast = zext i31 %i to i32, !dbg !54          ; [#uses=2 type=i32] [debug line = 62:31]
  %tmp = icmp slt i32 %i_cast, %size_read, !dbg !54 ; [#uses=1 type=i1] [debug line = 62:31]
  %i_1 = add i31 %i, 1, !dbg !55                  ; [#uses=1 type=i31] [debug line = 62:44]
  br i1 %tmp, label %2, label %.preheader.preheader, !dbg !54 ; [debug line = 62:31]

.preheader.preheader:                             ; preds = %1
  %tmp_2 = add nsw i32 %size_read, -1, !dbg !56   ; [#uses=2 type=i32] [debug line = 69:28]
  %local_buffer_addr_1 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 0, !dbg !58 ; [#uses=1 type=i32*] [debug line = 71:1]
  br label %.preheader, !dbg !56                  ; [debug line = 69:28]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str5) nounwind, !dbg !60 ; [debug line = 62:49]
  %tmp_15 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str5) nounwind, !dbg !60 ; [#uses=1 type=i32] [debug line = 62:49]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind, !dbg !61 ; [debug line = 63:1]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 256, i32 256, i32 256, [1 x i8]* @p_str) nounwind, !dbg !62 ; [debug line = 64:1]
  %in_addr_read = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %in_addr), !dbg !51 ; [#uses=1 type=i32] [debug line = 65:2]
  %local_buffer_addr = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %i_cast, !dbg !51 ; [#uses=1 type=i32*] [debug line = 65:2]
  store i32 %in_addr_read, i32* %local_buffer_addr, align 4, !dbg !51 ; [debug line = 65:2]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str5, i32 %tmp_15) nounwind, !dbg !63 ; [#uses=0 type=i32] [debug line = 66:5]
  call void @llvm.dbg.value(metadata !{i31 %i_1}, i64 0, metadata !64), !dbg !55 ; [debug line = 62:44] [debug variable = i]
  br label %1, !dbg !55                           ; [debug line = 62:44]

.preheader:                                       ; preds = %3, %.preheader.preheader
  %i1 = phi i31 [ %i_2, %3 ], [ 1, %.preheader.preheader ] ; [#uses=3 type=i31]
  %i1_cast = zext i31 %i1 to i32, !dbg !56        ; [#uses=2 type=i32] [debug line = 69:28]
  %tmp_3 = icmp slt i32 %i1_cast, %tmp_2, !dbg !56 ; [#uses=1 type=i1] [debug line = 69:28]
  br i1 %tmp_3, label %3, label %4, !dbg !56      ; [debug line = 69:28]

; <label>:3                                       ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([8 x i8]* @p_str6) nounwind, !dbg !65 ; [debug line = 69:50]
  %tmp_16 = call i32 (...)* @_ssdm_op_SpecRegionBegin([8 x i8]* @p_str6) nounwind, !dbg !65 ; [#uses=1 type=i32] [debug line = 69:50]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 254, i32 254, i32 254, [1 x i8]* @p_str) nounwind, !dbg !66 ; [debug line = 70:1]
  %tmp_26 = trunc i31 %i1 to i13, !dbg !56        ; [#uses=2 type=i13] [debug line = 69:28]
  %tmp_4 = add i13 -1, %tmp_26, !dbg !67          ; [#uses=1 type=i13] [debug line = 83:9]
  %tmp_4_cast = zext i13 %tmp_4 to i32, !dbg !67  ; [#uses=1 type=i32] [debug line = 83:9]
  %local_buffer_addr_2 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_4_cast, !dbg !67 ; [#uses=1 type=i32*] [debug line = 83:9]
  %local_buffer_load = load i32* %local_buffer_addr_2, align 4, !dbg !67 ; [#uses=1 type=i32] [debug line = 83:9]
  %local_buffer_addr_3 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %i1_cast, !dbg !67 ; [#uses=1 type=i32*] [debug line = 83:9]
  %local_buffer_load_1 = load i32* %local_buffer_addr_3, align 4, !dbg !67 ; [#uses=1 type=i32] [debug line = 83:9]
  %i_2 = add i31 1, %i1, !dbg !67                 ; [#uses=2 type=i31] [debug line = 83:9]
  %i_2_cast = zext i31 %i_2 to i32, !dbg !67      ; [#uses=1 type=i32] [debug line = 83:9]
  %local_buffer_addr_4 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %i_2_cast, !dbg !67 ; [#uses=1 type=i32*] [debug line = 83:9]
  %local_buffer_load_2 = load i32* %local_buffer_addr_4, align 4, !dbg !67 ; [#uses=1 type=i32] [debug line = 83:9]
  %tmp1 = add i32 %local_buffer_load_2, %local_buffer_load, !dbg !67 ; [#uses=1 type=i32] [debug line = 83:9]
  %tmp_7 = add i32 %local_buffer_load_1, %tmp1, !dbg !67 ; [#uses=2 type=i32] [debug line = 83:9]
  %sext_cast = sext i32 %tmp_7 to i65, !dbg !67   ; [#uses=1 type=i65] [debug line = 83:9]
  %mul = mul i65 5726623062, %sext_cast, !dbg !67 ; [#uses=2 type=i65] [debug line = 83:9]
  %neg_mul = sub i65 0, %mul, !dbg !67            ; [#uses=1 type=i65] [debug line = 83:9]
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_7, i32 31), !dbg !67 ; [#uses=2 type=i1] [debug line = 83:9]
  %tmp_28 = call i31 @_ssdm_op_PartSelect.i31.i65.i32.i32(i65 %neg_mul, i32 34, i32 64), !dbg !67 ; [#uses=1 type=i31] [debug line = 83:9]
  %tmp_19 = sext i31 %tmp_28 to i32, !dbg !67     ; [#uses=1 type=i32] [debug line = 83:9]
  %tmp_29 = call i31 @_ssdm_op_PartSelect.i31.i65.i32.i32(i65 %mul, i32 34, i32 64), !dbg !67 ; [#uses=1 type=i31] [debug line = 83:9]
  %tmp_20 = sext i31 %tmp_29 to i32, !dbg !67     ; [#uses=2 type=i32] [debug line = 83:9]
  %tmp_21 = select i1 %tmp_27, i32 %tmp_19, i32 %tmp_20, !dbg !67 ; [#uses=1 type=i32] [debug line = 83:9]
  %neg_ti = sub i32 0, %tmp_21, !dbg !67          ; [#uses=1 type=i32] [debug line = 83:9]
  %tmp_8 = select i1 %tmp_27, i32 %neg_ti, i32 %tmp_20, !dbg !67 ; [#uses=1 type=i32] [debug line = 83:9]
  %tmp_9 = add i13 1024, %tmp_26, !dbg !67        ; [#uses=1 type=i13] [debug line = 83:9]
  %tmp_9_cast = zext i13 %tmp_9 to i32, !dbg !67  ; [#uses=1 type=i32] [debug line = 83:9]
  %local_buffer_addr_5 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_9_cast, !dbg !67 ; [#uses=1 type=i32*] [debug line = 83:9]
  store i32 %tmp_8, i32* %local_buffer_addr_5, align 4, !dbg !67 ; [debug line = 83:9]
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([8 x i8]* @p_str6, i32 %tmp_16) nounwind, !dbg !68 ; [#uses=0 type=i32] [debug line = 85:5]
  call void @llvm.dbg.value(metadata !{i31 %i_2}, i64 0, metadata !69), !dbg !70 ; [debug line = 69:44] [debug variable = i]
  br label %.preheader, !dbg !70                  ; [debug line = 69:44]

; <label>:4                                       ; preds = %.preheader
  %local_buffer_load_3 = load i32* %local_buffer_addr_1, align 4, !dbg !71 ; [#uses=1 type=i32] [debug line = 88:5]
  %local_buffer_addr_6 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 1, !dbg !71 ; [#uses=1 type=i32*] [debug line = 88:5]
  %local_buffer_load_4 = load i32* %local_buffer_addr_6, align 4, !dbg !71 ; [#uses=1 type=i32] [debug line = 88:5]
  %tmp_s = add nsw i32 %local_buffer_load_4, %local_buffer_load_3, !dbg !71 ; [#uses=3 type=i32] [debug line = 88:5]
  %tmp_30 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_s, i32 31), !dbg !71 ; [#uses=1 type=i1] [debug line = 88:5]
  %p_neg3 = sub i32 0, %tmp_s, !dbg !71           ; [#uses=1 type=i32] [debug line = 88:5]
  %p_lshr4 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg3, i32 1, i32 31), !dbg !71 ; [#uses=1 type=i31] [debug line = 88:5]
  %tmp_22 = zext i31 %p_lshr4 to i32, !dbg !71    ; [#uses=1 type=i32] [debug line = 88:5]
  %p_neg_t5 = sub i32 0, %tmp_22, !dbg !71        ; [#uses=1 type=i32] [debug line = 88:5]
  %p_lshr_f6 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_s, i32 1, i32 31), !dbg !71 ; [#uses=1 type=i31] [debug line = 88:5]
  %tmp_23 = zext i31 %p_lshr_f6 to i32, !dbg !71  ; [#uses=1 type=i32] [debug line = 88:5]
  %tmp_1 = select i1 %tmp_30, i32 %p_neg_t5, i32 %tmp_23, !dbg !71 ; [#uses=1 type=i32] [debug line = 88:5]
  %local_buffer_addr_7 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 1024, !dbg !71 ; [#uses=1 type=i32*] [debug line = 88:5]
  store i32 %tmp_1, i32* %local_buffer_addr_7, align 4, !dbg !71 ; [debug line = 88:5]
  %local_buffer_addr_8 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_2, !dbg !72 ; [#uses=1 type=i32*] [debug line = 89:5]
  %local_buffer_load_5 = load i32* %local_buffer_addr_8, align 4, !dbg !72 ; [#uses=1 type=i32] [debug line = 89:5]
  %tmp_31 = trunc i32 %size_read to i13, !dbg !72 ; [#uses=2 type=i13] [debug line = 89:5]
  %tmp_5 = add i13 -2, %tmp_31, !dbg !72          ; [#uses=1 type=i13] [debug line = 89:5]
  %tmp_5_cast = zext i13 %tmp_5 to i32, !dbg !72  ; [#uses=1 type=i32] [debug line = 89:5]
  %local_buffer_addr_9 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_5_cast, !dbg !72 ; [#uses=1 type=i32*] [debug line = 89:5]
  %local_buffer_load_6 = load i32* %local_buffer_addr_9, align 4, !dbg !72 ; [#uses=1 type=i32] [debug line = 89:5]
  %tmp_10 = add nsw i32 %local_buffer_load_6, %local_buffer_load_5, !dbg !72 ; [#uses=3 type=i32] [debug line = 89:5]
  %tmp_32 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %tmp_10, i32 31), !dbg !72 ; [#uses=1 type=i1] [debug line = 89:5]
  %p_neg = sub i32 0, %tmp_10, !dbg !72           ; [#uses=1 type=i32] [debug line = 89:5]
  %p_lshr = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %p_neg, i32 1, i32 31), !dbg !72 ; [#uses=1 type=i31] [debug line = 89:5]
  %tmp_24 = zext i31 %p_lshr to i32, !dbg !72     ; [#uses=1 type=i32] [debug line = 89:5]
  %p_neg_t = sub i32 0, %tmp_24, !dbg !72         ; [#uses=1 type=i32] [debug line = 89:5]
  %p_lshr_f = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %tmp_10, i32 1, i32 31), !dbg !72 ; [#uses=1 type=i31] [debug line = 89:5]
  %tmp_25 = zext i31 %p_lshr_f to i32, !dbg !72   ; [#uses=1 type=i32] [debug line = 89:5]
  %tmp_11 = select i1 %tmp_32, i32 %p_neg_t, i32 %tmp_25, !dbg !72 ; [#uses=1 type=i32] [debug line = 89:5]
  %tmp_12 = add i13 1023, %tmp_31, !dbg !72       ; [#uses=1 type=i13] [debug line = 89:5]
  %tmp_12_cast = zext i13 %tmp_12 to i32, !dbg !72 ; [#uses=1 type=i32] [debug line = 89:5]
  %local_buffer_addr_10 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_12_cast, !dbg !72 ; [#uses=1 type=i32*] [debug line = 89:5]
  store i32 %tmp_11, i32* %local_buffer_addr_10, align 4, !dbg !72 ; [debug line = 89:5]
  %out_addr_1_wr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %out_addr, i32 %size_read), !dbg !73 ; [#uses=0 type=i1] [debug line = 96:2]
  br label %5, !dbg !76                           ; [debug line = 93:33]

; <label>:5                                       ; preds = %6, %4
  %i2 = phi i31 [ 0, %4 ], [ %i_3, %6 ]           ; [#uses=3 type=i31]
  %i2_cast = zext i31 %i2 to i32, !dbg !76        ; [#uses=1 type=i32] [debug line = 93:33]
  %tmp_13 = icmp slt i32 %i2_cast, %size_read, !dbg !76 ; [#uses=1 type=i1] [debug line = 93:33]
  %i_3 = add i31 %i2, 1, !dbg !77                 ; [#uses=1 type=i31] [debug line = 93:46]
  br i1 %tmp_13, label %6, label %7, !dbg !76     ; [debug line = 93:33]

; <label>:6                                       ; preds = %5
  %tmp_33 = trunc i31 %i2 to i13, !dbg !76        ; [#uses=1 type=i13] [debug line = 93:33]
  call void (...)* @_ssdm_op_SpecLoopName([13 x i8]* @p_str7) nounwind, !dbg !78 ; [debug line = 93:51]
  %tmp_17 = call i32 (...)* @_ssdm_op_SpecRegionBegin([13 x i8]* @p_str7) nounwind, !dbg !78 ; [#uses=1 type=i32] [debug line = 93:51]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind, !dbg !79 ; [debug line = 94:1]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 254, i32 254, i32 254, [1 x i8]* @p_str) nounwind, !dbg !80 ; [debug line = 95:1]
  %tmp_14 = add i13 1024, %tmp_33, !dbg !73       ; [#uses=1 type=i13] [debug line = 96:2]
  %tmp_14_cast = sext i13 %tmp_14 to i32, !dbg !73 ; [#uses=1 type=i32] [debug line = 96:2]
  %local_buffer_addr_11 = getelementptr inbounds [2048 x i32]* %local_buffer, i32 0, i32 %tmp_14_cast, !dbg !73 ; [#uses=1 type=i32*] [debug line = 96:2]
  %local_buffer_load_7 = load i32* %local_buffer_addr_11, align 4, !dbg !73 ; [#uses=1 type=i32] [debug line = 96:2]
  call void @_ssdm_op_Write.m_axi.i32P(i32* %out_addr, i32 %local_buffer_load_7, i4 -1), !dbg !73 ; [debug line = 96:2]
  %empty_8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([13 x i8]* @p_str7, i32 %tmp_17) nounwind, !dbg !81 ; [#uses=0 type=i32] [debug line = 97:5]
  call void @llvm.dbg.value(metadata !{i31 %i_3}, i64 0, metadata !82), !dbg !77 ; [debug line = 93:46] [debug variable = i]
  br label %5, !dbg !77                           ; [debug line = 93:46]

; <label>:7                                       ; preds = %5
  %out_addr_1_wr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %out_addr), !dbg !73 ; [#uses=0 type=i1] [debug line = 96:2]
  ret void, !dbg !83                              ; [debug line = 98:1]
}

; [#uses=1]
declare i65 @llvm.part.select.i65(i65, i32, i32) nounwind readnone

; [#uses=2]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define weak i1 @_ssdm_op_WriteResp.m_axi.i32P(i32*) {
entry:
  ret i1 true
}

; [#uses=1]
define weak i1 @_ssdm_op_WriteReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

; [#uses=1]
define weak void @_ssdm_op_Write.m_axi.i32P(i32*, i32, i4) {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecLatency(...) nounwind {
entry:
  ret void
}

; [#uses=2]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

; [#uses=1]
define weak i32 @_ssdm_op_Read.m_axi.i32P(i32*) {
entry:
  %empty = load i32* %0                           ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=3]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=2]
define weak i31 @_ssdm_op_PartSelect.i31.i65.i32.i32(i65, i32, i32) nounwind readnone {
entry:
  %empty = call i65 @llvm.part.select.i65(i65 %0, i32 %1, i32 %2) ; [#uses=1 type=i65]
  %empty_9 = trunc i65 %empty to i31              ; [#uses=1 type=i31]
  ret i31 %empty_9
}

; [#uses=4]
define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_10 = trunc i32 %empty to i31             ; [#uses=1 type=i31]
  ret i31 %empty_10
}

; [#uses=2]
define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_11 = trunc i32 %empty to i30             ; [#uses=1 type=i30]
  ret i30 %empty_11
}

; [#uses=0]
declare i13 @_ssdm_op_PartSelect.i13.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i13 @_ssdm_op_PartSelect.i13.i31.i32.i32(i31, i32, i32) nounwind readnone

; [#uses=3]
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1                          ; [#uses=1 type=i32]
  %empty_12 = and i32 %0, %empty                  ; [#uses=1 type=i32]
  %empty_13 = icmp ne i32 %empty_12, 0            ; [#uses=1 type=i1]
  ret i1 %empty_13
}

; [#uses=0]
declare void @_ssdm_SpecDependence(...) nounwind

; [#uses=1]
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
!16 = metadata !{i32 786689, metadata !17, metadata !"size", metadata !18, i32 50331704, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!17 = metadata !{i32 786478, i32 0, metadata !18, metadata !"mean_value_accel", metadata !"mean_value_accel", metadata !"_Z16mean_value_accelPiS_i", metadata !18, i32 56, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !23, i32 57} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 786473, metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/mean_value.cpp", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!19 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{null, metadata !21, metadata !21, metadata !22}
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!25 = metadata !{i32 56, i32 46, metadata !17, null}
!26 = metadata !{i32 786689, metadata !17, metadata !"out", metadata !18, i32 33554488, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!27 = metadata !{i32 56, i32 37, metadata !17, null}
!28 = metadata !{i32 786689, metadata !17, metadata !"in", metadata !18, i32 16777272, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!29 = metadata !{i32 56, i32 28, metadata !17, null}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 31, metadata !32}
!32 = metadata !{metadata !33}
!33 = metadata !{metadata !"out", metadata !12, metadata !"int", i32 0, i32 31}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 0, i32 31, metadata !36}
!36 = metadata !{metadata !37}
!37 = metadata !{metadata !"in", metadata !12, metadata !"int", i32 0, i32 31}
!38 = metadata !{metadata !39}
!39 = metadata !{i32 0, i32 31, metadata !40}
!40 = metadata !{metadata !41}
!41 = metadata !{metadata !"size", metadata !42, metadata !"int", i32 0, i32 31}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 0, i32 0, i32 0}
!44 = metadata !{i32 58, i32 1, metadata !45, null}
!45 = metadata !{i32 786443, metadata !17, i32 57, i32 1, metadata !18, i32 0} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 786688, metadata !45, metadata !"local_buffer", metadata !18, i32 59, metadata !47, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!47 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 65536, i64 32, i32 0, i32 0, metadata !22, metadata !48, i32 0, i32 0} ; [ DW_TAG_array_type ]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786465, i64 0, i64 2047}     ; [ DW_TAG_subrange_type ]
!50 = metadata !{i32 59, i32 9, metadata !45, null}
!51 = metadata !{i32 65, i32 2, metadata !52, null}
!52 = metadata !{i32 786443, metadata !53, i32 62, i32 48, metadata !18, i32 2} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 786443, metadata !45, i32 62, i32 16, metadata !18, i32 1} ; [ DW_TAG_lexical_block ]
!54 = metadata !{i32 62, i32 31, metadata !53, null}
!55 = metadata !{i32 62, i32 44, metadata !53, null}
!56 = metadata !{i32 69, i32 28, metadata !57, null}
!57 = metadata !{i32 786443, metadata !45, i32 69, i32 13, metadata !18, i32 3} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 71, i32 1, metadata !59, null}
!59 = metadata !{i32 786443, metadata !57, i32 69, i32 49, metadata !18, i32 4} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 62, i32 49, metadata !52, null}
!61 = metadata !{i32 63, i32 1, metadata !52, null}
!62 = metadata !{i32 64, i32 1, metadata !52, null}
!63 = metadata !{i32 66, i32 5, metadata !52, null}
!64 = metadata !{i32 786688, metadata !53, metadata !"i", metadata !18, i32 62, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 69, i32 50, metadata !59, null}
!66 = metadata !{i32 70, i32 1, metadata !59, null}
!67 = metadata !{i32 83, i32 9, metadata !59, null}
!68 = metadata !{i32 85, i32 5, metadata !59, null}
!69 = metadata !{i32 786688, metadata !57, metadata !"i", metadata !18, i32 69, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!70 = metadata !{i32 69, i32 44, metadata !57, null}
!71 = metadata !{i32 88, i32 5, metadata !45, null}
!72 = metadata !{i32 89, i32 5, metadata !45, null}
!73 = metadata !{i32 96, i32 2, metadata !74, null}
!74 = metadata !{i32 786443, metadata !75, i32 93, i32 50, metadata !18, i32 6} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 786443, metadata !45, i32 93, i32 18, metadata !18, i32 5} ; [ DW_TAG_lexical_block ]
!76 = metadata !{i32 93, i32 33, metadata !75, null}
!77 = metadata !{i32 93, i32 46, metadata !75, null}
!78 = metadata !{i32 93, i32 51, metadata !74, null}
!79 = metadata !{i32 94, i32 1, metadata !74, null}
!80 = metadata !{i32 95, i32 1, metadata !74, null}
!81 = metadata !{i32 97, i32 5, metadata !74, null}
!82 = metadata !{i32 786688, metadata !75, metadata !"i", metadata !18, i32 93, metadata !22, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!83 = metadata !{i32 98, i32 1, metadata !45, null}
