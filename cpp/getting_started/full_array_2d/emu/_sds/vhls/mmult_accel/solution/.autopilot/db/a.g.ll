; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/a.g.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct._IO_FILE_plus = type opaque

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str1 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1 ; [#uses=1 type=[6 x i8]*]
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str3 = private unnamed_addr constant [7 x i8] c"direct\00", align 1 ; [#uses=1 type=[7 x i8]*]
@.str4 = private unnamed_addr constant [2 x i8] c"c\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str5 = private unnamed_addr constant [2 x i8] c"b\00", align 1 ; [#uses=1 type=[2 x i8]*]
@.str6 = private unnamed_addr constant [12 x i8] c"read_data_a\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str7 = private unnamed_addr constant [12 x i8] c"read_data_b\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str8 = private unnamed_addr constant [12 x i8] c"matrix_mult\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str9 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str10 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str11 = private unnamed_addr constant [11 x i8] c"write_data\00", align 1 ; [#uses=1 type=[11 x i8]*]
@_IO_2_1_stdin_ = external global %struct._IO_FILE_plus ; [#uses=0 type=%struct._IO_FILE_plus*]
@_IO_2_1_stdout_ = external global %struct._IO_FILE_plus ; [#uses=0 type=%struct._IO_FILE_plus*]
@_IO_2_1_stderr_ = external global %struct._IO_FILE_plus ; [#uses=0 type=%struct._IO_FILE_plus*]
@sys_nerr = external global i32                   ; [#uses=0 type=i32*]
@_sys_nerr = external global i32                  ; [#uses=0 type=i32*]

; [#uses=0]
define void @_Z11mmult_accelPiS_S_i(i32* %a, i32* %b, i32* %c, i32 %size) nounwind {
  %1 = alloca i32*, align 4                       ; [#uses=3 type=i32**]
  %2 = alloca i32*, align 4                       ; [#uses=3 type=i32**]
  %3 = alloca i32*, align 4                       ; [#uses=3 type=i32**]
  %4 = alloca i32, align 4                        ; [#uses=9 type=i32*]
  %bufa = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %bufb = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %bufc = alloca [256 x [256 x i32]], align 4     ; [#uses=2 type=[256 x [256 x i32]]*]
  %matrix_size = alloca i32, align 4              ; [#uses=4 type=i32*]
  %x = alloca i32, align 4                        ; [#uses=4 type=i32*]
  %y = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %i = alloca i32, align 4                        ; [#uses=5 type=i32*]
  %tmpData_a = alloca i32, align 4                ; [#uses=2 type=i32*]
  %i1 = alloca i32, align 4                       ; [#uses=5 type=i32*]
  %x2 = alloca i32, align 4                       ; [#uses=4 type=i32*]
  %y3 = alloca i32, align 4                       ; [#uses=6 type=i32*]
  %tmpData_b = alloca i32, align 4                ; [#uses=2 type=i32*]
  %row = alloca i32, align 4                      ; [#uses=6 type=i32*]
  %col = alloca i32, align 4                      ; [#uses=6 type=i32*]
  %result = alloca i32, align 4                   ; [#uses=4 type=i32*]
  %k = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %m = alloca i32, align 4                        ; [#uses=4 type=i32*]
  %n = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %i4 = alloca i32, align 4                       ; [#uses=5 type=i32*]
  %tmpData_c = alloca i32, align 4                ; [#uses=2 type=i32*]
  store i32* %a, i32** %1, align 4
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !30), !dbg !31 ; [debug line = 51:23] [debug variable = a]
  store i32* %b, i32** %2, align 4
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !32), !dbg !33 ; [debug line = 51:31] [debug variable = b]
  store i32* %c, i32** %3, align 4
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !34), !dbg !35 ; [debug line = 51:39] [debug variable = c]
  store i32 %size, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !36), !dbg !37 ; [debug line = 51:46] [debug variable = size]
  call void (...)* @_ssdm_op_SpecLatency(i32 1, i32 65535, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  %5 = load i32** %1, align 4, !dbg !38           ; [#uses=1 type=i32*] [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %5, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  %6 = load i32** %3, align 4, !dbg !38           ; [#uses=1 type=i32*] [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %6, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  %7 = load i32** %2, align 4, !dbg !38           ; [#uses=1 type=i32*] [debug line = 52:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %7, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i32 16, i32 16, i32 16, i32 16, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !38 ; [debug line = 52:1]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufa}, metadata !40), !dbg !44 ; [debug line = 53:6] [debug variable = bufa]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufb}, metadata !45), !dbg !46 ; [debug line = 53:22] [debug variable = bufb]
  call void @llvm.dbg.declare(metadata !{[256 x [256 x i32]]* %bufc}, metadata !47), !dbg !48 ; [debug line = 53:38] [debug variable = bufc]
  call void @llvm.dbg.declare(metadata !{i32* %matrix_size}, metadata !49), !dbg !50 ; [debug line = 54:6] [debug variable = matrix_size]
  %8 = load i32* %4, align 4, !dbg !51            ; [#uses=1 type=i32] [debug line = 54:29]
  %9 = load i32* %4, align 4, !dbg !51            ; [#uses=1 type=i32] [debug line = 54:29]
  %10 = mul nsw i32 %8, %9, !dbg !51              ; [#uses=1 type=i32] [debug line = 54:29]
  store i32 %10, i32* %matrix_size, align 4, !dbg !51 ; [debug line = 54:29]
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !52), !dbg !53 ; [debug line = 57:6] [debug variable = x]
  store i32 0, i32* %x, align 4, !dbg !54         ; [debug line = 57:18]
  call void @llvm.dbg.declare(metadata !{i32* %y}, metadata !55), !dbg !56 ; [debug line = 57:13] [debug variable = y]
  store i32 0, i32* %y, align 4, !dbg !54         ; [debug line = 57:18]
  br label %11, !dbg !54                          ; [debug line = 57:18]

; <label>:11                                      ; preds = %0
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !57), !dbg !59 ; [debug line = 58:24] [debug variable = i]
  store i32 0, i32* %i, align 4, !dbg !60         ; [debug line = 58:30]
  br label %12, !dbg !60                          ; [debug line = 58:30]

; <label>:12                                      ; preds = %37, %11
  %13 = load i32* %i, align 4, !dbg !60           ; [#uses=1 type=i32] [debug line = 58:30]
  %14 = load i32* %matrix_size, align 4, !dbg !60 ; [#uses=1 type=i32] [debug line = 58:30]
  %15 = icmp slt i32 %13, %14, !dbg !60           ; [#uses=1 type=i1] [debug line = 58:30]
  br i1 %15, label %16, label %40, !dbg !60       ; [debug line = 58:30]

; <label>:16                                      ; preds = %12
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !61 ; [debug line = 58:55]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !61 ; [debug line = 58:55]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !63 ; [debug line = 59:1]
  call void @llvm.dbg.declare(metadata !{i32* %tmpData_a}, metadata !64), !dbg !65 ; [debug line = 60:6] [debug variable = tmpData_a]
  %17 = load i32* %i, align 4, !dbg !66           ; [#uses=1 type=i32] [debug line = 60:22]
  %18 = load i32** %1, align 4, !dbg !66          ; [#uses=1 type=i32*] [debug line = 60:22]
  %19 = getelementptr inbounds i32* %18, i32 %17, !dbg !66 ; [#uses=1 type=i32*] [debug line = 60:22]
  %20 = load i32* %19, align 4, !dbg !66          ; [#uses=1 type=i32] [debug line = 60:22]
  store i32 %20, i32* %tmpData_a, align 4, !dbg !66 ; [debug line = 60:22]
  %21 = load i32* %tmpData_a, align 4, !dbg !67   ; [#uses=1 type=i32] [debug line = 61:3]
  %22 = load i32* %y, align 4, !dbg !67           ; [#uses=1 type=i32] [debug line = 61:3]
  %23 = load i32* %x, align 4, !dbg !67           ; [#uses=1 type=i32] [debug line = 61:3]
  %24 = getelementptr inbounds [256 x [256 x i32]]* %bufa, i32 0, i32 %23, !dbg !67 ; [#uses=1 type=[256 x i32]*] [debug line = 61:3]
  %25 = getelementptr inbounds [256 x i32]* %24, i32 0, i32 %22, !dbg !67 ; [#uses=1 type=i32*] [debug line = 61:3]
  store i32 %21, i32* %25, align 4, !dbg !67      ; [debug line = 61:3]
  %26 = load i32* %y, align 4, !dbg !68           ; [#uses=1 type=i32] [debug line = 62:3]
  %27 = load i32* %4, align 4, !dbg !68           ; [#uses=1 type=i32] [debug line = 62:3]
  %28 = sub nsw i32 %27, 1, !dbg !68              ; [#uses=1 type=i32] [debug line = 62:3]
  %29 = icmp eq i32 %26, %28, !dbg !68            ; [#uses=1 type=i1] [debug line = 62:3]
  br i1 %29, label %30, label %33, !dbg !68       ; [debug line = 62:3]

; <label>:30                                      ; preds = %16
  %31 = load i32* %x, align 4, !dbg !69           ; [#uses=1 type=i32] [debug line = 63:4]
  %32 = add nsw i32 %31, 1, !dbg !69              ; [#uses=1 type=i32] [debug line = 63:4]
  store i32 %32, i32* %x, align 4, !dbg !69       ; [debug line = 63:4]
  store i32 0, i32* %y, align 4, !dbg !71         ; [debug line = 64:4]
  br label %36, !dbg !72                          ; [debug line = 65:3]

; <label>:33                                      ; preds = %16
  %34 = load i32* %y, align 4, !dbg !73           ; [#uses=1 type=i32] [debug line = 66:4]
  %35 = add nsw i32 %34, 1, !dbg !73              ; [#uses=1 type=i32] [debug line = 66:4]
  store i32 %35, i32* %y, align 4, !dbg !73       ; [debug line = 66:4]
  br label %36

; <label>:36                                      ; preds = %33, %30
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !75 ; [debug line = 68:2]
  br label %37, !dbg !75                          ; [debug line = 68:2]

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4, !dbg !76           ; [#uses=1 type=i32] [debug line = 58:50]
  %39 = add nsw i32 %38, 1, !dbg !76              ; [#uses=1 type=i32] [debug line = 58:50]
  store i32 %39, i32* %i, align 4, !dbg !76       ; [debug line = 58:50]
  br label %12, !dbg !76                          ; [debug line = 58:50]

; <label>:40                                      ; preds = %12
  br label %41, !dbg !77                          ; [debug line = 68:2]

; <label>:41                                      ; preds = %40
  call void @llvm.dbg.declare(metadata !{i32* %i1}, metadata !78), !dbg !80 ; [debug line = 72:24] [debug variable = i]
  store i32 0, i32* %i1, align 4, !dbg !81        ; [debug line = 72:39]
  call void @llvm.dbg.declare(metadata !{i32* %x2}, metadata !82), !dbg !83 ; [debug line = 72:31] [debug variable = x]
  store i32 0, i32* %x2, align 4, !dbg !81        ; [debug line = 72:39]
  call void @llvm.dbg.declare(metadata !{i32* %y3}, metadata !84), !dbg !85 ; [debug line = 72:36] [debug variable = y]
  store i32 0, i32* %y3, align 4, !dbg !81        ; [debug line = 72:39]
  br label %42, !dbg !81                          ; [debug line = 72:39]

; <label>:42                                      ; preds = %67, %41
  %43 = load i32* %i1, align 4, !dbg !81          ; [#uses=1 type=i32] [debug line = 72:39]
  %44 = load i32* %matrix_size, align 4, !dbg !81 ; [#uses=1 type=i32] [debug line = 72:39]
  %45 = icmp slt i32 %43, %44, !dbg !81           ; [#uses=1 type=i1] [debug line = 72:39]
  br i1 %45, label %46, label %70, !dbg !81       ; [debug line = 72:39]

; <label>:46                                      ; preds = %42
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !86 ; [debug line = 72:64]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !86 ; [debug line = 72:64]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !88 ; [debug line = 73:1]
  call void @llvm.dbg.declare(metadata !{i32* %tmpData_b}, metadata !89), !dbg !90 ; [debug line = 74:6] [debug variable = tmpData_b]
  %47 = load i32* %i1, align 4, !dbg !91          ; [#uses=1 type=i32] [debug line = 74:22]
  %48 = load i32** %2, align 4, !dbg !91          ; [#uses=1 type=i32*] [debug line = 74:22]
  %49 = getelementptr inbounds i32* %48, i32 %47, !dbg !91 ; [#uses=1 type=i32*] [debug line = 74:22]
  %50 = load i32* %49, align 4, !dbg !91          ; [#uses=1 type=i32] [debug line = 74:22]
  store i32 %50, i32* %tmpData_b, align 4, !dbg !91 ; [debug line = 74:22]
  %51 = load i32* %tmpData_b, align 4, !dbg !92   ; [#uses=1 type=i32] [debug line = 75:3]
  %52 = load i32* %y3, align 4, !dbg !92          ; [#uses=1 type=i32] [debug line = 75:3]
  %53 = load i32* %x2, align 4, !dbg !92          ; [#uses=1 type=i32] [debug line = 75:3]
  %54 = getelementptr inbounds [256 x [256 x i32]]* %bufb, i32 0, i32 %53, !dbg !92 ; [#uses=1 type=[256 x i32]*] [debug line = 75:3]
  %55 = getelementptr inbounds [256 x i32]* %54, i32 0, i32 %52, !dbg !92 ; [#uses=1 type=i32*] [debug line = 75:3]
  store i32 %51, i32* %55, align 4, !dbg !92      ; [debug line = 75:3]
  %56 = load i32* %y3, align 4, !dbg !93          ; [#uses=1 type=i32] [debug line = 76:3]
  %57 = load i32* %4, align 4, !dbg !93           ; [#uses=1 type=i32] [debug line = 76:3]
  %58 = sub nsw i32 %57, 1, !dbg !93              ; [#uses=1 type=i32] [debug line = 76:3]
  %59 = icmp eq i32 %56, %58, !dbg !93            ; [#uses=1 type=i1] [debug line = 76:3]
  br i1 %59, label %60, label %63, !dbg !93       ; [debug line = 76:3]

; <label>:60                                      ; preds = %46
  %61 = load i32* %x2, align 4, !dbg !94          ; [#uses=1 type=i32] [debug line = 77:4]
  %62 = add nsw i32 %61, 1, !dbg !94              ; [#uses=1 type=i32] [debug line = 77:4]
  store i32 %62, i32* %x2, align 4, !dbg !94      ; [debug line = 77:4]
  store i32 0, i32* %y3, align 4, !dbg !96        ; [debug line = 78:4]
  br label %66, !dbg !97                          ; [debug line = 79:3]

; <label>:63                                      ; preds = %46
  %64 = load i32* %y3, align 4, !dbg !98          ; [#uses=1 type=i32] [debug line = 80:4]
  %65 = add nsw i32 %64, 1, !dbg !98              ; [#uses=1 type=i32] [debug line = 80:4]
  store i32 %65, i32* %y3, align 4, !dbg !98      ; [debug line = 80:4]
  br label %66

; <label>:66                                      ; preds = %63, %60
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !100 ; [debug line = 82:2]
  br label %67, !dbg !100                         ; [debug line = 82:2]

; <label>:67                                      ; preds = %66
  %68 = load i32* %i1, align 4, !dbg !101         ; [#uses=1 type=i32] [debug line = 72:59]
  %69 = add nsw i32 %68, 1, !dbg !101             ; [#uses=1 type=i32] [debug line = 72:59]
  store i32 %69, i32* %i1, align 4, !dbg !101     ; [debug line = 72:59]
  br label %42, !dbg !101                         ; [debug line = 72:59]

; <label>:70                                      ; preds = %42
  br label %71, !dbg !102                         ; [debug line = 82:2]

; <label>:71                                      ; preds = %70
  call void @llvm.dbg.declare(metadata !{i32* %row}, metadata !103), !dbg !105 ; [debug line = 86:24] [debug variable = row]
  store i32 0, i32* %row, align 4, !dbg !106      ; [debug line = 86:31]
  br label %72, !dbg !106                         ; [debug line = 86:31]

; <label>:72                                      ; preds = %113, %71
  %73 = load i32* %row, align 4, !dbg !106        ; [#uses=1 type=i32] [debug line = 86:31]
  %74 = load i32* %4, align 4, !dbg !106          ; [#uses=1 type=i32] [debug line = 86:31]
  %75 = icmp slt i32 %73, %74, !dbg !106          ; [#uses=1 type=i1] [debug line = 86:31]
  br i1 %75, label %76, label %116, !dbg !106     ; [debug line = 86:31]

; <label>:76                                      ; preds = %72
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !107 ; [debug line = 86:53]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !107 ; [debug line = 86:53]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !109 ; [debug line = 87:1]
  call void @llvm.dbg.declare(metadata !{i32* %col}, metadata !110), !dbg !112 ; [debug line = 88:11] [debug variable = col]
  store i32 0, i32* %col, align 4, !dbg !113      ; [debug line = 88:18]
  br label %77, !dbg !113                         ; [debug line = 88:18]

; <label>:77                                      ; preds = %109, %76
  %78 = load i32* %col, align 4, !dbg !113        ; [#uses=1 type=i32] [debug line = 88:18]
  %79 = load i32* %4, align 4, !dbg !113          ; [#uses=1 type=i32] [debug line = 88:18]
  %80 = icmp slt i32 %78, %79, !dbg !113          ; [#uses=1 type=i1] [debug line = 88:18]
  br i1 %80, label %81, label %112, !dbg !113     ; [debug line = 88:18]

; <label>:81                                      ; preds = %77
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0)) nounwind, !dbg !114 ; [debug line = 88:40]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !116 ; [debug line = 89:1]
  call void @llvm.dbg.declare(metadata !{i32* %result}, metadata !117), !dbg !118 ; [debug line = 90:6] [debug variable = result]
  store i32 0, i32* %result, align 4, !dbg !119   ; [debug line = 90:16]
  call void @llvm.dbg.declare(metadata !{i32* %k}, metadata !120), !dbg !122 ; [debug line = 91:13] [debug variable = k]
  store i32 0, i32* %k, align 4, !dbg !123        ; [debug line = 91:18]
  br label %82, !dbg !123                         ; [debug line = 91:18]

; <label>:82                                      ; preds = %100, %81
  %83 = load i32* %k, align 4, !dbg !123          ; [#uses=1 type=i32] [debug line = 91:18]
  %84 = load i32* %4, align 4, !dbg !123          ; [#uses=1 type=i32] [debug line = 91:18]
  %85 = icmp slt i32 %83, %84, !dbg !123          ; [#uses=1 type=i1] [debug line = 91:18]
  br i1 %85, label %86, label %103, !dbg !123     ; [debug line = 91:18]

; <label>:86                                      ; preds = %82
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !124 ; [debug line = 91:36]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 256, i32 128, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !126 ; [debug line = 92:1]
  call void (...)* @_ssdm_op_SpecPipeline(i32 -1, i32 1, i32 1, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !127 ; [debug line = 93:1]
  %87 = load i32* %k, align 4, !dbg !128          ; [#uses=1 type=i32] [debug line = 94:2]
  %88 = load i32* %row, align 4, !dbg !128        ; [#uses=1 type=i32] [debug line = 94:2]
  %89 = getelementptr inbounds [256 x [256 x i32]]* %bufa, i32 0, i32 %88, !dbg !128 ; [#uses=1 type=[256 x i32]*] [debug line = 94:2]
  %90 = getelementptr inbounds [256 x i32]* %89, i32 0, i32 %87, !dbg !128 ; [#uses=1 type=i32*] [debug line = 94:2]
  %91 = load i32* %90, align 4, !dbg !128         ; [#uses=1 type=i32] [debug line = 94:2]
  %92 = load i32* %col, align 4, !dbg !128        ; [#uses=1 type=i32] [debug line = 94:2]
  %93 = load i32* %k, align 4, !dbg !128          ; [#uses=1 type=i32] [debug line = 94:2]
  %94 = getelementptr inbounds [256 x [256 x i32]]* %bufb, i32 0, i32 %93, !dbg !128 ; [#uses=1 type=[256 x i32]*] [debug line = 94:2]
  %95 = getelementptr inbounds [256 x i32]* %94, i32 0, i32 %92, !dbg !128 ; [#uses=1 type=i32*] [debug line = 94:2]
  %96 = load i32* %95, align 4, !dbg !128         ; [#uses=1 type=i32] [debug line = 94:2]
  %97 = mul nsw i32 %91, %96, !dbg !128           ; [#uses=1 type=i32] [debug line = 94:2]
  %98 = load i32* %result, align 4, !dbg !128     ; [#uses=1 type=i32] [debug line = 94:2]
  %99 = add nsw i32 %98, %97, !dbg !128           ; [#uses=1 type=i32] [debug line = 94:2]
  store i32 %99, i32* %result, align 4, !dbg !128 ; [debug line = 94:2]
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !129 ; [debug line = 95:4]
  br label %100, !dbg !129                        ; [debug line = 95:4]

; <label>:100                                     ; preds = %86
  %101 = load i32* %k, align 4, !dbg !130         ; [#uses=1 type=i32] [debug line = 91:30]
  %102 = add nsw i32 %101, 1, !dbg !130           ; [#uses=1 type=i32] [debug line = 91:30]
  store i32 %102, i32* %k, align 4, !dbg !130     ; [debug line = 91:30]
  br label %82, !dbg !130                         ; [debug line = 91:30]

; <label>:103                                     ; preds = %82
  %104 = load i32* %result, align 4, !dbg !131    ; [#uses=1 type=i32] [debug line = 96:4]
  %105 = load i32* %col, align 4, !dbg !131       ; [#uses=1 type=i32] [debug line = 96:4]
  %106 = load i32* %row, align 4, !dbg !131       ; [#uses=1 type=i32] [debug line = 96:4]
  %107 = getelementptr inbounds [256 x [256 x i32]]* %bufc, i32 0, i32 %106, !dbg !131 ; [#uses=1 type=[256 x i32]*] [debug line = 96:4]
  %108 = getelementptr inbounds [256 x i32]* %107, i32 0, i32 %105, !dbg !131 ; [#uses=1 type=i32*] [debug line = 96:4]
  store i32 %104, i32* %108, align 4, !dbg !131   ; [debug line = 96:4]
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0)) nounwind, !dbg !132 ; [debug line = 97:3]
  br label %109, !dbg !132                        ; [debug line = 97:3]

; <label>:109                                     ; preds = %103
  %110 = load i32* %col, align 4, !dbg !133       ; [#uses=1 type=i32] [debug line = 88:32]
  %111 = add nsw i32 %110, 1, !dbg !133           ; [#uses=1 type=i32] [debug line = 88:32]
  store i32 %111, i32* %col, align 4, !dbg !133   ; [debug line = 88:32]
  br label %77, !dbg !133                         ; [debug line = 88:32]

; <label>:112                                     ; preds = %77
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !134 ; [debug line = 98:2]
  br label %113, !dbg !134                        ; [debug line = 98:2]

; <label>:113                                     ; preds = %112
  %114 = load i32* %row, align 4, !dbg !135       ; [#uses=1 type=i32] [debug line = 86:45]
  %115 = add nsw i32 %114, 1, !dbg !135           ; [#uses=1 type=i32] [debug line = 86:45]
  store i32 %115, i32* %row, align 4, !dbg !135   ; [debug line = 86:45]
  br label %72, !dbg !135                         ; [debug line = 86:45]

; <label>:116                                     ; preds = %72
  call void @llvm.dbg.declare(metadata !{i32* %m}, metadata !136), !dbg !137 ; [debug line = 101:6] [debug variable = m]
  store i32 0, i32* %m, align 4, !dbg !138        ; [debug line = 101:18]
  call void @llvm.dbg.declare(metadata !{i32* %n}, metadata !139), !dbg !140 ; [debug line = 101:13] [debug variable = n]
  store i32 0, i32* %n, align 4, !dbg !138        ; [debug line = 101:18]
  br label %117, !dbg !138                        ; [debug line = 101:18]

; <label>:117                                     ; preds = %116
  call void @llvm.dbg.declare(metadata !{i32* %i4}, metadata !141), !dbg !143 ; [debug line = 102:23] [debug variable = i]
  store i32 0, i32* %i4, align 4, !dbg !144       ; [debug line = 102:29]
  br label %118, !dbg !144                        ; [debug line = 102:29]

; <label>:118                                     ; preds = %143, %117
  %119 = load i32* %i4, align 4, !dbg !144        ; [#uses=1 type=i32] [debug line = 102:29]
  %120 = load i32* %matrix_size, align 4, !dbg !144 ; [#uses=1 type=i32] [debug line = 102:29]
  %121 = icmp slt i32 %119, %120, !dbg !144       ; [#uses=1 type=i1] [debug line = 102:29]
  br i1 %121, label %122, label %146, !dbg !144   ; [debug line = 102:29]

; <label>:122                                     ; preds = %118
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !145 ; [debug line = 102:54]
  call void (...)* @_ssdm_RegionBegin(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !145 ; [debug line = 102:54]
  call void (...)* @_ssdm_op_SpecLoopTripCount(i32 1, i32 65536, i32 32768, i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !147 ; [debug line = 103:1]
  call void @llvm.dbg.declare(metadata !{i32* %tmpData_c}, metadata !148), !dbg !149 ; [debug line = 104:6] [debug variable = tmpData_c]
  %123 = load i32* %n, align 4, !dbg !150         ; [#uses=1 type=i32] [debug line = 104:28]
  %124 = load i32* %m, align 4, !dbg !150         ; [#uses=1 type=i32] [debug line = 104:28]
  %125 = getelementptr inbounds [256 x [256 x i32]]* %bufc, i32 0, i32 %124, !dbg !150 ; [#uses=1 type=[256 x i32]*] [debug line = 104:28]
  %126 = getelementptr inbounds [256 x i32]* %125, i32 0, i32 %123, !dbg !150 ; [#uses=1 type=i32*] [debug line = 104:28]
  %127 = load i32* %126, align 4, !dbg !150       ; [#uses=1 type=i32] [debug line = 104:28]
  store i32 %127, i32* %tmpData_c, align 4, !dbg !150 ; [debug line = 104:28]
  %128 = load i32* %tmpData_c, align 4, !dbg !151 ; [#uses=1 type=i32] [debug line = 105:3]
  %129 = load i32* %i4, align 4, !dbg !151        ; [#uses=1 type=i32] [debug line = 105:3]
  %130 = load i32** %3, align 4, !dbg !151        ; [#uses=1 type=i32*] [debug line = 105:3]
  %131 = getelementptr inbounds i32* %130, i32 %129, !dbg !151 ; [#uses=1 type=i32*] [debug line = 105:3]
  store i32 %128, i32* %131, align 4, !dbg !151   ; [debug line = 105:3]
  %132 = load i32* %n, align 4, !dbg !152         ; [#uses=1 type=i32] [debug line = 106:3]
  %133 = load i32* %4, align 4, !dbg !152         ; [#uses=1 type=i32] [debug line = 106:3]
  %134 = sub nsw i32 %133, 1, !dbg !152           ; [#uses=1 type=i32] [debug line = 106:3]
  %135 = icmp eq i32 %132, %134, !dbg !152        ; [#uses=1 type=i1] [debug line = 106:3]
  br i1 %135, label %136, label %139, !dbg !152   ; [debug line = 106:3]

; <label>:136                                     ; preds = %122
  %137 = load i32* %m, align 4, !dbg !153         ; [#uses=1 type=i32] [debug line = 107:4]
  %138 = add nsw i32 %137, 1, !dbg !153           ; [#uses=1 type=i32] [debug line = 107:4]
  store i32 %138, i32* %m, align 4, !dbg !153     ; [debug line = 107:4]
  store i32 0, i32* %n, align 4, !dbg !155        ; [debug line = 108:4]
  br label %142, !dbg !156                        ; [debug line = 109:3]

; <label>:139                                     ; preds = %122
  %140 = load i32* %n, align 4, !dbg !157         ; [#uses=1 type=i32] [debug line = 110:4]
  %141 = add nsw i32 %140, 1, !dbg !157           ; [#uses=1 type=i32] [debug line = 110:4]
  store i32 %141, i32* %n, align 4, !dbg !157     ; [debug line = 110:4]
  br label %142

; <label>:142                                     ; preds = %139, %136
  call void (...)* @_ssdm_RegionEnd(i8* getelementptr inbounds ([11 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !159 ; [debug line = 112:2]
  br label %143, !dbg !159                        ; [debug line = 112:2]

; <label>:143                                     ; preds = %142
  %144 = load i32* %i4, align 4, !dbg !160        ; [#uses=1 type=i32] [debug line = 102:49]
  %145 = add nsw i32 %144, 1, !dbg !160           ; [#uses=1 type=i32] [debug line = 102:49]
  store i32 %145, i32* %i4, align 4, !dbg !160    ; [debug line = 102:49]
  br label %118, !dbg !160                        ; [debug line = 102:49]

; <label>:146                                     ; preds = %118
  ret void, !dbg !161                             ; [debug line = 113:1]
}

; [#uses=24]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecLatency(...) nounwind

; [#uses=3]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=4]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=6]
declare void @_ssdm_RegionBegin(...) nounwind

; [#uses=6]
declare void @_ssdm_op_SpecLoopTripCount(...) nounwind

; [#uses=6]
declare void @_ssdm_RegionEnd(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecPipeline(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!23}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls/mmult_accel/solution/.autopilot/db/mmult.pragma.2.cpp", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !13} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"mmult_accel", metadata !"mmult_accel", metadata !"_Z11mmult_accelPiS_S_i", metadata !6, i32 51, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32*, i32)* @_Z11mmult_accelPiS_S_i, null, null, metadata !11, i32 51} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/src/mmult.cpp", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !10}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !18, metadata !19, metadata !20, metadata !22}
!15 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdin_", metadata !"_IO_2_1_stdin_", metadata !"", metadata !16, i32 346, metadata !17, i32 0, i32 1, %struct._IO_FILE_plus* @_IO_2_1_stdin_} ; [ DW_TAG_variable ]
!16 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786434, null, metadata !"_IO_FILE_plus", metadata !16, i32 344, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_class_type ]
!18 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdout_", metadata !"_IO_2_1_stdout_", metadata !"", metadata !16, i32 347, metadata !17, i32 0, i32 1, %struct._IO_FILE_plus* @_IO_2_1_stdout_} ; [ DW_TAG_variable ]
!19 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stderr_", metadata !"_IO_2_1_stderr_", metadata !"", metadata !16, i32 348, metadata !17, i32 0, i32 1, %struct._IO_FILE_plus* @_IO_2_1_stderr_} ; [ DW_TAG_variable ]
!20 = metadata !{i32 786484, i32 0, null, metadata !"sys_nerr", metadata !"sys_nerr", metadata !"", metadata !21, i32 27, metadata !10, i32 0, i32 1, i32* @sys_nerr} ; [ DW_TAG_variable ]
!21 = metadata !{i32 786473, metadata !"/usr/include/bits/sys_errlist.h", metadata !"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/full_array_2d/emu/_sds/vhls", null} ; [ DW_TAG_file_type ]
!22 = metadata !{i32 786484, i32 0, null, metadata !"_sys_nerr", metadata !"_sys_nerr", metadata !"", metadata !21, i32 31, metadata !10, i32 0, i32 1, i32* @_sys_nerr} ; [ DW_TAG_variable ]
!23 = metadata !{void (i32*, i32*, i32*, i32)* @_Z11mmult_accelPiS_S_i, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29}
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
!49 = metadata !{i32 786688, metadata !39, metadata !"matrix_size", metadata !6, i32 54, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!50 = metadata !{i32 54, i32 6, metadata !39, null}
!51 = metadata !{i32 54, i32 29, metadata !39, null}
!52 = metadata !{i32 786688, metadata !39, metadata !"x", metadata !6, i32 57, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 57, i32 6, metadata !39, null}
!54 = metadata !{i32 57, i32 18, metadata !39, null}
!55 = metadata !{i32 786688, metadata !39, metadata !"y", metadata !6, i32 57, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 57, i32 13, metadata !39, null}
!57 = metadata !{i32 786688, metadata !58, metadata !"i", metadata !6, i32 58, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 786443, metadata !39, i32 58, i32 15, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 58, i32 24, metadata !58, null}
!60 = metadata !{i32 58, i32 30, metadata !58, null}
!61 = metadata !{i32 58, i32 55, metadata !62, null}
!62 = metadata !{i32 786443, metadata !58, i32 58, i32 54, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!63 = metadata !{i32 59, i32 1, metadata !62, null}
!64 = metadata !{i32 786688, metadata !62, metadata !"tmpData_a", metadata !6, i32 60, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 60, i32 6, metadata !62, null}
!66 = metadata !{i32 60, i32 22, metadata !62, null}
!67 = metadata !{i32 61, i32 3, metadata !62, null}
!68 = metadata !{i32 62, i32 3, metadata !62, null}
!69 = metadata !{i32 63, i32 4, metadata !70, null}
!70 = metadata !{i32 786443, metadata !62, i32 62, i32 19, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!71 = metadata !{i32 64, i32 4, metadata !70, null}
!72 = metadata !{i32 65, i32 3, metadata !70, null}
!73 = metadata !{i32 66, i32 4, metadata !74, null}
!74 = metadata !{i32 786443, metadata !62, i32 65, i32 8, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 68, i32 2, metadata !62, null}
!76 = metadata !{i32 58, i32 50, metadata !58, null}
!77 = metadata !{i32 68, i32 2, metadata !58, null}
!78 = metadata !{i32 786688, metadata !79, metadata !"i", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!79 = metadata !{i32 786443, metadata !39, i32 72, i32 15, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 72, i32 24, metadata !79, null}
!81 = metadata !{i32 72, i32 39, metadata !79, null}
!82 = metadata !{i32 786688, metadata !79, metadata !"x", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!83 = metadata !{i32 72, i32 31, metadata !79, null}
!84 = metadata !{i32 786688, metadata !79, metadata !"y", metadata !6, i32 72, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!85 = metadata !{i32 72, i32 36, metadata !79, null}
!86 = metadata !{i32 72, i32 64, metadata !87, null}
!87 = metadata !{i32 786443, metadata !79, i32 72, i32 63, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!88 = metadata !{i32 73, i32 1, metadata !87, null}
!89 = metadata !{i32 786688, metadata !87, metadata !"tmpData_b", metadata !6, i32 74, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!90 = metadata !{i32 74, i32 6, metadata !87, null}
!91 = metadata !{i32 74, i32 22, metadata !87, null}
!92 = metadata !{i32 75, i32 3, metadata !87, null}
!93 = metadata !{i32 76, i32 3, metadata !87, null}
!94 = metadata !{i32 77, i32 4, metadata !95, null}
!95 = metadata !{i32 786443, metadata !87, i32 76, i32 19, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 78, i32 4, metadata !95, null}
!97 = metadata !{i32 79, i32 3, metadata !95, null}
!98 = metadata !{i32 80, i32 4, metadata !99, null}
!99 = metadata !{i32 786443, metadata !87, i32 79, i32 8, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!100 = metadata !{i32 82, i32 2, metadata !87, null}
!101 = metadata !{i32 72, i32 59, metadata !79, null}
!102 = metadata !{i32 82, i32 2, metadata !79, null}
!103 = metadata !{i32 786688, metadata !104, metadata !"row", metadata !6, i32 86, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!104 = metadata !{i32 786443, metadata !39, i32 86, i32 15, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!105 = metadata !{i32 86, i32 24, metadata !104, null}
!106 = metadata !{i32 86, i32 31, metadata !104, null}
!107 = metadata !{i32 86, i32 53, metadata !108, null}
!108 = metadata !{i32 786443, metadata !104, i32 86, i32 52, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!109 = metadata !{i32 87, i32 1, metadata !108, null}
!110 = metadata !{i32 786688, metadata !111, metadata !"col", metadata !6, i32 88, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!111 = metadata !{i32 786443, metadata !108, i32 88, i32 2, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 88, i32 11, metadata !111, null}
!113 = metadata !{i32 88, i32 18, metadata !111, null}
!114 = metadata !{i32 88, i32 40, metadata !115, null}
!115 = metadata !{i32 786443, metadata !111, i32 88, i32 39, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 89, i32 1, metadata !115, null}
!117 = metadata !{i32 786688, metadata !115, metadata !"result", metadata !6, i32 90, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!118 = metadata !{i32 90, i32 6, metadata !115, null}
!119 = metadata !{i32 90, i32 16, metadata !115, null}
!120 = metadata !{i32 786688, metadata !121, metadata !"k", metadata !6, i32 91, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!121 = metadata !{i32 786443, metadata !115, i32 91, i32 4, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!122 = metadata !{i32 91, i32 13, metadata !121, null}
!123 = metadata !{i32 91, i32 18, metadata !121, null}
!124 = metadata !{i32 91, i32 36, metadata !125, null}
!125 = metadata !{i32 786443, metadata !121, i32 91, i32 35, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!126 = metadata !{i32 92, i32 1, metadata !125, null}
!127 = metadata !{i32 93, i32 1, metadata !125, null}
!128 = metadata !{i32 94, i32 2, metadata !125, null}
!129 = metadata !{i32 95, i32 4, metadata !125, null}
!130 = metadata !{i32 91, i32 30, metadata !121, null}
!131 = metadata !{i32 96, i32 4, metadata !115, null}
!132 = metadata !{i32 97, i32 3, metadata !115, null}
!133 = metadata !{i32 88, i32 32, metadata !111, null}
!134 = metadata !{i32 98, i32 2, metadata !108, null}
!135 = metadata !{i32 86, i32 45, metadata !104, null}
!136 = metadata !{i32 786688, metadata !39, metadata !"m", metadata !6, i32 101, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!137 = metadata !{i32 101, i32 6, metadata !39, null}
!138 = metadata !{i32 101, i32 18, metadata !39, null}
!139 = metadata !{i32 786688, metadata !39, metadata !"n", metadata !6, i32 101, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!140 = metadata !{i32 101, i32 13, metadata !39, null}
!141 = metadata !{i32 786688, metadata !142, metadata !"i", metadata !6, i32 102, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!142 = metadata !{i32 786443, metadata !39, i32 102, i32 14, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!143 = metadata !{i32 102, i32 23, metadata !142, null}
!144 = metadata !{i32 102, i32 29, metadata !142, null}
!145 = metadata !{i32 102, i32 54, metadata !146, null}
!146 = metadata !{i32 786443, metadata !142, i32 102, i32 53, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!147 = metadata !{i32 103, i32 1, metadata !146, null}
!148 = metadata !{i32 786688, metadata !146, metadata !"tmpData_c", metadata !6, i32 104, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!149 = metadata !{i32 104, i32 6, metadata !146, null}
!150 = metadata !{i32 104, i32 28, metadata !146, null}
!151 = metadata !{i32 105, i32 3, metadata !146, null}
!152 = metadata !{i32 106, i32 3, metadata !146, null}
!153 = metadata !{i32 107, i32 4, metadata !154, null}
!154 = metadata !{i32 786443, metadata !146, i32 106, i32 19, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!155 = metadata !{i32 108, i32 4, metadata !154, null}
!156 = metadata !{i32 109, i32 3, metadata !154, null}
!157 = metadata !{i32 110, i32 4, metadata !158, null}
!158 = metadata !{i32 786443, metadata !146, i32 109, i32 8, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!159 = metadata !{i32 112, i32 2, metadata !146, null}
!160 = metadata !{i32 102, i32 49, metadata !142, null}
!161 = metadata !{i32 113, i32 1, metadata !39, null}
