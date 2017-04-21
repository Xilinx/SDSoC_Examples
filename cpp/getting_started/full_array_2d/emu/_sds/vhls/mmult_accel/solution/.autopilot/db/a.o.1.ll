; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@mmult_accel.str = internal unnamed_addr constant [12 x i8] c"mmult_accel\00" ; [#uses=1 type=[12 x i8]*]
@.str9 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str8 = private unnamed_addr constant [12 x i8] c"matrix_mult\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str7 = private unnamed_addr constant [12 x i8] c"read_data_b\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str6 = private unnamed_addr constant [12 x i8] c"read_data_a\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str5 = private unnamed_addr constant [2 x i8] c"b\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str4 = private unnamed_addr constant [2 x i8] c"c\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=1 type=[7 x i8]*]
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str11 = private unnamed_addr constant [11 x i8] c"write_data\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str10 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]

; [#uses=0]
define void @mmult_accel(i32* %a, i32* %b, i32* %c, i32 %size) nounwind {
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @mmult_accel.str) nounwind
  %bufa = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %bufb = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %bufc = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  call void @llvm.dbg.value(metadata !{i32* %a}, i64 0, metadata !30), !dbg !31 ; [debug line = 51:23] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32* %b}, i64 0, metadata !32), !dbg !33 ; [debug line = 51:31] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32* %c}, i64 0, metadata !34), !dbg !35 ; [debug line = 51:39] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %size}, i64 0, metadata !36), !dbg !37 ; [debug line = 51:46] [debug variable = size]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %a, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %c, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %b, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufa}, metadata !40), !dbg !44 ; [debug line = 53:6] [debug variable = bufa]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufb}, metadata !45), !dbg !46 ; [debug line = 53:22] [debug variable = bufb]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufc}, metadata !47), !dbg !48 ; [debug line = 53:38] [debug variable = bufc]
  %matrix_size = mul nsw i32 %size, %size, !dbg !49 ; [#uses=3 type=i32] [debug line = 54:29]
  call void @llvm.dbg.value(metadata !{i32 %matrix_size}, i64 0, metadata !50), !dbg !49 ; [debug line = 54:29] [debug variable = matrix_size]
  %tmp = add nsw i32 %size, -1, !dbg !51          ; [#uses=3 type=i32] [debug line = 62:3]
  br label %1, !dbg !54                           ; [debug line = 58:30]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i.1, %2 ]            ; [#uses=3 type=i32]
  %y = phi i32 [ 0, %0 ], [ %y.1, %2 ]            ; [#uses=3 type=i32]
  %x = phi i32 [ 0, %0 ], [ %x.1, %2 ]            ; [#uses=3 type=i32]
  %tmp.1 = icmp slt i32 %i, %matrix_size, !dbg !54 ; [#uses=1 type=i1] [debug line = 58:30]
  br i1 %tmp.1, label %2, label %.preheader3.preheader, !dbg !54 ; [debug line = 58:30]

.preheader3.preheader:                            ; preds = %1
  br label %.preheader3, !dbg !55                 ; [debug line = 72:39]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !57 ; [debug line = 58:55]
  %rbegin8 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !57 ; [#uses=1 type=i32] [debug line = 58:55]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !58 ; [debug line = 59:1]
  %a.addr = getelementptr inbounds i32* %a, i32 %i, !dbg !59 ; [#uses=1 type=i32*] [debug line = 60:22]
  %tmpData_a = load i32* %a.addr, align 4, !dbg !59 ; [#uses=2 type=i32] [debug line = 60:22]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmpData_a) nounwind
  call void @llvm.dbg.value(metadata !{i32 %tmpData_a}, i64 0, metadata !60), !dbg !59 ; [debug line = 60:22] [debug variable = tmpData_a]
  %bufa.addr = getelementptr inbounds [256 x [256 x i32]]* %bufa, i32 0, i32 %x, i32 %y, !dbg !61 ; [#uses=1 type=i32*] [debug line = 61:3]
  store i32 %tmpData_a, i32* %bufa.addr, align 4, !dbg !61 ; [debug line = 61:3]
  %tmp.2 = icmp eq i32 %y, %tmp, !dbg !51         ; [#uses=2 type=i1] [debug line = 62:3]
  %x.2 = add nsw i32 %x, 1, !dbg !62              ; [#uses=1 type=i32] [debug line = 63:4]
  call void @llvm.dbg.value(metadata !{i32 %x.2}, i64 0, metadata !64), !dbg !62 ; [debug line = 63:4] [debug variable = x]
  %y.2 = add nsw i32 %y, 1, !dbg !65              ; [#uses=1 type=i32] [debug line = 66:4]
  call void @llvm.dbg.value(metadata !{i32 %y.2}, i64 0, metadata !67), !dbg !65 ; [debug line = 66:4] [debug variable = y]
  %y.1 = select i1 %tmp.2, i32 0, i32 %y.2, !dbg !51 ; [#uses=1 type=i32] [debug line = 62:3]
  call void @llvm.dbg.value(metadata !{i32 %y.1}, i64 0, metadata !67), !dbg !51 ; [debug line = 62:3] [debug variable = y]
  %x.1 = select i1 %tmp.2, i32 %x.2, i32 %x, !dbg !51 ; [#uses=1 type=i32] [debug line = 62:3]
  call void @llvm.dbg.value(metadata !{i32 %x.1}, i64 0, metadata !64), !dbg !51 ; [debug line = 62:3] [debug variable = x]
  %rend9 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0), i32 %rbegin8) nounwind, !dbg !68 ; [#uses=0 type=i32] [debug line = 68:2]
  %i.1 = add nsw i32 %i, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 58:50]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !70), !dbg !69 ; [debug line = 58:50] [debug variable = i]
  br label %1, !dbg !69                           ; [debug line = 58:50]

.preheader3:                                      ; preds = %3, %.preheader3.preheader
  %y3 = phi i32 [ %y.4, %3 ], [ 0, %.preheader3.preheader ] ; [#uses=3 type=i32]
  %x2 = phi i32 [ %x.4, %3 ], [ 0, %.preheader3.preheader ] ; [#uses=3 type=i32]
  %i1 = phi i32 [ %i.2, %3 ], [ 0, %.preheader3.preheader ] ; [#uses=3 type=i32]
  %tmp.6 = icmp slt i32 %i1, %matrix_size, !dbg !55 ; [#uses=1 type=i1] [debug line = 72:39]
  br i1 %tmp.6, label %3, label %.preheader2.preheader, !dbg !55 ; [debug line = 72:39]

.preheader2.preheader:                            ; preds = %.preheader3
  br label %.preheader2, !dbg !71                 ; [debug line = 86:31]

; <label>:3                                       ; preds = %.preheader3
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !73 ; [debug line = 72:64]
  %rbegin1 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !73 ; [#uses=1 type=i32] [debug line = 72:64]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !75 ; [debug line = 73:1]
  %b.addr = getelementptr inbounds i32* %b, i32 %i1, !dbg !76 ; [#uses=1 type=i32*] [debug line = 74:22]
  %tmpData_b = load i32* %b.addr, align 4, !dbg !76 ; [#uses=2 type=i32] [debug line = 74:22]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmpData_b) nounwind
  call void @llvm.dbg.value(metadata !{i32 %tmpData_b}, i64 0, metadata !77), !dbg !76 ; [debug line = 74:22] [debug variable = tmpData_b]
  %bufb.addr = getelementptr inbounds [256 x [256 x i32]]* %bufb, i32 0, i32 %x2, i32 %y3, !dbg !78 ; [#uses=1 type=i32*] [debug line = 75:3]
  store i32 %tmpData_b, i32* %bufb.addr, align 4, !dbg !78 ; [debug line = 75:3]
  %tmp.7 = icmp eq i32 %y3, %tmp, !dbg !79        ; [#uses=2 type=i1] [debug line = 76:3]
  %x.3 = add nsw i32 %x2, 1, !dbg !80             ; [#uses=1 type=i32] [debug line = 77:4]
  call void @llvm.dbg.value(metadata !{i32 %x.3}, i64 0, metadata !82), !dbg !80 ; [debug line = 77:4] [debug variable = x]
  %y.3 = add nsw i32 %y3, 1, !dbg !83             ; [#uses=1 type=i32] [debug line = 80:4]
  call void @llvm.dbg.value(metadata !{i32 %y.3}, i64 0, metadata !85), !dbg !83 ; [debug line = 80:4] [debug variable = y]
  %y.4 = select i1 %tmp.7, i32 0, i32 %y.3, !dbg !79 ; [#uses=1 type=i32] [debug line = 76:3]
  call void @llvm.dbg.value(metadata !{i32 %y.4}, i64 0, metadata !85), !dbg !79 ; [debug line = 76:3] [debug variable = y]
  %x.4 = select i1 %tmp.7, i32 %x.3, i32 %x2, !dbg !79 ; [#uses=1 type=i32] [debug line = 76:3]
  call void @llvm.dbg.value(metadata !{i32 %x.4}, i64 0, metadata !82), !dbg !79 ; [debug line = 76:3] [debug variable = x]
  %rend11 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0), i32 %rbegin1) nounwind, !dbg !86 ; [#uses=0 type=i32] [debug line = 82:2]
  %i.2 = add nsw i32 %i1, 1, !dbg !87             ; [#uses=1 type=i32] [debug line = 72:59]
  call void @llvm.dbg.value(metadata !{i32 %i.2}, i64 0, metadata !88), !dbg !87 ; [debug line = 72:59] [debug variable = i]
  br label %.preheader3, !dbg !87                 ; [debug line = 72:59]

.preheader2:                                      ; preds = %10, %.preheader2.preheader
  %row = phi i32 [ %row.1, %10 ], [ 0, %.preheader2.preheader ] ; [#uses=4 type=i32]
  %tmp.11 = icmp slt i32 %row, %size, !dbg !71    ; [#uses=1 type=i1] [debug line = 86:31]
  br i1 %tmp.11, label %4, label %.preheader.preheader, !dbg !71 ; [debug line = 86:31]

.preheader.preheader:                             ; preds = %.preheader2
  br label %.preheader, !dbg !89                  ; [debug line = 102:29]

; <label>:4                                       ; preds = %.preheader2
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !91 ; [debug line = 86:53]
  %rbegin6 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !91 ; [#uses=1 type=i32] [debug line = 86:53]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !93 ; [debug line = 87:1]
  br label %5, !dbg !94                           ; [debug line = 88:18]

; <label>:5                                       ; preds = %9, %4
  %col = phi i32 [ 0, %4 ], [ %col.1, %9 ]        ; [#uses=4 type=i32]
  %exitcond1 = icmp eq i32 %col, %size, !dbg !94  ; [#uses=1 type=i1] [debug line = 88:18]
  br i1 %exitcond1, label %10, label %6, !dbg !94 ; [debug line = 88:18]

; <label>:6                                       ; preds = %5
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0)) nounwind, !dbg !96 ; [#uses=1 type=i32] [debug line = 88:40]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !98 ; [debug line = 89:1]
  br label %7, !dbg !99                           ; [debug line = 91:18]

; <label>:7                                       ; preds = %8, %6
  %result = phi i32 [ 0, %6 ], [ %result.1, %8 ]  ; [#uses=2 type=i32]
  %k = phi i32 [ 0, %6 ], [ %k.1, %8 ]            ; [#uses=4 type=i32]
  %exitcond = icmp eq i32 %k, %size, !dbg !99     ; [#uses=1 type=i1] [debug line = 91:18]
  br i1 %exitcond, label %9, label %8, !dbg !99   ; [debug line = 91:18]

; <label>:8                                       ; preds = %7
  %rbegin4 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !101 ; [#uses=1 type=i32] [debug line = 91:36]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !103 ; [debug line = 92:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !104 ; [debug line = 93:1]
  %bufa.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %bufa, i32 0, i32 %row, i32 %k, !dbg !105 ; [#uses=1 type=i32*] [debug line = 94:2]
  %bufa.load = load i32* %bufa.addr.1, align 4, !dbg !105 ; [#uses=2 type=i32] [debug line = 94:2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bufa.load) nounwind
  %bufb.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %bufb, i32 0, i32 %k, i32 %col, !dbg !105 ; [#uses=1 type=i32*] [debug line = 94:2]
  %bufb.load = load i32* %bufb.addr.1, align 4, !dbg !105 ; [#uses=2 type=i32] [debug line = 94:2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bufb.load) nounwind
  %tmp.19 = mul nsw i32 %bufb.load, %bufa.load, !dbg !105 ; [#uses=1 type=i32] [debug line = 94:2]
  %result.1 = add nsw i32 %tmp.19, %result, !dbg !105 ; [#uses=1 type=i32] [debug line = 94:2]
  call void @llvm.dbg.value(metadata !{i32 %result.1}, i64 0, metadata !106), !dbg !105 ; [debug line = 94:2] [debug variable = result]
  %rend5 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0), i32 %rbegin4) nounwind, !dbg !107 ; [#uses=0 type=i32] [debug line = 95:4]
  %k.1 = add nsw i32 %k, 1, !dbg !108             ; [#uses=1 type=i32] [debug line = 91:30]
  call void @llvm.dbg.value(metadata !{i32 %k.1}, i64 0, metadata !109), !dbg !108 ; [debug line = 91:30] [debug variable = k]
  br label %7, !dbg !108                          ; [debug line = 91:30]

; <label>:9                                       ; preds = %7
  %result.0.lcssa = phi i32 [ %result, %7 ]       ; [#uses=1 type=i32]
  %bufc.addr.1 = getelementptr inbounds [256 x [256 x i32]]* %bufc, i32 0, i32 %row, i32 %col, !dbg !110 ; [#uses=1 type=i32*] [debug line = 96:4]
  store i32 %result.0.lcssa, i32* %bufc.addr.1, align 4, !dbg !110 ; [debug line = 96:4]
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i32 %rbegin) nounwind, !dbg !111 ; [#uses=0 type=i32] [debug line = 97:3]
  %col.1 = add nsw i32 %col, 1, !dbg !112         ; [#uses=1 type=i32] [debug line = 88:32]
  call void @llvm.dbg.value(metadata !{i32 %col.1}, i64 0, metadata !113), !dbg !112 ; [debug line = 88:32] [debug variable = col]
  br label %5, !dbg !112                          ; [debug line = 88:32]

; <label>:10                                      ; preds = %5
  %rend7 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0), i32 %rbegin6) nounwind, !dbg !114 ; [#uses=0 type=i32] [debug line = 98:2]
  %row.1 = add nsw i32 %row, 1, !dbg !115         ; [#uses=1 type=i32] [debug line = 86:45]
  call void @llvm.dbg.value(metadata !{i32 %row.1}, i64 0, metadata !116), !dbg !115 ; [debug line = 86:45] [debug variable = row]
  br label %.preheader2, !dbg !115                ; [debug line = 86:45]

.preheader:                                       ; preds = %11, %.preheader.preheader
  %m = phi i32 [ %m.1, %11 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %n = phi i32 [ %n.1, %11 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %i4 = phi i32 [ %i.3, %11 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  %tmp.12 = icmp slt i32 %i4, %matrix_size, !dbg !89 ; [#uses=1 type=i1] [debug line = 102:29]
  br i1 %tmp.12, label %11, label %12, !dbg !89   ; [debug line = 102:29]

; <label>:11                                      ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !117 ; [debug line = 102:54]
  %rbegin2 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !117 ; [#uses=1 type=i32] [debug line = 102:54]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !119 ; [debug line = 103:1]
  %bufc.addr = getelementptr inbounds [256 x [256 x i32]]* %bufc, i32 0, i32 %m, i32 %n, !dbg !120 ; [#uses=1 type=i32*] [debug line = 104:28]
  %tmpData_c = load i32* %bufc.addr, align 4, !dbg !120 ; [#uses=2 type=i32] [debug line = 104:28]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %tmpData_c) nounwind
  call void @llvm.dbg.value(metadata !{i32 %tmpData_c}, i64 0, metadata !121), !dbg !120 ; [debug line = 104:28] [debug variable = tmpData_c]
  %c.addr = getelementptr inbounds i32* %c, i32 %i4, !dbg !122 ; [#uses=1 type=i32*] [debug line = 105:3]
  store i32 %tmpData_c, i32* %c.addr, align 4, !dbg !122 ; [debug line = 105:3]
  %tmp.14 = icmp eq i32 %n, %tmp, !dbg !123       ; [#uses=2 type=i1] [debug line = 106:3]
  %m.2 = add nsw i32 %m, 1, !dbg !124             ; [#uses=1 type=i32] [debug line = 107:4]
  call void @llvm.dbg.value(metadata !{i32 %m.2}, i64 0, metadata !126), !dbg !124 ; [debug line = 107:4] [debug variable = m]
  %n.2 = add nsw i32 %n, 1, !dbg !127             ; [#uses=1 type=i32] [debug line = 110:4]
  call void @llvm.dbg.value(metadata !{i32 %n.2}, i64 0, metadata !129), !dbg !127 ; [debug line = 110:4] [debug variable = n]
  %m.1 = select i1 %tmp.14, i32 %m.2, i32 %m, !dbg !123 ; [#uses=1 type=i32] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i32 %m.1}, i64 0, metadata !126), !dbg !123 ; [debug line = 106:3] [debug variable = m]
  %n.1 = select i1 %tmp.14, i32 0, i32 %n.2, !dbg !123 ; [#uses=1 type=i32] [debug line = 106:3]
  call void @llvm.dbg.value(metadata !{i32 %n.1}, i64 0, metadata !129), !dbg !123 ; [debug line = 106:3] [debug variable = n]
  %rend13 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0), i32 %rbegin2) nounwind, !dbg !130 ; [#uses=0 type=i32] [debug line = 112:2]
  %i.3 = add nsw i32 %i4, 1, !dbg !131            ; [#uses=1 type=i32] [debug line = 102:49]
  call void @llvm.dbg.value(metadata !{i32 %i.3}, i64 0, metadata !132), !dbg !131 ; [debug line = 102:49] [debug variable = i]
  br label %.preheader, !dbg !131                 ; [debug line = 102:49]

; <label>:12                                      ; preds = %.preheader
  ret void, !dbg !133                             ; [debug line = 113:1]
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

; [#uses=5]
declare void @_ssdm_SpecKeepArrayLoad(...)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!23}
!hls.encrypted.func = !{}

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
!30 = metadata !{i32 786689, metadata !5, metadata !"a", metadata !6, i32 16777267, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!31 = metadata !{i32 51, i32 23, metadata !5, null}
!32 = metadata !{i32 786689, metadata !5, metadata !"b", metadata !6, i32 33554483, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!33 = metadata !{i32 51, i32 31, metadata !5, null}
!34 = metadata !{i32 786689, metadata !5, metadata !"c", metadata !6, i32 50331699, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!35 = metadata !{i32 51, i32 39, metadata !5, null}
!36 = metadata !{i32 786689, metadata !5, metadata !"size", metadata !6, i32 67108915, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!37 = metadata !{i32 51, i32 46, metadata !5, null}
!38 = metadata !{i32 52, i32 1, metadata !39, null}
!39 = metadata !{i32 786443, metadata !5, i32 51, i32 52, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!40 = metadata !{i32 786688, metadata !39, metadata !"bufa", metadata !6, i32 53, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2097152, i64 32, i32 0, i32 0, metadata !10, metadata !42, i32 0, i32 0} ; [ DW_TAG_array_type ]
!42 = metadata !{metadata !43, metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!44 = metadata !{i32 53, i32 6, metadata !39, null}
!45 = metadata !{i32 786688, metadata !39, metadata !"bufb", metadata !6, i32 53, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 53, i32 22, metadata !39, null}
!47 = metadata !{i32 786688, metadata !39, metadata !"bufc", metadata !6, i32 53, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 53, i32 38, metadata !39, null}
!49 = metadata !{i32 54, i32 29, metadata !39, null}
!50 = metadata !{i32 786688, metadata !39, metadata !"matrix_size", metadata !6, i32 54, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 62, i32 3, metadata !52, null}
!52 = metadata !{i32 786443, metadata !53, i32 58, i32 54, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 786443, metadata !39, i32 58, i32 15, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!54 = metadata !{i32 58, i32 30, metadata !53, null}
!55 = metadata !{i32 72, i32 39, metadata !56, null}
!56 = metadata !{i32 786443, metadata !39, i32 72, i32 15, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 58, i32 55, metadata !52, null}
!58 = metadata !{i32 59, i32 1, metadata !52, null}
!59 = metadata !{i32 60, i32 22, metadata !52, null}
!60 = metadata !{i32 786688, metadata !52, metadata !"tmpData_a", metadata !6, i32 60, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!61 = metadata !{i32 61, i32 3, metadata !52, null}
!62 = metadata !{i32 63, i32 4, metadata !63, null}
!63 = metadata !{i32 786443, metadata !52, i32 62, i32 19, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!64 = metadata !{i32 786688, metadata !39, metadata !"x", metadata !6, i32 57, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 66, i32 4, metadata !66, null}
!66 = metadata !{i32 786443, metadata !52, i32 65, i32 8, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 786688, metadata !39, metadata !"y", metadata !6, i32 57, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 68, i32 2, metadata !52, null}
!69 = metadata !{i32 58, i32 50, metadata !53, null}
!70 = metadata !{i32 786688, metadata !53, metadata !"i", metadata !6, i32 58, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!71 = metadata !{i32 86, i32 31, metadata !72, null}
!72 = metadata !{i32 786443, metadata !39, i32 86, i32 15, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 72, i32 64, metadata !74, null}
!74 = metadata !{i32 786443, metadata !56, i32 72, i32 63, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 73, i32 1, metadata !74, null}
!76 = metadata !{i32 74, i32 22, metadata !74, null}
!77 = metadata !{i32 786688, metadata !74, metadata !"tmpData_b", metadata !6, i32 74, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!78 = metadata !{i32 75, i32 3, metadata !74, null}
!79 = metadata !{i32 76, i32 3, metadata !74, null}
!80 = metadata !{i32 77, i32 4, metadata !81, null}
!81 = metadata !{i32 786443, metadata !74, i32 76, i32 19, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!82 = metadata !{i32 786688, metadata !56, metadata !"x", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!83 = metadata !{i32 80, i32 4, metadata !84, null}
!84 = metadata !{i32 786443, metadata !74, i32 79, i32 8, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!85 = metadata !{i32 786688, metadata !56, metadata !"y", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!86 = metadata !{i32 82, i32 2, metadata !74, null}
!87 = metadata !{i32 72, i32 59, metadata !56, null}
!88 = metadata !{i32 786688, metadata !56, metadata !"i", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!89 = metadata !{i32 102, i32 29, metadata !90, null}
!90 = metadata !{i32 786443, metadata !39, i32 102, i32 14, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!91 = metadata !{i32 86, i32 53, metadata !92, null}
!92 = metadata !{i32 786443, metadata !72, i32 86, i32 52, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 87, i32 1, metadata !92, null}
!94 = metadata !{i32 88, i32 18, metadata !95, null}
!95 = metadata !{i32 786443, metadata !92, i32 88, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 88, i32 40, metadata !97, null}
!97 = metadata !{i32 786443, metadata !95, i32 88, i32 39, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!98 = metadata !{i32 89, i32 1, metadata !97, null}
!99 = metadata !{i32 91, i32 18, metadata !100, null}
!100 = metadata !{i32 786443, metadata !97, i32 91, i32 4, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!101 = metadata !{i32 91, i32 36, metadata !102, null}
!102 = metadata !{i32 786443, metadata !100, i32 91, i32 35, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 92, i32 1, metadata !102, null}
!104 = metadata !{i32 93, i32 1, metadata !102, null}
!105 = metadata !{i32 94, i32 2, metadata !102, null}
!106 = metadata !{i32 786688, metadata !97, metadata !"result", metadata !6, i32 90, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!107 = metadata !{i32 95, i32 4, metadata !102, null}
!108 = metadata !{i32 91, i32 30, metadata !100, null}
!109 = metadata !{i32 786688, metadata !100, metadata !"k", metadata !6, i32 91, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!110 = metadata !{i32 96, i32 4, metadata !97, null}
!111 = metadata !{i32 97, i32 3, metadata !97, null}
!112 = metadata !{i32 88, i32 32, metadata !95, null}
!113 = metadata !{i32 786688, metadata !95, metadata !"col", metadata !6, i32 88, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!114 = metadata !{i32 98, i32 2, metadata !92, null}
!115 = metadata !{i32 86, i32 45, metadata !72, null}
!116 = metadata !{i32 786688, metadata !72, metadata !"row", metadata !6, i32 86, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!117 = metadata !{i32 102, i32 54, metadata !118, null}
!118 = metadata !{i32 786443, metadata !90, i32 102, i32 53, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!119 = metadata !{i32 103, i32 1, metadata !118, null}
!120 = metadata !{i32 104, i32 28, metadata !118, null}
!121 = metadata !{i32 786688, metadata !118, metadata !"tmpData_c", metadata !6, i32 104, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!122 = metadata !{i32 105, i32 3, metadata !118, null}
!123 = metadata !{i32 106, i32 3, metadata !118, null}
!124 = metadata !{i32 107, i32 4, metadata !125, null}
!125 = metadata !{i32 786443, metadata !118, i32 106, i32 19, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!126 = metadata !{i32 786688, metadata !39, metadata !"m", metadata !6, i32 101, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!127 = metadata !{i32 110, i32 4, metadata !128, null}
!128 = metadata !{i32 786443, metadata !118, i32 109, i32 8, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!129 = metadata !{i32 786688, metadata !39, metadata !"n", metadata !6, i32 101, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!130 = metadata !{i32 112, i32 2, metadata !118, null}
!131 = metadata !{i32 102, i32 49, metadata !90, null}
!132 = metadata !{i32 786688, metadata !90, metadata !"i", metadata !6, i32 102, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!133 = metadata !{i32 113, i32 1, metadata !39, null}
