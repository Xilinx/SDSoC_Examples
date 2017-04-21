; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@mmult_accel_str = internal unnamed_addr constant [12 x i8] c"mmult_accel\00" ; [#uses=1 type=[12 x i8]*]
@p_str9 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=2 type=[12 x i8]*]
@p_str8 = private unnamed_addr constant [12 x i8] c"matrix_mult\00", align 1 ; [#uses=3 type=[12 x i8]*]
@p_str7 = private unnamed_addr constant [12 x i8] c"read_data_b\00", align 1 ; [#uses=3 type=[12 x i8]*]
@p_str6 = private unnamed_addr constant [12 x i8] c"read_data_a\00", align 1 ; [#uses=3 type=[12 x i8]*]
@p_str5 = private unnamed_addr constant [2 x i8] c"b\00", align 1 ; [#uses=1 type=[2 x i8]*]
@p_str4 = private unnamed_addr constant [2 x i8] c"c\00", align 1 ; [#uses=1 type=[2 x i8]*]
@p_str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=3 type=[7 x i8]*]
@p_str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1 ; [#uses=1 type=[2 x i8]*]
@p_str11 = private unnamed_addr constant [11 x i8] c"write_data\00", align 1 ; [#uses=3 type=[11 x i8]*]
@p_str10 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=2 type=[12 x i8]*]
@p_str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=3 type=[6 x i8]*]
@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=20 type=[1 x i8]*]

; [#uses=0]
define void @mmult_accel(i32* %a, i32* %b, i32* %c, i32 %a_offset, i32 %b_offset, i32 %c_offset, i32 %size) {
  %size_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %size) ; [#uses=6 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %size_read}, i64 0, metadata !10), !dbg !19 ; [debug line = 51:46] [debug variable = size]
  %c_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %c_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %c_offset_read}, i64 0, metadata !20), !dbg !21 ; [debug line = 51:39] [debug variable = c]
  %b_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %b_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %b_offset_read}, i64 0, metadata !22), !dbg !23 ; [debug line = 51:31] [debug variable = b]
  %a_offset_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_offset) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %a_offset_read}, i64 0, metadata !24), !dbg !25 ; [debug line = 51:23] [debug variable = a]
  %c_offset5 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %c_offset_read, i32 2, i32 31) ; [#uses=1 type=i30]
  %tmp_14 = zext i30 %c_offset5 to i32            ; [#uses=1 type=i32]
  %c_addr = getelementptr i32* %c, i32 %tmp_14    ; [#uses=3 type=i32*]
  %b_offset3 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %b_offset_read, i32 2, i32 31) ; [#uses=1 type=i30]
  %tmp_15 = zext i30 %b_offset3 to i32            ; [#uses=1 type=i32]
  %b_addr = getelementptr i32* %b, i32 %tmp_15    ; [#uses=2 type=i32*]
  %a_offset1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %a_offset_read, i32 2, i32 31) ; [#uses=1 type=i30]
  %tmp_16 = zext i30 %a_offset1 to i32            ; [#uses=1 type=i32]
  %a_addr = getelementptr i32* %a, i32 %tmp_16    ; [#uses=2 type=i32*]
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %c), !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %b), !map !32
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %a), !map !36
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %size) nounwind, !map !40
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @mmult_accel_str) nounwind
  %bufa = alloca [65536 x i32], align 4           ; [#uses=2 type=[65536 x i32]*]
  %bufb = alloca [65536 x i32], align 4           ; [#uses=2 type=[65536 x i32]*]
  %bufc = alloca [65536 x i32], align 4           ; [#uses=2 type=[65536 x i32]*]
  call void @llvm.dbg.value(metadata !{i32 %a_offset}, i64 0, metadata !24), !dbg !25 ; [debug line = 51:23] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %b_offset}, i64 0, metadata !22), !dbg !23 ; [debug line = 51:31] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32 %c_offset}, i64 0, metadata !20), !dbg !21 ; [debug line = 51:39] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !10), !dbg !19 ; [debug line = 51:46] [debug variable = size]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @p_str) nounwind, !dbg !46 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %a, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [2 x i8]* @p_str2, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !46 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %c, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [2 x i8]* @p_str4, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !46 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %b, [6 x i8]* @p_str1, i32 0, i32 0, [1 x i8]* @p_str, i32 0, i32 0, [2 x i8]* @p_str5, [7 x i8]* @p_str3, [1 x i8]* @p_str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !46 ; [debug line = 52:1]
  call void @llvm.dbg.declare(metadata !{[65536 x i32]* %bufa}, metadata !48), !dbg !52 ; [debug line = 53:6] [debug variable = bufa]
  call void @llvm.dbg.declare(metadata !{[65536 x i32]* %bufb}, metadata !53), !dbg !54 ; [debug line = 53:22] [debug variable = bufb]
  call void @llvm.dbg.declare(metadata !{[65536 x i32]* %bufc}, metadata !55), !dbg !56 ; [debug line = 53:38] [debug variable = bufc]
  %matrix_size = mul nsw i32 %size_read, %size_read, !dbg !57 ; [#uses=6 type=i32] [debug line = 54:29]
  call void @llvm.dbg.value(metadata !{i32 %matrix_size}, i64 0, metadata !58), !dbg !57 ; [debug line = 54:29] [debug variable = matrix_size]
  %tmp = add nsw i32 %size_read, -1, !dbg !59     ; [#uses=3 type=i32] [debug line = 62:3]
  %a_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %a_addr, i32 %matrix_size), !dbg !62 ; [#uses=0 type=i1] [debug line = 60:22]
  br label %1, !dbg !63                           ; [debug line = 58:30]

; <label>:1                                       ; preds = %2, %0
  %i = phi i31 [ 0, %0 ], [ %i_1, %2 ]            ; [#uses=2 type=i31]
  %y = phi i17 [ 0, %0 ], [ %y_1, %2 ]            ; [#uses=3 type=i17]
  %x = phi i17 [ 0, %0 ], [ %x_1, %2 ]            ; [#uses=3 type=i17]
  %i_cast = zext i31 %i to i32, !dbg !63          ; [#uses=1 type=i32] [debug line = 58:30]
  %y_cast = zext i17 %y to i32, !dbg !63          ; [#uses=1 type=i32] [debug line = 58:30]
  %y_cast_cast = zext i17 %y to i18               ; [#uses=1 type=i18]
  %tmp_17 = trunc i17 %x to i10                   ; [#uses=1 type=i10]
  %tmp_18_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_17, i8 0), !dbg !64 ; [#uses=1 type=i18] [debug line = 61:3]
  %tmp_18 = add i18 %tmp_18_cast, %y_cast_cast, !dbg !64 ; [#uses=1 type=i18] [debug line = 61:3]
  %tmp_19_cast = zext i18 %tmp_18 to i32, !dbg !64 ; [#uses=1 type=i32] [debug line = 61:3]
  %bufa_addr = getelementptr [65536 x i32]* %bufa, i32 0, i32 %tmp_19_cast, !dbg !64 ; [#uses=1 type=i32*] [debug line = 61:3]
  %tmp_1 = icmp slt i32 %i_cast, %matrix_size, !dbg !63 ; [#uses=1 type=i1] [debug line = 58:30]
  %i_1 = add i31 1, %i, !dbg !65                  ; [#uses=1 type=i31] [debug line = 58:50]
  br i1 %tmp_1, label %2, label %.preheader3.preheader, !dbg !63 ; [debug line = 58:30]

.preheader3.preheader:                            ; preds = %1
  %b_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %b_addr, i32 %matrix_size), !dbg !66 ; [#uses=0 type=i1] [debug line = 74:22]
  br label %.preheader3, !dbg !69                 ; [debug line = 72:39]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @p_str6) nounwind, !dbg !70 ; [debug line = 58:55]
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str6) nounwind, !dbg !70 ; [#uses=1 type=i32] [debug line = 58:55]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @p_str) nounwind, !dbg !71 ; [debug line = 59:1]
  %tmpData_a = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %a_addr), !dbg !62 ; [#uses=1 type=i32] [debug line = 60:22]
  call void @llvm.dbg.value(metadata !{i32 %tmpData_a}, i64 0, metadata !72), !dbg !62 ; [debug line = 60:22] [debug variable = tmpData_a]
  store i32 %tmpData_a, i32* %bufa_addr, align 4, !dbg !64 ; [debug line = 61:3]
  %tmp_2 = icmp eq i32 %y_cast, %tmp, !dbg !59    ; [#uses=2 type=i1] [debug line = 62:3]
  %x_2 = add i17 %x, 1, !dbg !73                  ; [#uses=1 type=i17] [debug line = 63:4]
  call void @llvm.dbg.value(metadata !{i17 %x_2}, i64 0, metadata !75), !dbg !73 ; [debug line = 63:4] [debug variable = x]
  %y_2 = add i17 %y, 1, !dbg !76                  ; [#uses=1 type=i17] [debug line = 66:4]
  call void @llvm.dbg.value(metadata !{i17 %y_2}, i64 0, metadata !78), !dbg !76 ; [debug line = 66:4] [debug variable = y]
  %y_1 = select i1 %tmp_2, i17 0, i17 %y_2, !dbg !59 ; [#uses=1 type=i17] [debug line = 62:3]
  call void @llvm.dbg.value(metadata !{i17 %y_1}, i64 0, metadata !78), !dbg !59 ; [debug line = 62:3] [debug variable = y]
  %x_1 = select i1 %tmp_2, i17 %x_2, i17 %x, !dbg !59 ; [#uses=1 type=i17] [debug line = 62:3]
  call void @llvm.dbg.value(metadata !{i17 %x_1}, i64 0, metadata !75), !dbg !59 ; [debug line = 62:3] [debug variable = x]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str6, i32 %tmp_8) nounwind, !dbg !79 ; [#uses=0 type=i32] [debug line = 68:2]
  call void @llvm.dbg.value(metadata !{i31 %i_1}, i64 0, metadata !80), !dbg !65 ; [debug line = 58:50] [debug variable = i]
  br label %1, !dbg !65                           ; [debug line = 58:50]

.preheader3:                                      ; preds = %3, %.preheader3.preheader
  %y3 = phi i17 [ %y_4, %3 ], [ 0, %.preheader3.preheader ] ; [#uses=3 type=i17]
  %x2 = phi i17 [ %x_4, %3 ], [ 0, %.preheader3.preheader ] ; [#uses=3 type=i17]
  %i1 = phi i31 [ %i_2, %3 ], [ 0, %.preheader3.preheader ] ; [#uses=2 type=i31]
  %y3_cast = zext i17 %y3 to i32, !dbg !69        ; [#uses=1 type=i32] [debug line = 72:39]
  %y3_cast_cast = zext i17 %y3 to i18             ; [#uses=1 type=i18]
  %tmp_19 = trunc i17 %x2 to i10                  ; [#uses=1 type=i10]
  %tmp_21_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_19, i8 0), !dbg !81 ; [#uses=1 type=i18] [debug line = 75:3]
  %tmp_20 = add i18 %tmp_21_cast, %y3_cast_cast, !dbg !81 ; [#uses=1 type=i18] [debug line = 75:3]
  %tmp_22_cast = zext i18 %tmp_20 to i32, !dbg !81 ; [#uses=1 type=i32] [debug line = 75:3]
  %bufb_addr = getelementptr [65536 x i32]* %bufb, i32 0, i32 %tmp_22_cast, !dbg !81 ; [#uses=1 type=i32*] [debug line = 75:3]
  %i1_cast = zext i31 %i1 to i32, !dbg !69        ; [#uses=1 type=i32] [debug line = 72:39]
  %tmp_6 = icmp slt i32 %i1_cast, %matrix_size, !dbg !69 ; [#uses=1 type=i1] [debug line = 72:39]
  %i_2 = add i31 1, %i1, !dbg !82                 ; [#uses=1 type=i31] [debug line = 72:59]
  br i1 %tmp_6, label %3, label %.preheader2.preheader, !dbg !69 ; [debug line = 72:39]

.preheader2.preheader:                            ; preds = %.preheader3
  br label %.preheader2, !dbg !83                 ; [debug line = 86:31]

; <label>:3                                       ; preds = %.preheader3
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @p_str7) nounwind, !dbg !85 ; [debug line = 72:64]
  %tmp_9 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str7) nounwind, !dbg !85 ; [#uses=1 type=i32] [debug line = 72:64]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @p_str) nounwind, !dbg !86 ; [debug line = 73:1]
  %tmpData_b = call i32 @_ssdm_op_Read.m_axi.i32P(i32* %b_addr), !dbg !66 ; [#uses=1 type=i32] [debug line = 74:22]
  call void @llvm.dbg.value(metadata !{i32 %tmpData_b}, i64 0, metadata !87), !dbg !66 ; [debug line = 74:22] [debug variable = tmpData_b]
  store i32 %tmpData_b, i32* %bufb_addr, align 4, !dbg !81 ; [debug line = 75:3]
  %tmp_7 = icmp eq i32 %y3_cast, %tmp, !dbg !88   ; [#uses=2 type=i1] [debug line = 76:3]
  %x_3 = add i17 %x2, 1, !dbg !89                 ; [#uses=1 type=i17] [debug line = 77:4]
  call void @llvm.dbg.value(metadata !{i17 %x_3}, i64 0, metadata !91), !dbg !89 ; [debug line = 77:4] [debug variable = x]
  %y_3 = add i17 %y3, 1, !dbg !92                 ; [#uses=1 type=i17] [debug line = 80:4]
  call void @llvm.dbg.value(metadata !{i17 %y_3}, i64 0, metadata !94), !dbg !92 ; [debug line = 80:4] [debug variable = y]
  %y_4 = select i1 %tmp_7, i17 0, i17 %y_3, !dbg !88 ; [#uses=1 type=i17] [debug line = 76:3]
  call void @llvm.dbg.value(metadata !{i17 %y_4}, i64 0, metadata !94), !dbg !88 ; [debug line = 76:3] [debug variable = y]
  %x_4 = select i1 %tmp_7, i17 %x_3, i17 %x2, !dbg !88 ; [#uses=1 type=i17] [debug line = 76:3]
  call void @llvm.dbg.value(metadata !{i17 %x_4}, i64 0, metadata !91), !dbg !88 ; [debug line = 76:3] [debug variable = x]
  %empty_5 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str7, i32 %tmp_9) nounwind, !dbg !95 ; [#uses=0 type=i32] [debug line = 82:2]
  call void @llvm.dbg.value(metadata !{i31 %i_2}, i64 0, metadata !96), !dbg !82 ; [debug line = 72:59] [debug variable = i]
  br label %.preheader3, !dbg !82                 ; [debug line = 72:59]

.preheader2:                                      ; preds = %10, %.preheader2.preheader
  %row = phi i31 [ %row_1, %10 ], [ 0, %.preheader2.preheader ] ; [#uses=3 type=i31]
  %row_cast = zext i31 %row to i32, !dbg !83      ; [#uses=1 type=i32] [debug line = 86:31]
  %tmp_21 = trunc i31 %row to i10                 ; [#uses=1 type=i10]
  %tmp_24_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_21, i8 0), !dbg !83 ; [#uses=2 type=i18] [debug line = 86:31]
  %tmp_s = icmp slt i32 %row_cast, %size_read, !dbg !83 ; [#uses=1 type=i1] [debug line = 86:31]
  %row_1 = add i31 1, %row, !dbg !97              ; [#uses=1 type=i31] [debug line = 86:45]
  br i1 %tmp_s, label %4, label %.preheader.preheader, !dbg !83 ; [debug line = 86:31]

.preheader.preheader:                             ; preds = %.preheader2
  %c_addr_1_wr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %c_addr, i32 %matrix_size), !dbg !98 ; [#uses=0 type=i1] [debug line = 105:3]
  br label %.preheader

; <label>:4                                       ; preds = %.preheader2
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @p_str8) nounwind, !dbg !101 ; [debug line = 86:53]
  %tmp_10 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str8) nounwind, !dbg !101 ; [#uses=1 type=i32] [debug line = 86:53]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @p_str) nounwind, !dbg !103 ; [debug line = 87:1]
  br label %5, !dbg !104                          ; [debug line = 88:18]

; <label>:5                                       ; preds = %9, %4
  %col = phi i17 [ 0, %4 ], [ %col_1, %9 ]        ; [#uses=3 type=i17]
  %col_cast = zext i17 %col to i32, !dbg !104     ; [#uses=1 type=i32] [debug line = 88:18]
  %col_cast_cast = zext i17 %col to i18, !dbg !106 ; [#uses=2 type=i18] [debug line = 96:4]
  %tmp_22 = add i18 %tmp_24_cast, %col_cast_cast, !dbg !106 ; [#uses=1 type=i18] [debug line = 96:4]
  %tmp_25_cast = zext i18 %tmp_22 to i32, !dbg !106 ; [#uses=1 type=i32] [debug line = 96:4]
  %bufc_addr_1 = getelementptr [65536 x i32]* %bufc, i32 0, i32 %tmp_25_cast, !dbg !106 ; [#uses=1 type=i32*] [debug line = 96:4]
  %exitcond1 = icmp eq i32 %col_cast, %size_read, !dbg !104 ; [#uses=1 type=i1] [debug line = 88:18]
  %col_1 = add i17 %col, 1, !dbg !108             ; [#uses=1 type=i17] [debug line = 88:32]
  br i1 %exitcond1, label %10, label %6, !dbg !104 ; [debug line = 88:18]

; <label>:6                                       ; preds = %5
  %tmp_12 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str9) nounwind, !dbg !109 ; [#uses=1 type=i32] [debug line = 88:40]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @p_str) nounwind, !dbg !110 ; [debug line = 89:1]
  br label %7, !dbg !111                          ; [debug line = 91:18]

; <label>:7                                       ; preds = %8, %6
  %result = phi i32 [ 0, %6 ], [ %result_1, %8 ]  ; [#uses=2 type=i32]
  %k = phi i32 [ 0, %6 ], [ %k_1, %8 ]            ; [#uses=4 type=i32]
  %tmp_26 = trunc i32 %k to i18, !dbg !113        ; [#uses=1 type=i18] [debug line = 94:2]
  %tmp_27 = add i18 %tmp_26, %tmp_24_cast, !dbg !113 ; [#uses=1 type=i18] [debug line = 94:2]
  %tmp_29_cast = zext i18 %tmp_27 to i32, !dbg !113 ; [#uses=1 type=i32] [debug line = 94:2]
  %bufa_addr_1 = getelementptr [65536 x i32]* %bufa, i32 0, i32 %tmp_29_cast, !dbg !113 ; [#uses=1 type=i32*] [debug line = 94:2]
  %tmp_28 = trunc i32 %k to i10                   ; [#uses=1 type=i10]
  %tmp_31_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_28, i8 0), !dbg !113 ; [#uses=1 type=i18] [debug line = 94:2]
  %tmp_29 = add i18 %col_cast_cast, %tmp_31_cast, !dbg !113 ; [#uses=1 type=i18] [debug line = 94:2]
  %tmp_32_cast = zext i18 %tmp_29 to i32, !dbg !113 ; [#uses=1 type=i32] [debug line = 94:2]
  %bufb_addr_1 = getelementptr [65536 x i32]* %bufb, i32 0, i32 %tmp_32_cast, !dbg !113 ; [#uses=1 type=i32*] [debug line = 94:2]
  %exitcond = icmp eq i32 %k, %size_read, !dbg !111 ; [#uses=1 type=i1] [debug line = 91:18]
  %k_1 = add nsw i32 1, %k, !dbg !115             ; [#uses=1 type=i32] [debug line = 91:30]
  br i1 %exitcond, label %9, label %8, !dbg !111  ; [debug line = 91:18]

; <label>:8                                       ; preds = %7
  %tmp_13 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str10) nounwind, !dbg !116 ; [#uses=1 type=i32] [debug line = 91:36]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @p_str) nounwind, !dbg !117 ; [debug line = 92:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @p_str) nounwind, !dbg !118 ; [debug line = 93:1]
  %bufa_load = load i32* %bufa_addr_1, align 4, !dbg !113 ; [#uses=1 type=i32] [debug line = 94:2]
  %bufb_load = load i32* %bufb_addr_1, align 4, !dbg !113 ; [#uses=1 type=i32] [debug line = 94:2]
  %tmp_5 = mul nsw i32 %bufb_load, %bufa_load, !dbg !113 ; [#uses=1 type=i32] [debug line = 94:2]
  %result_1 = add nsw i32 %tmp_5, %result, !dbg !113 ; [#uses=1 type=i32] [debug line = 94:2]
  call void @llvm.dbg.value(metadata !{i32 %result_1}, i64 0, metadata !119), !dbg !113 ; [debug line = 94:2] [debug variable = result]
  %empty_6 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str10, i32 %tmp_13) nounwind, !dbg !120 ; [#uses=0 type=i32] [debug line = 95:4]
  call void @llvm.dbg.value(metadata !{i32 %k_1}, i64 0, metadata !121), !dbg !115 ; [debug line = 91:30] [debug variable = k]
  br label %7, !dbg !115                          ; [debug line = 91:30]

; <label>:9                                       ; preds = %7
  store i32 %result, i32* %bufc_addr_1, align 4, !dbg !106 ; [debug line = 96:4]
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str9, i32 %tmp_12) nounwind, !dbg !122 ; [#uses=0 type=i32] [debug line = 97:3]
  call void @llvm.dbg.value(metadata !{i17 %col_1}, i64 0, metadata !123), !dbg !108 ; [debug line = 88:32] [debug variable = col]
  br label %5, !dbg !108                          ; [debug line = 88:32]

; <label>:10                                      ; preds = %5
  %empty_8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str8, i32 %tmp_10) nounwind, !dbg !124 ; [#uses=0 type=i32] [debug line = 98:2]
  call void @llvm.dbg.value(metadata !{i31 %row_1}, i64 0, metadata !125), !dbg !97 ; [debug line = 86:45] [debug variable = row]
  br label %.preheader2, !dbg !97                 ; [debug line = 86:45]

.preheader:                                       ; preds = %11, %.preheader.preheader
  %m = phi i32 [ %m_1, %11 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %n = phi i32 [ %n_1, %11 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %i4 = phi i31 [ %i_3, %11 ], [ 0, %.preheader.preheader ] ; [#uses=2 type=i31]
  %tmp_23 = trunc i32 %n to i18                   ; [#uses=1 type=i18]
  %tmp_24 = trunc i32 %m to i10                   ; [#uses=1 type=i10]
  %tmp_27_cast = call i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10 %tmp_24, i8 0), !dbg !126 ; [#uses=1 type=i18] [debug line = 104:28]
  %tmp_25 = add i18 %tmp_23, %tmp_27_cast, !dbg !126 ; [#uses=1 type=i18] [debug line = 104:28]
  %tmp_28_cast = zext i18 %tmp_25 to i32, !dbg !126 ; [#uses=1 type=i32] [debug line = 104:28]
  %bufc_addr = getelementptr [65536 x i32]* %bufc, i32 0, i32 %tmp_28_cast, !dbg !126 ; [#uses=1 type=i32*] [debug line = 104:28]
  %i4_cast = zext i31 %i4 to i32, !dbg !127       ; [#uses=1 type=i32] [debug line = 102:29]
  %tmp_3 = icmp slt i32 %i4_cast, %matrix_size, !dbg !127 ; [#uses=1 type=i1] [debug line = 102:29]
  %i_3 = add i31 1, %i4, !dbg !128                ; [#uses=1 type=i31] [debug line = 102:49]
  br i1 %tmp_3, label %11, label %12, !dbg !127   ; [debug line = 102:29]

; <label>:11                                      ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str11) nounwind, !dbg !129 ; [debug line = 102:54]
  %tmp_11 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str11) nounwind, !dbg !129 ; [#uses=1 type=i32] [debug line = 102:54]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @p_str) nounwind, !dbg !130 ; [debug line = 103:1]
  %tmpData_c = load i32* %bufc_addr, align 4, !dbg !126 ; [#uses=1 type=i32] [debug line = 104:28]
  call void @llvm.dbg.value(metadata !{i32 %tmpData_c}, i64 0, metadata !131), !dbg !126 ; [debug line = 104:28] [debug variable = tmpData_c]
  call void @_ssdm_op_Write.m_axi.i32P(i32* %c_addr, i32 %tmpData_c, i4 -1), !dbg !98 ; [debug line = 105:3]
  %tmp_4 = icmp eq i32 %n, %tmp, !dbg !132        ; [#uses=2 type=i1] [debug line = 106:3]
  %m_2 = add nsw i32 %m, 1, !dbg !133             ; [#uses=1 type=i32] [debug line = 107:4]
  call void @llvm.dbg.value(metadata !{i32 %m_2}, i64 0, metadata !135), !dbg !133 ; [debug line = 107:4] [debug variable = m]
  %n_2 = add nsw i32 %n, 1, !dbg !136             ; [#uses=1 type=i32] [debug line = 110:4]
  call void @llvm.dbg.value(metadata !{i32 %n_2}, i64 0, metadata !138), !dbg !136 ; [debug line = 110:4] [debug variable = n]
  %m_1 = select i1 %tmp_4, i32 %m_2, i32 %m, !dbg !132 ; [#uses=1 type=i32] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i32 %m_1}, i64 0, metadata !135), !dbg !132 ; [debug line = 106:3] [debug variable = m]
  %n_1 = select i1 %tmp_4, i32 0, i32 %n_2, !dbg !132 ; [#uses=1 type=i32] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i32 %n_1}, i64 0, metadata !138), !dbg !132 ; [debug line = 106:3] [debug variable = n]
  %empty_9 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str11, i32 %tmp_11) nounwind, !dbg !139 ; [#uses=0 type=i32] [debug line = 112:2]
  call void @llvm.dbg.value(metadata !{i31 %i_3}, i64 0, metadata !140), !dbg !128 ; [debug line = 102:49] [debug variable = i]
  br label %.preheader, !dbg !128                 ; [debug line = 102:49]

; <label>:12                                      ; preds = %.preheader
  %c_addr_1_wr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %c_addr), !dbg !98 ; [#uses=0 type=i1] [debug line = 105:3]
  ret void, !dbg !141                             ; [debug line = 113:1]
}

; [#uses=1]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=31]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
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

; [#uses=6]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=6]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

; [#uses=6]
define weak void @_ssdm_op_SpecLoopTripCount(...) nounwind {
entry:
  ret void
}

; [#uses=4]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecLatency(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=4]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

; [#uses=2]
define weak i32 @_ssdm_op_Read.m_axi.i32P(i32*) {
entry:
  %empty = load i32* %0                           ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=4]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=3]
define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_10 = trunc i32 %empty to i30             ; [#uses=1 type=i30]
  ret i30 %empty_10
}

; [#uses=0]
declare i18 @_ssdm_op_PartSelect.i18.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i10 @_ssdm_op_PartSelect.i10.i31.i32.i32(i31, i32, i32) nounwind readnone

; [#uses=0]
declare i10 @_ssdm_op_PartSelect.i10.i17.i32.i32(i17, i32, i32) nounwind readnone

; [#uses=5]
define weak i18 @_ssdm_op_BitConcatenate.i18.i10.i8(i10, i8) nounwind readnone {
entry:
  %empty = zext i10 %0 to i18                     ; [#uses=1 type=i18]
  %empty_11 = zext i8 %1 to i18                   ; [#uses=1 type=i18]
  %empty_12 = shl i18 %empty, 8                   ; [#uses=1 type=i18]
  %empty_13 = or i18 %empty_12, %empty_11         ; [#uses=1 type=i18]
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
!10 = metadata !{i32 786689, metadata !11, metadata !"size", metadata !12, i32 67108915, metadata !16, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!11 = metadata !{i32 786478, i32 0, metadata !12, metadata !"mmult_accel", metadata !"mmult_accel", metadata !"_Z11mmult_accelPiS_S_i", metadata !12, i32 51, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !17, i32 51} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 786473, metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/src/mmult.cpp", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{null, metadata !15, metadata !15, metadata !15, metadata !16}
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!19 = metadata !{i32 51, i32 46, metadata !11, null}
!20 = metadata !{i32 786689, metadata !11, metadata !"c", metadata !12, i32 50331699, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!21 = metadata !{i32 51, i32 39, metadata !11, null}
!22 = metadata !{i32 786689, metadata !11, metadata !"b", metadata !12, i32 33554483, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!23 = metadata !{i32 51, i32 31, metadata !11, null}
!24 = metadata !{i32 786689, metadata !11, metadata !"a", metadata !12, i32 16777267, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!25 = metadata !{i32 51, i32 23, metadata !11, null}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 31, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"c", metadata !30, metadata !"int", i32 0, i32 31}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 0, i32 1}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 31, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"b", metadata !30, metadata !"int", i32 0, i32 31}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 31, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"a", metadata !30, metadata !"int", i32 0, i32 31}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 31, metadata !42}
!42 = metadata !{metadata !43}
!43 = metadata !{metadata !"size", metadata !44, metadata !"int", i32 0, i32 31}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 0, i32 0}
!46 = metadata !{i32 52, i32 1, metadata !47, null}
!47 = metadata !{i32 786443, metadata !11, i32 51, i32 52, metadata !12, i32 0} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 786688, metadata !47, metadata !"bufa", metadata !12, i32 53, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !16, metadata !50, i32 0, i32 0} ; [ DW_TAG_array_type ]
!50 = metadata !{metadata !51, metadata !51}
!51 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!52 = metadata !{i32 53, i32 6, metadata !47, null}
!53 = metadata !{i32 786688, metadata !47, metadata !"bufb", metadata !12, i32 53, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 53, i32 22, metadata !47, null}
!55 = metadata !{i32 786688, metadata !47, metadata !"bufc", metadata !12, i32 53, metadata !49, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 53, i32 38, metadata !47, null}
!57 = metadata !{i32 54, i32 29, metadata !47, null}
!58 = metadata !{i32 786688, metadata !47, metadata !"matrix_size", metadata !12, i32 54, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 62, i32 3, metadata !60, null}
!60 = metadata !{i32 786443, metadata !61, i32 58, i32 54, metadata !12, i32 2} ; [ DW_TAG_lexical_block ]
!61 = metadata !{i32 786443, metadata !47, i32 58, i32 15, metadata !12, i32 1} ; [ DW_TAG_lexical_block ]
!62 = metadata !{i32 60, i32 22, metadata !60, null}
!63 = metadata !{i32 58, i32 30, metadata !61, null}
!64 = metadata !{i32 61, i32 3, metadata !60, null}
!65 = metadata !{i32 58, i32 50, metadata !61, null}
!66 = metadata !{i32 74, i32 22, metadata !67, null}
!67 = metadata !{i32 786443, metadata !68, i32 72, i32 63, metadata !12, i32 6} ; [ DW_TAG_lexical_block ]
!68 = metadata !{i32 786443, metadata !47, i32 72, i32 15, metadata !12, i32 5} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 72, i32 39, metadata !68, null}
!70 = metadata !{i32 58, i32 55, metadata !60, null}
!71 = metadata !{i32 59, i32 1, metadata !60, null}
!72 = metadata !{i32 786688, metadata !60, metadata !"tmpData_a", metadata !12, i32 60, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!73 = metadata !{i32 63, i32 4, metadata !74, null}
!74 = metadata !{i32 786443, metadata !60, i32 62, i32 19, metadata !12, i32 3} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 786688, metadata !47, metadata !"x", metadata !12, i32 57, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!76 = metadata !{i32 66, i32 4, metadata !77, null}
!77 = metadata !{i32 786443, metadata !60, i32 65, i32 8, metadata !12, i32 4} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 786688, metadata !47, metadata !"y", metadata !12, i32 57, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!79 = metadata !{i32 68, i32 2, metadata !60, null}
!80 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !12, i32 58, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!81 = metadata !{i32 75, i32 3, metadata !67, null}
!82 = metadata !{i32 72, i32 59, metadata !68, null}
!83 = metadata !{i32 86, i32 31, metadata !84, null}
!84 = metadata !{i32 786443, metadata !47, i32 86, i32 15, metadata !12, i32 9} ; [ DW_TAG_lexical_block ]
!85 = metadata !{i32 72, i32 64, metadata !67, null}
!86 = metadata !{i32 73, i32 1, metadata !67, null}
!87 = metadata !{i32 786688, metadata !67, metadata !"tmpData_b", metadata !12, i32 74, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!88 = metadata !{i32 76, i32 3, metadata !67, null}
!89 = metadata !{i32 77, i32 4, metadata !90, null}
!90 = metadata !{i32 786443, metadata !67, i32 76, i32 19, metadata !12, i32 7} ; [ DW_TAG_lexical_block ]
!91 = metadata !{i32 786688, metadata !68, metadata !"x", metadata !12, i32 72, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!92 = metadata !{i32 80, i32 4, metadata !93, null}
!93 = metadata !{i32 786443, metadata !67, i32 79, i32 8, metadata !12, i32 8} ; [ DW_TAG_lexical_block ]
!94 = metadata !{i32 786688, metadata !68, metadata !"y", metadata !12, i32 72, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!95 = metadata !{i32 82, i32 2, metadata !67, null}
!96 = metadata !{i32 786688, metadata !68, metadata !"i", metadata !12, i32 72, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!97 = metadata !{i32 86, i32 45, metadata !84, null}
!98 = metadata !{i32 105, i32 3, metadata !99, null}
!99 = metadata !{i32 786443, metadata !100, i32 102, i32 53, metadata !12, i32 16} ; [ DW_TAG_lexical_block ]
!100 = metadata !{i32 786443, metadata !47, i32 102, i32 14, metadata !12, i32 15} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 86, i32 53, metadata !102, null}
!102 = metadata !{i32 786443, metadata !84, i32 86, i32 52, metadata !12, i32 10} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 87, i32 1, metadata !102, null}
!104 = metadata !{i32 88, i32 18, metadata !105, null}
!105 = metadata !{i32 786443, metadata !102, i32 88, i32 2, metadata !12, i32 11} ; [ DW_TAG_lexical_block ]
!106 = metadata !{i32 96, i32 4, metadata !107, null}
!107 = metadata !{i32 786443, metadata !105, i32 88, i32 39, metadata !12, i32 12} ; [ DW_TAG_lexical_block ]
!108 = metadata !{i32 88, i32 32, metadata !105, null}
!109 = metadata !{i32 88, i32 40, metadata !107, null}
!110 = metadata !{i32 89, i32 1, metadata !107, null}
!111 = metadata !{i32 91, i32 18, metadata !112, null}
!112 = metadata !{i32 786443, metadata !107, i32 91, i32 4, metadata !12, i32 13} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 94, i32 2, metadata !114, null}
!114 = metadata !{i32 786443, metadata !112, i32 91, i32 35, metadata !12, i32 14} ; [ DW_TAG_lexical_block ]
!115 = metadata !{i32 91, i32 30, metadata !112, null}
!116 = metadata !{i32 91, i32 36, metadata !114, null}
!117 = metadata !{i32 92, i32 1, metadata !114, null}
!118 = metadata !{i32 93, i32 1, metadata !114, null}
!119 = metadata !{i32 786688, metadata !107, metadata !"result", metadata !12, i32 90, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!120 = metadata !{i32 95, i32 4, metadata !114, null}
!121 = metadata !{i32 786688, metadata !112, metadata !"k", metadata !12, i32 91, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!122 = metadata !{i32 97, i32 3, metadata !107, null}
!123 = metadata !{i32 786688, metadata !105, metadata !"col", metadata !12, i32 88, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!124 = metadata !{i32 98, i32 2, metadata !102, null}
!125 = metadata !{i32 786688, metadata !84, metadata !"row", metadata !12, i32 86, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!126 = metadata !{i32 104, i32 28, metadata !99, null}
!127 = metadata !{i32 102, i32 29, metadata !100, null}
!128 = metadata !{i32 102, i32 49, metadata !100, null}
!129 = metadata !{i32 102, i32 54, metadata !99, null}
!130 = metadata !{i32 103, i32 1, metadata !99, null}
!131 = metadata !{i32 786688, metadata !99, metadata !"tmpData_c", metadata !12, i32 104, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!132 = metadata !{i32 106, i32 3, metadata !99, null}
!133 = metadata !{i32 107, i32 4, metadata !134, null}
!134 = metadata !{i32 786443, metadata !99, i32 106, i32 19, metadata !12, i32 17} ; [ DW_TAG_lexical_block ]
!135 = metadata !{i32 786688, metadata !47, metadata !"m", metadata !12, i32 101, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!136 = metadata !{i32 110, i32 4, metadata !137, null}
!137 = metadata !{i32 786443, metadata !99, i32 109, i32 8, metadata !12, i32 18} ; [ DW_TAG_lexical_block ]
!138 = metadata !{i32 786688, metadata !47, metadata !"n", metadata !12, i32 101, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!139 = metadata !{i32 112, i32 2, metadata !99, null}
!140 = metadata !{i32 786688, metadata !100, metadata !"i", metadata !12, i32 102, metadata !16, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!141 = metadata !{i32 113, i32 1, metadata !47, null}
