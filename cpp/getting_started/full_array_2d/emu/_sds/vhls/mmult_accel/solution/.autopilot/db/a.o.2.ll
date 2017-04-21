; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@mmult_accel.str = internal unnamed_addr constant [12 x i8] c"mmult_accel\00" ; [#uses=1 type=[12 x i8]*]
@.str9 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=2 type=[12 x i8]*]
@.str8 = private unnamed_addr constant [12 x i8] c"matrix_mult\00", align 1 ; [#uses=3 type=[12 x i8]*]
@.str7 = private unnamed_addr constant [12 x i8] c"read_data_b\00", align 1 ; [#uses=3 type=[12 x i8]*]
@.str6 = private unnamed_addr constant [12 x i8] c"read_data_a\00", align 1 ; [#uses=3 type=[12 x i8]*]
@.str5 = private unnamed_addr constant [2 x i8] c"b\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str4 = private unnamed_addr constant [2 x i8] c"c\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=3 type=[7 x i8]*]
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str11 = private unnamed_addr constant [11 x i8] c"write_data\00", align 1 ; [#uses=3 type=[11 x i8]*]
@.str10 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=2 type=[12 x i8]*]
@.str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=3 type=[6 x i8]*]
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=20 type=[1 x i8]*]

; [#uses=0]
define void @mmult_accel(i32* %a, i32* %b, i32* %c, i32 %size) nounwind {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %a) nounwind, !map !30
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %b) nounwind, !map !36
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %c) nounwind, !map !40
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %size) nounwind, !map !44
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @mmult_accel.str) nounwind
  %bufa = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %bufb = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %bufc = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  call void @llvm.dbg.value(metadata !{i32* %a}, i64 0, metadata !50), !dbg !51 ; [debug line = 51:23] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32* %b}, i64 0, metadata !52), !dbg !53 ; [debug line = 51:31] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32* %c}, i64 0, metadata !54), !dbg !55 ; [debug line = 51:39] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !56), !dbg !57 ; [debug line = 51:46] [debug variable = size]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, [1 x i8]* @.str) nounwind, !dbg !58 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %a, [6 x i8]* @.str1, i32 0, i32 0, [1 x i8]* @.str, i32 0, i32 0, [2 x i8]* @.str2, [7 x i8]* @.str3, [1 x i8]* @.str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !58 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %c, [6 x i8]* @.str1, i32 0, i32 0, [1 x i8]* @.str, i32 0, i32 0, [2 x i8]* @.str4, [7 x i8]* @.str3, [1 x i8]* @.str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !58 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %b, [6 x i8]* @.str1, i32 0, i32 0, [1 x i8]* @.str, i32 0, i32 0, [2 x i8]* @.str5, [7 x i8]* @.str3, [1 x i8]* @.str, i32 16, i32 16, i32 16, i32 16, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !58 ; [debug line = 52:1]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufa}, metadata !60), !dbg !64 ; [debug line = 53:6] [debug variable = bufa]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufb}, metadata !65), !dbg !66 ; [debug line = 53:22] [debug variable = bufb]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufc}, metadata !67), !dbg !68 ; [debug line = 53:38] [debug variable = bufc]
  %matrix_size = mul nsw i32 %size, %size, !dbg !69 ; [#uses=6 type=i32] [debug line = 54:29]
  call void @llvm.dbg.value(metadata !{i32 %matrix_size}, i64 0, metadata !70), !dbg !69 ; [debug line = 54:29] [debug variable = matrix_size]
  %tmp = add nsw i32 %size, -1, !dbg !71          ; [#uses=3 type=i32] [debug line = 62:3]
  %tmp.14 = zext i31 0 to i32, !dbg !74           ; [#uses=1 type=i32] [debug line = 58:30]
  br label %1, !dbg !74                           ; [debug line = 58:30]

; <label>:1                                       ; preds = %2, %0
  %i = phi i31 [ 0, %0 ], [ %i.1, %2 ]            ; [#uses=2 type=i31]
  %y = phi i17 [ 0, %0 ], [ %y.1, %2 ]            ; [#uses=2 type=i17]
  %x = phi i17 [ 0, %0 ], [ %x.1, %2 ]            ; [#uses=3 type=i17]
  %i.cast = zext i31 %i to i32, !dbg !74          ; [#uses=2 type=i32] [debug line = 58:30]
  %y.cast = zext i17 %y to i32, !dbg !74          ; [#uses=2 type=i32] [debug line = 58:30]
  %x.cast = zext i17 %x to i32, !dbg !74          ; [#uses=1 type=i32] [debug line = 58:30]
  %tmp.1 = icmp slt i32 %i.cast, %matrix_size, !dbg !74 ; [#uses=1 type=i1] [debug line = 58:30]
  br i1 %tmp.1, label %2, label %.preheader3.preheader, !dbg !74 ; [debug line = 58:30]

.preheader3.preheader:                            ; preds = %1
  %tmp.15 = zext i31 0 to i32, !dbg !75           ; [#uses=1 type=i32] [debug line = 72:39]
  br label %.preheader3, !dbg !75                 ; [debug line = 72:39]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @.str6) nounwind, !dbg !77 ; [debug line = 58:55]
  %tmp.8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str6) nounwind, !dbg !77 ; [#uses=1 type=i32] [debug line = 58:55]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @.str) nounwind, !dbg !78 ; [debug line = 59:1]
  %a.addr = getelementptr inbounds i32* %a, i32 %i.cast, !dbg !79 ; [#uses=1 type=i32*] [debug line = 60:22]
  %a.addr.1 = getelementptr inbounds i32* %a, i32 %tmp.14, !dbg !79 ; [#uses=1 type=i32*] [debug line = 60:22]
  %3 = call i32 (...)* @_ssdm_op_SpecBurst(i32* %a.addr.1, i32 1, i32 %matrix_size, i32 1) ; [#uses=0 type=i32]
  %tmpData_a = load i32* %a.addr, align 4, !dbg !79 ; [#uses=1 type=i32] [debug line = 60:22]
  call void @llvm.dbg.value(metadata !{i32 %tmpData_a}, i64 0, metadata !80), !dbg !79 ; [debug line = 60:22] [debug variable = tmpData_a]
  %bufa.addr = getelementptr inbounds [256 x [256 x i32]]* %bufa, i32 0, i32 %x.cast, i32 %y.cast, !dbg !81 ; [#uses=1 type=i32*] [debug line = 61:3]
  store i32 %tmpData_a, i32* %bufa.addr, align 4, !dbg !81 ; [debug line = 61:3]
  %tmp.2 = icmp eq i32 %y.cast, %tmp, !dbg !71    ; [#uses=2 type=i1] [debug line = 62:3]
  %x.2 = add i17 %x, 1, !dbg !82                  ; [#uses=1 type=i17] [debug line = 63:4]
  call void @llvm.dbg.value(metadata !{i17 %x.2}, i64 0, metadata !84), !dbg !82 ; [debug line = 63:4] [debug variable = x]
  %y.2 = add i17 %y, 1, !dbg !85                  ; [#uses=1 type=i17] [debug line = 66:4]
  call void @llvm.dbg.value(metadata !{i17 %y.2}, i64 0, metadata !87), !dbg !85 ; [debug line = 66:4] [debug variable = y]
  %y.1 = select i1 %tmp.2, i17 0, i17 %y.2, !dbg !71 ; [#uses=1 type=i17] [debug line = 62:3]
  call void @llvm.dbg.value(metadata !{i17 %y.1}, i64 0, metadata !87), !dbg !71 ; [debug line = 62:3] [debug variable = y]
  %x.1 = select i1 %tmp.2, i17 %x.2, i17 %x, !dbg !71 ; [#uses=1 type=i17] [debug line = 62:3]
  call void @llvm.dbg.value(metadata !{i17 %x.1}, i64 0, metadata !84), !dbg !71 ; [debug line = 62:3] [debug variable = x]
  %4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str6, i32 %tmp.8) nounwind, !dbg !88 ; [#uses=0 type=i32] [debug line = 68:2]
  %i.1 = add i31 %i, 1, !dbg !89                  ; [#uses=1 type=i31] [debug line = 58:50]
  call void @llvm.dbg.value(metadata !{i31 %i.1}, i64 0, metadata !90), !dbg !89 ; [debug line = 58:50] [debug variable = i]
  br label %1, !dbg !89                           ; [debug line = 58:50]

.preheader3:                                      ; preds = %5, %.preheader3.preheader
  %y3 = phi i17 [ %y.4, %5 ], [ 0, %.preheader3.preheader ] ; [#uses=2 type=i17]
  %x2 = phi i17 [ %x.4, %5 ], [ 0, %.preheader3.preheader ] ; [#uses=3 type=i17]
  %i1 = phi i31 [ %i.2, %5 ], [ 0, %.preheader3.preheader ] ; [#uses=2 type=i31]
  %y3.cast = zext i17 %y3 to i32, !dbg !75        ; [#uses=2 type=i32] [debug line = 72:39]
  %x2.cast = zext i17 %x2 to i32, !dbg !75        ; [#uses=1 type=i32] [debug line = 72:39]
  %i1.cast = zext i31 %i1 to i32, !dbg !75        ; [#uses=2 type=i32] [debug line = 72:39]
  %tmp.6 = icmp slt i32 %i1.cast, %matrix_size, !dbg !75 ; [#uses=1 type=i1] [debug line = 72:39]
  br i1 %tmp.6, label %5, label %.preheader2.preheader, !dbg !75 ; [debug line = 72:39]

.preheader2.preheader:                            ; preds = %.preheader3
  br label %.preheader2, !dbg !91                 ; [debug line = 86:31]

; <label>:5                                       ; preds = %.preheader3
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @.str7) nounwind, !dbg !93 ; [debug line = 72:64]
  %tmp.9 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str7) nounwind, !dbg !93 ; [#uses=1 type=i32] [debug line = 72:64]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @.str) nounwind, !dbg !95 ; [debug line = 73:1]
  %b.addr = getelementptr inbounds i32* %b, i32 %i1.cast, !dbg !96 ; [#uses=1 type=i32*] [debug line = 74:22]
  %b.addr.1 = getelementptr inbounds i32* %b, i32 %tmp.15, !dbg !96 ; [#uses=1 type=i32*] [debug line = 74:22]
  %6 = call i32 (...)* @_ssdm_op_SpecBurst(i32* %b.addr.1, i32 1, i32 %matrix_size, i32 1) ; [#uses=0 type=i32]
  %tmpData_b = load i32* %b.addr, align 4, !dbg !96 ; [#uses=1 type=i32] [debug line = 74:22]
  call void @llvm.dbg.value(metadata !{i32 %tmpData_b}, i64 0, metadata !97), !dbg !96 ; [debug line = 74:22] [debug variable = tmpData_b]
  %bufb.addr = getelementptr inbounds [256 x [256 x i32]]* %bufb, i32 0, i32 %x2.cast, i32 %y3.cast, !dbg !98 ; [#uses=1 type=i32*] [debug line = 75:3]
  store i32 %tmpData_b, i32* %bufb.addr, align 4, !dbg !98 ; [debug line = 75:3]
  %tmp.7 = icmp eq i32 %y3.cast, %tmp, !dbg !99   ; [#uses=2 type=i1] [debug line = 76:3]
  %x.3 = add i17 %x2, 1, !dbg !100                ; [#uses=1 type=i17] [debug line = 77:4]
  call void @llvm.dbg.value(metadata !{i17 %x.3}, i64 0, metadata !102), !dbg !100 ; [debug line = 77:4] [debug variable = x]
  %y.3 = add i17 %y3, 1, !dbg !103                ; [#uses=1 type=i17] [debug line = 80:4]
  call void @llvm.dbg.value(metadata !{i17 %y.3}, i64 0, metadata !105), !dbg !103 ; [debug line = 80:4] [debug variable = y]
  %y.4 = select i1 %tmp.7, i17 0, i17 %y.3, !dbg !99 ; [#uses=1 type=i17] [debug line = 76:3]
  call void @llvm.dbg.value(metadata !{i17 %y.4}, i64 0, metadata !105), !dbg !99 ; [debug line = 76:3] [debug variable = y]
  %x.4 = select i1 %tmp.7, i17 %x.3, i17 %x2, !dbg !99 ; [#uses=1 type=i17] [debug line = 76:3]
  call void @llvm.dbg.value(metadata !{i17 %x.4}, i64 0, metadata !102), !dbg !99 ; [debug line = 76:3] [debug variable = x]
  %7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str7, i32 %tmp.9) nounwind, !dbg !106 ; [#uses=0 type=i32] [debug line = 82:2]
  %i.2 = add i31 %i1, 1, !dbg !107                ; [#uses=1 type=i31] [debug line = 72:59]
  call void @llvm.dbg.value(metadata !{i31 %i.2}, i64 0, metadata !108), !dbg !107 ; [debug line = 72:59] [debug variable = i]
  br label %.preheader3, !dbg !107                ; [debug line = 72:59]

.preheader2:                                      ; preds = %16, %.preheader2.preheader
  %row = phi i31 [ %row.1, %16 ], [ 0, %.preheader2.preheader ] ; [#uses=2 type=i31]
  %row.cast = zext i31 %row to i32, !dbg !91      ; [#uses=3 type=i32] [debug line = 86:31]
  %tmp. = icmp slt i32 %row.cast, %size, !dbg !91 ; [#uses=1 type=i1] [debug line = 86:31]
  br i1 %tmp., label %8, label %.preheader.preheader, !dbg !91 ; [debug line = 86:31]

.preheader.preheader:                             ; preds = %.preheader2
  %tmp.16 = zext i31 0 to i32, !dbg !109          ; [#uses=1 type=i32] [debug line = 102:29]
  br label %.preheader, !dbg !109                 ; [debug line = 102:29]

; <label>:8                                       ; preds = %.preheader2
  call void (...)* @_ssdm_op_SpecLoopName([12 x i8]* @.str8) nounwind, !dbg !111 ; [debug line = 86:53]
  %tmp.10 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str8) nounwind, !dbg !111 ; [#uses=1 type=i32] [debug line = 86:53]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @.str) nounwind, !dbg !113 ; [debug line = 87:1]
  br label %9, !dbg !114                          ; [debug line = 88:18]

; <label>:9                                       ; preds = %14, %8
  %col = phi i17 [ 0, %8 ], [ %col.1, %14 ]       ; [#uses=2 type=i17]
  %col.cast = zext i17 %col to i32, !dbg !114     ; [#uses=3 type=i32] [debug line = 88:18]
  %exitcond1 = icmp eq i32 %col.cast, %size, !dbg !114 ; [#uses=1 type=i1] [debug line = 88:18]
  br i1 %exitcond1, label %16, label %10, !dbg !114 ; [debug line = 88:18]

; <label>:10                                      ; preds = %9
  %tmp.12 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str9) nounwind, !dbg !116 ; [#uses=1 type=i32] [debug line = 88:40]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @.str) nounwind, !dbg !118 ; [debug line = 89:1]
  br label %11, !dbg !119                         ; [debug line = 91:18]

; <label>:11                                      ; preds = %12, %10
  %result = phi i32 [ 0, %10 ], [ %result.1, %12 ] ; [#uses=2 type=i32]
  %k = phi i32 [ 0, %10 ], [ %k.1, %12 ]          ; [#uses=4 type=i32]
  %exitcond = icmp eq i32 %k, %size, !dbg !119    ; [#uses=1 type=i1] [debug line = 91:18]
  br i1 %exitcond, label %14, label %12, !dbg !119 ; [debug line = 91:18]

; <label>:12                                      ; preds = %11
  %tmp.13 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str10) nounwind, !dbg !121 ; [#uses=1 type=i32] [debug line = 91:36]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, [1 x i8]* @.str) nounwind, !dbg !123 ; [debug line = 92:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, [1 x i8]* @.str) nounwind, !dbg !124 ; [debug line = 93:1]
  %bufa.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %bufa, i32 0, i32 %row.cast, i32 %k, !dbg !125 ; [#uses=1 type=i32*] [debug line = 94:2]
  %bufa.load = load i32* %bufa.addr.1, align 4, !dbg !125 ; [#uses=1 type=i32] [debug line = 94:2]
  %bufb.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %bufb, i32 0, i32 %k, i32 %col.cast, !dbg !125 ; [#uses=1 type=i32*] [debug line = 94:2]
  %bufb.load = load i32* %bufb.addr.1, align 4, !dbg !125 ; [#uses=1 type=i32] [debug line = 94:2]
  %tmp.5 = mul nsw i32 %bufa.load, %bufb.load, !dbg !125 ; [#uses=1 type=i32] [debug line = 94:2]
  %result.1 = add nsw i32 %result, %tmp.5, !dbg !125 ; [#uses=1 type=i32] [debug line = 94:2]
  call void @llvm.dbg.value(metadata !{i32 %result.1}, i64 0, metadata !126), !dbg !125 ; [debug line = 94:2] [debug variable = result]
  %13 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str10, i32 %tmp.13) nounwind, !dbg !127 ; [#uses=0 type=i32] [debug line = 95:4]
  %k.1 = add nsw i32 %k, 1, !dbg !128             ; [#uses=1 type=i32] [debug line = 91:30]
  call void @llvm.dbg.value(metadata !{i32 %k.1}, i64 0, metadata !129), !dbg !128 ; [debug line = 91:30] [debug variable = k]
  br label %11, !dbg !128                         ; [debug line = 91:30]

; <label>:14                                      ; preds = %11
  %result.lcssa = phi i32 [ %result, %11 ]        ; [#uses=1 type=i32]
  %bufc.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %bufc, i32 0, i32 %row.cast, i32 %col.cast, !dbg !130 ; [#uses=1 type=i32*] [debug line = 96:4]
  store i32 %result.lcssa, i32* %bufc.addr.1, align 4, !dbg !130 ; [debug line = 96:4]
  %15 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str9, i32 %tmp.12) nounwind, !dbg !131 ; [#uses=0 type=i32] [debug line = 97:3]
  %col.1 = add i17 %col, 1, !dbg !132             ; [#uses=1 type=i17] [debug line = 88:32]
  call void @llvm.dbg.value(metadata !{i17 %col.1}, i64 0, metadata !133), !dbg !132 ; [debug line = 88:32] [debug variable = col]
  br label %9, !dbg !132                          ; [debug line = 88:32]

; <label>:16                                      ; preds = %9
  %17 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str8, i32 %tmp.10) nounwind, !dbg !134 ; [#uses=0 type=i32] [debug line = 98:2]
  %row.1 = add i31 %row, 1, !dbg !135             ; [#uses=1 type=i31] [debug line = 86:45]
  call void @llvm.dbg.value(metadata !{i31 %row.1}, i64 0, metadata !136), !dbg !135 ; [debug line = 86:45] [debug variable = row]
  br label %.preheader2, !dbg !135                ; [debug line = 86:45]

.preheader:                                       ; preds = %18, %.preheader.preheader
  %m = phi i32 [ %m.1, %18 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %n = phi i32 [ %n.1, %18 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %i4 = phi i31 [ %i.3, %18 ], [ 0, %.preheader.preheader ] ; [#uses=2 type=i31]
  %i4.cast = zext i31 %i4 to i32, !dbg !109       ; [#uses=2 type=i32] [debug line = 102:29]
  %tmp.3 = icmp slt i32 %i4.cast, %matrix_size, !dbg !109 ; [#uses=1 type=i1] [debug line = 102:29]
  br i1 %tmp.3, label %18, label %21, !dbg !109   ; [debug line = 102:29]

; <label>:18                                      ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @.str11) nounwind, !dbg !137 ; [debug line = 102:54]
  %tmp.11 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @.str11) nounwind, !dbg !137 ; [#uses=1 type=i32] [debug line = 102:54]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, [1 x i8]* @.str) nounwind, !dbg !139 ; [debug line = 103:1]
  %bufc.addr = getelementptr inbounds [256 x [256 x i32]]* %bufc, i32 0, i32 %m, i32 %n, !dbg !140 ; [#uses=1 type=i32*] [debug line = 104:28]
  %tmpData_c = load i32* %bufc.addr, align 4, !dbg !140 ; [#uses=1 type=i32] [debug line = 104:28]
  call void @llvm.dbg.value(metadata !{i32 %tmpData_c}, i64 0, metadata !141), !dbg !140 ; [debug line = 104:28] [debug variable = tmpData_c]
  %c.addr = getelementptr inbounds i32* %c, i32 %i4.cast, !dbg !142 ; [#uses=1 type=i32*] [debug line = 105:3]
  %c.addr.1 = getelementptr inbounds i32* %c, i32 %tmp.16, !dbg !142 ; [#uses=1 type=i32*] [debug line = 105:3]
  %19 = call i32 (...)* @_ssdm_op_SpecBurst(i32* %c.addr.1, i32 0, i32 %matrix_size, i32 1) ; [#uses=0 type=i32]
  store i32 %tmpData_c, i32* %c.addr, align 4, !dbg !142 ; [debug line = 105:3]
  %tmp.4 = icmp eq i32 %n, %tmp, !dbg !143        ; [#uses=2 type=i1] [debug line = 106:3]
  %m.2 = add nsw i32 %m, 1, !dbg !144             ; [#uses=1 type=i32] [debug line = 107:4]
  call void @llvm.dbg.value(metadata !{i32 %m.2}, i64 0, metadata !146), !dbg !144 ; [debug line = 107:4] [debug variable = m]
  %n.2 = add nsw i32 %n, 1, !dbg !147             ; [#uses=1 type=i32] [debug line = 110:4]
  call void @llvm.dbg.value(metadata !{i32 %n.2}, i64 0, metadata !149), !dbg !147 ; [debug line = 110:4] [debug variable = n]
  %m.1 = select i1 %tmp.4, i32 %m.2, i32 %m, !dbg !143 ; [#uses=1 type=i32] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i32 %m.1}, i64 0, metadata !146), !dbg !143 ; [debug line = 106:3] [debug variable = m]
  %n.1 = select i1 %tmp.4, i32 0, i32 %n.2, !dbg !143 ; [#uses=1 type=i32] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i32 %n.1}, i64 0, metadata !149), !dbg !143 ; [debug line = 106:3] [debug variable = n]
  %20 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @.str11, i32 %tmp.11) nounwind, !dbg !150 ; [#uses=0 type=i32] [debug line = 112:2]
  %i.3 = add i31 %i4, 1, !dbg !151                ; [#uses=1 type=i31] [debug line = 102:49]
  call void @llvm.dbg.value(metadata !{i31 %i.3}, i64 0, metadata !152), !dbg !151 ; [debug line = 102:49] [debug variable = i]
  br label %.preheader, !dbg !151                 ; [debug line = 102:49]

; <label>:21                                      ; preds = %.preheader
  ret void, !dbg !153                             ; [debug line = 113:1]
}

; [#uses=27]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=6]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=6]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=1]
declare void @_ssdm_op_SpecPipeline(...) nounwind

; [#uses=6]
declare void @_ssdm_op_SpecLoopTripCount(...) nounwind

; [#uses=4]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLatency(...) nounwind

; [#uses=3]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=3]
declare i32 @_ssdm_op_SpecBurst(...)

; [#uses=4]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!23}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/mmult.pragma.2.cpp", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !13} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"mmult_accel", metadata !"mmult_accel", metadata !"_Z11mmult_accelPiS_S_i", metadata !6, i32 51, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32*, i32)* @mmult_accel, null, null, metadata !11, i32 51} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/src/mmult.cpp", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !18, metadata !19, metadata !20, metadata !22}
!15 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdin_", metadata !"_IO_2_1_stdin_", metadata !"", metadata !16, i32 346, metadata !17, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!16 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786434, null, metadata !"_IO_FILE_plus", metadata !16, i32 344, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!18 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdout_", metadata !"_IO_2_1_stdout_", metadata !"", metadata !16, i32 347, metadata !17, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!19 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stderr_", metadata !"_IO_2_1_stderr_", metadata !"", metadata !16, i32 348, metadata !17, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!20 = metadata !{i32 786484, i32 0, null, metadata !"sys_nerr", metadata !"sys_nerr", metadata !"", metadata !21, i32 27, metadata !10, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!21 = metadata !{i32 786473, metadata !"/usr/include/bits/sys_errlist.h", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 786484, i32 0, null, metadata !"_sys_nerr", metadata !"_sys_nerr", metadata !"", metadata !21, i32 31, metadata !10, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!23 = metadata !{void (i32*, i32*, i32*, i32)* @mmult_accel, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29}
!24 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 0}
!25 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!26 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"int*", metadata !"int*", metadata !"int"}
!27 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!28 = metadata !{metadata !"kernel_arg_name", metadata !"a", metadata !"b", metadata !"c", metadata !"size"}
!29 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 31, metadata !32}
!32 = metadata !{metadata !33}
!33 = metadata !{metadata !"a", metadata !34, metadata !"int", i32 0, i32 31}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 0, i32 0, i32 1}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 31, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"b", metadata !34, metadata !"int", i32 0, i32 31}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 31, metadata !42}
!42 = metadata !{metadata !43}
!43 = metadata !{metadata !"c", metadata !34, metadata !"int", i32 0, i32 31}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 31, metadata !46}
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !"size", metadata !48, metadata !"int", i32 0, i32 31}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 0, i32 0, i32 0}
!50 = metadata !{i32 786689, metadata !5, metadata !"a", metadata !6, i32 16777267, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 51, i32 23, metadata !5, null}
!52 = metadata !{i32 786689, metadata !5, metadata !"b", metadata !6, i32 33554483, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 51, i32 31, metadata !5, null}
!54 = metadata !{i32 786689, metadata !5, metadata !"c", metadata !6, i32 50331699, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!55 = metadata !{i32 51, i32 39, metadata !5, null}
!56 = metadata !{i32 786689, metadata !5, metadata !"size", metadata !6, i32 67108915, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!57 = metadata !{i32 51, i32 46, metadata !5, null}
!58 = metadata !{i32 52, i32 1, metadata !59, null}
!59 = metadata !{i32 786443, metadata !5, i32 51, i32 52, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!60 = metadata !{i32 786688, metadata !59, metadata !"bufa", metadata !6, i32 53, metadata !61, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !10, metadata !62, i32 0, i32 0} ; [ DW_TAG_array_type ]
!62 = metadata !{metadata !63, metadata !63}
!63 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!64 = metadata !{i32 53, i32 6, metadata !59, null}
!65 = metadata !{i32 786688, metadata !59, metadata !"bufb", metadata !6, i32 53, metadata !61, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 53, i32 22, metadata !59, null}
!67 = metadata !{i32 786688, metadata !59, metadata !"bufc", metadata !6, i32 53, metadata !61, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 53, i32 38, metadata !59, null}
!69 = metadata !{i32 54, i32 29, metadata !59, null}
!70 = metadata !{i32 786688, metadata !59, metadata !"matrix_size", metadata !6, i32 54, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!71 = metadata !{i32 62, i32 3, metadata !72, null}
!72 = metadata !{i32 786443, metadata !73, i32 58, i32 54, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 786443, metadata !59, i32 58, i32 15, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 58, i32 30, metadata !73, null}
!75 = metadata !{i32 72, i32 39, metadata !76, null}
!76 = metadata !{i32 786443, metadata !59, i32 72, i32 15, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!77 = metadata !{i32 58, i32 55, metadata !72, null}
!78 = metadata !{i32 59, i32 1, metadata !72, null}
!79 = metadata !{i32 60, i32 22, metadata !72, null}
!80 = metadata !{i32 786688, metadata !72, metadata !"tmpData_a", metadata !6, i32 60, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!81 = metadata !{i32 61, i32 3, metadata !72, null}
!82 = metadata !{i32 63, i32 4, metadata !83, null}
!83 = metadata !{i32 786443, metadata !72, i32 62, i32 19, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 786688, metadata !59, metadata !"x", metadata !6, i32 57, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!85 = metadata !{i32 66, i32 4, metadata !86, null}
!86 = metadata !{i32 786443, metadata !72, i32 65, i32 8, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 786688, metadata !59, metadata !"y", metadata !6, i32 57, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!88 = metadata !{i32 68, i32 2, metadata !72, null}
!89 = metadata !{i32 58, i32 50, metadata !73, null}
!90 = metadata !{i32 786688, metadata !73, metadata !"i", metadata !6, i32 58, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!91 = metadata !{i32 86, i32 31, metadata !92, null}
!92 = metadata !{i32 786443, metadata !59, i32 86, i32 15, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 72, i32 64, metadata !94, null}
!94 = metadata !{i32 786443, metadata !76, i32 72, i32 63, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 73, i32 1, metadata !94, null}
!96 = metadata !{i32 74, i32 22, metadata !94, null}
!97 = metadata !{i32 786688, metadata !94, metadata !"tmpData_b", metadata !6, i32 74, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!98 = metadata !{i32 75, i32 3, metadata !94, null}
!99 = metadata !{i32 76, i32 3, metadata !94, null}
!100 = metadata !{i32 77, i32 4, metadata !101, null}
!101 = metadata !{i32 786443, metadata !94, i32 76, i32 19, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!102 = metadata !{i32 786688, metadata !76, metadata !"x", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!103 = metadata !{i32 80, i32 4, metadata !104, null}
!104 = metadata !{i32 786443, metadata !94, i32 79, i32 8, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!105 = metadata !{i32 786688, metadata !76, metadata !"y", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 82, i32 2, metadata !94, null}
!107 = metadata !{i32 72, i32 59, metadata !76, null}
!108 = metadata !{i32 786688, metadata !76, metadata !"i", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!109 = metadata !{i32 102, i32 29, metadata !110, null}
!110 = metadata !{i32 786443, metadata !59, i32 102, i32 14, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!111 = metadata !{i32 86, i32 53, metadata !112, null}
!112 = metadata !{i32 786443, metadata !92, i32 86, i32 52, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 87, i32 1, metadata !112, null}
!114 = metadata !{i32 88, i32 18, metadata !115, null}
!115 = metadata !{i32 786443, metadata !112, i32 88, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 88, i32 40, metadata !117, null}
!117 = metadata !{i32 786443, metadata !115, i32 88, i32 39, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 89, i32 1, metadata !117, null}
!119 = metadata !{i32 91, i32 18, metadata !120, null}
!120 = metadata !{i32 786443, metadata !117, i32 91, i32 4, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!121 = metadata !{i32 91, i32 36, metadata !122, null}
!122 = metadata !{i32 786443, metadata !120, i32 91, i32 35, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!123 = metadata !{i32 92, i32 1, metadata !122, null}
!124 = metadata !{i32 93, i32 1, metadata !122, null}
!125 = metadata !{i32 94, i32 2, metadata !122, null}
!126 = metadata !{i32 786688, metadata !117, metadata !"result", metadata !6, i32 90, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!127 = metadata !{i32 95, i32 4, metadata !122, null}
!128 = metadata !{i32 91, i32 30, metadata !120, null}
!129 = metadata !{i32 786688, metadata !120, metadata !"k", metadata !6, i32 91, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!130 = metadata !{i32 96, i32 4, metadata !117, null}
!131 = metadata !{i32 97, i32 3, metadata !117, null}
!132 = metadata !{i32 88, i32 32, metadata !115, null}
!133 = metadata !{i32 786688, metadata !115, metadata !"col", metadata !6, i32 88, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!134 = metadata !{i32 98, i32 2, metadata !112, null}
!135 = metadata !{i32 86, i32 45, metadata !92, null}
!136 = metadata !{i32 786688, metadata !92, metadata !"row", metadata !6, i32 86, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!137 = metadata !{i32 102, i32 54, metadata !138, null}
!138 = metadata !{i32 786443, metadata !110, i32 102, i32 53, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!139 = metadata !{i32 103, i32 1, metadata !138, null}
!140 = metadata !{i32 104, i32 28, metadata !138, null}
!141 = metadata !{i32 786688, metadata !138, metadata !"tmpData_c", metadata !6, i32 104, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!142 = metadata !{i32 105, i32 3, metadata !138, null}
!143 = metadata !{i32 106, i32 3, metadata !138, null}
!144 = metadata !{i32 107, i32 4, metadata !145, null}
!145 = metadata !{i32 786443, metadata !138, i32 106, i32 19, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!146 = metadata !{i32 786688, metadata !59, metadata !"m", metadata !6, i32 101, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!147 = metadata !{i32 110, i32 4, metadata !148, null}
!148 = metadata !{i32 786443, metadata !138, i32 109, i32 8, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!149 = metadata !{i32 786688, metadata !59, metadata !"n", metadata !6, i32 101, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!150 = metadata !{i32 112, i32 2, metadata !138, null}
!151 = metadata !{i32 102, i32 49, metadata !110, null}
!152 = metadata !{i32 786688, metadata !110, metadata !"i", metadata !6, i32 102, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!153 = metadata !{i32 113, i32 1, metadata !59, null}
