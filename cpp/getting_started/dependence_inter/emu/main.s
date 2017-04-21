; ModuleID = '/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/main.cpp'
source_filename = "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/main.cpp"
target datalayout = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7--linux-gnueabihf"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i32, i32, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i32 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i32, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type { i32 (...)**, i32 }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet", i32*, i8, [3 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [2 x i8] }>
%"class.std::num_put" = type { %"class.std::locale::facet" }
%"class.std::num_get" = type { %"class.std::locale::facet" }
%"class.sds_utils::perf_counter" = type { i64, i64, i64 }

$_ZN9sds_utils12perf_counterC2Ev = comdat any

$_ZN9sds_utils12perf_counter5startEv = comdat any

$_ZN9sds_utils12perf_counter4stopEv = comdat any

$_ZN9sds_utils12perf_counter14avg_cpu_cyclesEv = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cout = external global %"class.std::basic_ostream", align 4
@.str = private unnamed_addr constant [57 x i8] c"Average number of CPU cycles running mmult in hardware: \00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"Result = \00", align 1
@.str.2 = private unnamed_addr constant [23 x i8] c"Error: Result mismatch\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"i = \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c" CPU result = \00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c" Device result = \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"TEST FAILED.\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"TEST PASSED.\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_main.cpp, i8* null }]

define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !966 {
  %1 = call %"class.std::ios_base::Init"* @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !967
  %2 = call i32 @__cxa_atexit(void (i8*)* bitcast (%"class.std::ios_base::Init"* (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !968
  ret void, !dbg !967
}

declare !xidane.fname !970 !xidane.function_declaration_type !971 !xidane.function_declaration_filename !972 %"class.std::ios_base::Init"* @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* returned) unnamed_addr #1

; Function Attrs: nounwind
declare !xidane.fname !973 !xidane.function_declaration_type !971 !xidane.function_declaration_filename !972 %"class.std::ios_base::Init"* @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* returned) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: nounwind
define void @_Z10mean_valuePiS_i(i32*, i32*, i32) #4 !dbg !974 !xidane.fname !977 !xidane.function_declaration_type !978 !xidane.function_declaration_filename !979 {
  %4 = alloca i32*, align 4
  %5 = alloca i32*, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %4, align 4
  call void @llvm.dbg.declare(metadata i32** %4, metadata !980, metadata !981), !dbg !982
  store i32* %1, i32** %5, align 4
  call void @llvm.dbg.declare(metadata i32** %5, metadata !983, metadata !981), !dbg !984
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !985, metadata !981), !dbg !986
  %8 = load i32*, i32** %4, align 4, !dbg !987
  %9 = getelementptr inbounds i32, i32* %8, i32 0, !dbg !987
  %10 = load i32, i32* %9, align 4, !dbg !987
  %11 = load i32*, i32** %4, align 4, !dbg !988
  %12 = getelementptr inbounds i32, i32* %11, i32 1, !dbg !988
  %13 = load i32, i32* %12, align 4, !dbg !988
  %14 = add nsw i32 %10, %13, !dbg !989
  %15 = sdiv i32 %14, 2, !dbg !990
  %16 = load i32*, i32** %5, align 4, !dbg !991
  %17 = getelementptr inbounds i32, i32* %16, i32 0, !dbg !991
  store i32 %15, i32* %17, align 4, !dbg !992
  call void @llvm.dbg.declare(metadata i32* %7, metadata !993, metadata !981), !dbg !995
  store i32 1, i32* %7, align 4, !dbg !995
  br label %18, !dbg !996

; <label>:18:                                     ; preds = %44, %3
  %19 = load i32, i32* %7, align 4, !dbg !997
  %20 = load i32, i32* %6, align 4, !dbg !1000
  %21 = sub nsw i32 %20, 1, !dbg !1001
  %22 = icmp slt i32 %19, %21, !dbg !1002
  br i1 %22, label %23, label %47, !dbg !1003

; <label>:23:                                     ; preds = %18
  %24 = load i32, i32* %7, align 4, !dbg !1004
  %25 = sub nsw i32 %24, 1, !dbg !1006
  %26 = load i32*, i32** %4, align 4, !dbg !1007
  %27 = getelementptr inbounds i32, i32* %26, i32 %25, !dbg !1007
  %28 = load i32, i32* %27, align 4, !dbg !1007
  %29 = load i32, i32* %7, align 4, !dbg !1008
  %30 = load i32*, i32** %4, align 4, !dbg !1009
  %31 = getelementptr inbounds i32, i32* %30, i32 %29, !dbg !1009
  %32 = load i32, i32* %31, align 4, !dbg !1009
  %33 = add nsw i32 %28, %32, !dbg !1010
  %34 = load i32, i32* %7, align 4, !dbg !1011
  %35 = add nsw i32 %34, 1, !dbg !1012
  %36 = load i32*, i32** %4, align 4, !dbg !1013
  %37 = getelementptr inbounds i32, i32* %36, i32 %35, !dbg !1013
  %38 = load i32, i32* %37, align 4, !dbg !1013
  %39 = add nsw i32 %33, %38, !dbg !1014
  %40 = sdiv i32 %39, 3, !dbg !1015
  %41 = load i32, i32* %7, align 4, !dbg !1016
  %42 = load i32*, i32** %5, align 4, !dbg !1017
  %43 = getelementptr inbounds i32, i32* %42, i32 %41, !dbg !1017
  store i32 %40, i32* %43, align 4, !dbg !1018
  br label %44, !dbg !1019

; <label>:44:                                     ; preds = %23
  %45 = load i32, i32* %7, align 4, !dbg !1020
  %46 = add nsw i32 %45, 1, !dbg !1020
  store i32 %46, i32* %7, align 4, !dbg !1020
  br label %18, !dbg !1022, !llvm.loop !1023

; <label>:47:                                     ; preds = %18
  %48 = load i32, i32* %6, align 4, !dbg !1025
  %49 = sub nsw i32 %48, 1, !dbg !1026
  %50 = load i32*, i32** %4, align 4, !dbg !1027
  %51 = getelementptr inbounds i32, i32* %50, i32 %49, !dbg !1027
  %52 = load i32, i32* %51, align 4, !dbg !1027
  %53 = load i32, i32* %6, align 4, !dbg !1028
  %54 = sub nsw i32 %53, 2, !dbg !1029
  %55 = load i32*, i32** %4, align 4, !dbg !1030
  %56 = getelementptr inbounds i32, i32* %55, i32 %54, !dbg !1030
  %57 = load i32, i32* %56, align 4, !dbg !1030
  %58 = add nsw i32 %52, %57, !dbg !1031
  %59 = sdiv i32 %58, 2, !dbg !1032
  %60 = load i32, i32* %6, align 4, !dbg !1033
  %61 = sub nsw i32 %60, 1, !dbg !1034
  %62 = load i32*, i32** %5, align 4, !dbg !1035
  %63 = getelementptr inbounds i32, i32* %62, i32 %61, !dbg !1035
  store i32 %59, i32* %63, align 4, !dbg !1036
  ret void, !dbg !1037
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: norecurse
define i32 @main(i32, i8**) #6 !dbg !1038 !xidane.fname !1041 !xidane.function_declaration_type !1042 !xidane.function_declaration_filename !979 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 4
  %8 = alloca i32*, align 4
  %9 = alloca i32*, align 4
  %10 = alloca i32, align 4
  %11 = alloca %"class.sds_utils::perf_counter", align 8
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !1043, metadata !981), !dbg !1044
  store i8** %1, i8*** %5, align 4
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !1045, metadata !981), !dbg !1046
  call void @llvm.dbg.declare(metadata i32* %6, metadata !1047, metadata !981), !dbg !1048
  store i32 1024, i32* %6, align 4, !dbg !1048
  call void @llvm.dbg.declare(metadata i32** %7, metadata !1049, metadata !981), !dbg !1050
  %16 = load i32, i32* %6, align 4, !dbg !1051
  %17 = call i8* @sds_alloc(i32 %16), !dbg !1052
  %18 = bitcast i8* %17 to i32*, !dbg !1053
  store i32* %18, i32** %7, align 4, !dbg !1050
  call void @llvm.dbg.declare(metadata i32** %8, metadata !1054, metadata !981), !dbg !1055
  %19 = load i32, i32* %6, align 4, !dbg !1056
  %20 = call i8* @sds_alloc(i32 %19), !dbg !1057
  %21 = bitcast i8* %20 to i32*, !dbg !1058
  store i32* %21, i32** %8, align 4, !dbg !1055
  call void @llvm.dbg.declare(metadata i32** %9, metadata !1059, metadata !981), !dbg !1060
  %22 = load i32, i32* %6, align 4, !dbg !1061
  %23 = call noalias i8* @malloc(i32 %22) #3, !dbg !1062
  %24 = bitcast i8* %23 to i32*, !dbg !1063
  store i32* %24, i32** %9, align 4, !dbg !1060
  call void @llvm.dbg.declare(metadata i32* %10, metadata !1064, metadata !981), !dbg !1066
  store i32 0, i32* %10, align 4, !dbg !1066
  br label %25, !dbg !1067

; <label>:25:                                     ; preds = %44, %2
  %26 = load i32, i32* %10, align 4, !dbg !1068
  %27 = icmp slt i32 %26, 256, !dbg !1071
  br i1 %27, label %28, label %47, !dbg !1072

; <label>:28:                                     ; preds = %25
  %29 = call i32 @rand() #3, !dbg !1073
  %30 = srem i32 %29, 256, !dbg !1075
  %31 = load i32, i32* %10, align 4, !dbg !1076
  %32 = load i32*, i32** %7, align 4, !dbg !1077
  %33 = getelementptr inbounds i32, i32* %32, i32 %31, !dbg !1077
  store i32 %30, i32* %33, align 4, !dbg !1078
  %34 = load i32, i32* %10, align 4, !dbg !1079
  %35 = load i32*, i32** %7, align 4, !dbg !1080
  %36 = getelementptr inbounds i32, i32* %35, i32 %34, !dbg !1080
  %37 = load i32, i32* %36, align 4, !dbg !1080
  %38 = load i32, i32* %10, align 4, !dbg !1081
  %39 = load i32*, i32** %9, align 4, !dbg !1082
  %40 = getelementptr inbounds i32, i32* %39, i32 %38, !dbg !1082
  store i32 %37, i32* %40, align 4, !dbg !1083
  %41 = load i32, i32* %10, align 4, !dbg !1084
  %42 = load i32*, i32** %8, align 4, !dbg !1085
  %43 = getelementptr inbounds i32, i32* %42, i32 %41, !dbg !1085
  store i32 0, i32* %43, align 4, !dbg !1086
  br label %44, !dbg !1087

; <label>:44:                                     ; preds = %28
  %45 = load i32, i32* %10, align 4, !dbg !1088
  %46 = add nsw i32 %45, 1, !dbg !1088
  store i32 %46, i32* %10, align 4, !dbg !1088
  br label %25, !dbg !1090, !llvm.loop !1091

; <label>:47:                                     ; preds = %25
  call void @llvm.dbg.declare(metadata %"class.sds_utils::perf_counter"* %11, metadata !1093, metadata !981), !dbg !1109
  %48 = call %"class.sds_utils::perf_counter"* @_ZN9sds_utils12perf_counterC2Ev(%"class.sds_utils::perf_counter"* %11), !dbg !1109
  %49 = load i32*, i32** %7, align 4, !dbg !1110
  %50 = load i32*, i32** %9, align 4, !dbg !1111
  call void @_Z10mean_valuePiS_i(i32* %49, i32* %50, i32 256), !dbg !1112
  call void @llvm.dbg.declare(metadata i32* %12, metadata !1113, metadata !981), !dbg !1114
  store i32 256, i32* %12, align 4, !dbg !1114
  call void @_ZN9sds_utils12perf_counter5startEv(%"class.sds_utils::perf_counter"* %11), !dbg !1115
  %51 = load i32*, i32** %7, align 4, !dbg !1116
  %52 = load i32*, i32** %8, align 4, !dbg !1117
  %53 = load i32, i32* %12, align 4, !dbg !1118
  call void @_Z16mean_value_accelPiS_i(i32* %51, i32* %52, i32 %53), !dbg !1119
  call void @_ZN9sds_utils12perf_counter4stopEv(%"class.sds_utils::perf_counter"* %11), !dbg !1120
  call void @llvm.dbg.declare(metadata i64* %13, metadata !1121, metadata !981), !dbg !1122
  %54 = call i64 @_ZN9sds_utils12perf_counter14avg_cpu_cyclesEv(%"class.sds_utils::perf_counter"* %11), !dbg !1123
  store i64 %54, i64* %13, align 8, !dbg !1122
  %55 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) @_ZSt4cout, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str, i32 0, i32 0)), !dbg !1124
  %56 = load i64, i64* %13, align 8, !dbg !1125
  %57 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEy(%"class.std::basic_ostream"* %55, i64 %56), !dbg !1126
  %58 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %57, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1127
  call void @llvm.dbg.declare(metadata i32* %14, metadata !1129, metadata !981), !dbg !1130
  store i32 0, i32* %14, align 4, !dbg !1130
  %59 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) @_ZSt4cout, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0)), !dbg !1131
  %60 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %59, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1132
  call void @llvm.dbg.declare(metadata i32* %15, metadata !1133, metadata !981), !dbg !1135
  store i32 0, i32* %15, align 4, !dbg !1135
  br label %61, !dbg !1136

; <label>:61:                                     ; preds = %108, %47
  %62 = load i32, i32* %15, align 4, !dbg !1137
  %63 = icmp slt i32 %62, 256, !dbg !1140
  br i1 %63, label %64, label %111, !dbg !1141

; <label>:64:                                     ; preds = %61
  %65 = load i32, i32* %15, align 4, !dbg !1142
  %66 = load i32*, i32** %8, align 4, !dbg !1145
  %67 = getelementptr inbounds i32, i32* %66, i32 %65, !dbg !1145
  %68 = load i32, i32* %67, align 4, !dbg !1145
  %69 = load i32, i32* %15, align 4, !dbg !1146
  %70 = load i32*, i32** %9, align 4, !dbg !1147
  %71 = getelementptr inbounds i32, i32* %70, i32 %69, !dbg !1147
  %72 = load i32, i32* %71, align 4, !dbg !1147
  %73 = icmp ne i32 %68, %72, !dbg !1148
  br i1 %73, label %74, label %93, !dbg !1149

; <label>:74:                                     ; preds = %64
  %75 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) @_ZSt4cout, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0)), !dbg !1150
  %76 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %75, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1152
  %77 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) @_ZSt4cout, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)), !dbg !1154
  %78 = load i32, i32* %15, align 4, !dbg !1155
  %79 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %77, i32 %78), !dbg !1156
  %80 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) %79, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0)), !dbg !1157
  %81 = load i32, i32* %15, align 4, !dbg !1159
  %82 = load i32*, i32** %9, align 4, !dbg !1160
  %83 = getelementptr inbounds i32, i32* %82, i32 %81, !dbg !1160
  %84 = load i32, i32* %83, align 4, !dbg !1160
  %85 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %80, i32 %84), !dbg !1161
  %86 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) %85, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i32 0, i32 0)), !dbg !1163
  %87 = load i32, i32* %15, align 4, !dbg !1164
  %88 = load i32*, i32** %8, align 4, !dbg !1165
  %89 = getelementptr inbounds i32, i32* %88, i32 %87, !dbg !1165
  %90 = load i32, i32* %89, align 4, !dbg !1165
  %91 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %86, i32 %90), !dbg !1166
  %92 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %91, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1167
  store i32 1, i32* %14, align 4, !dbg !1168
  br label %111, !dbg !1169

; <label>:93:                                     ; preds = %64
  %94 = load i32, i32* %15, align 4, !dbg !1170
  %95 = load i32*, i32** %8, align 4, !dbg !1172
  %96 = getelementptr inbounds i32, i32* %95, i32 %94, !dbg !1172
  %97 = load i32, i32* %96, align 4, !dbg !1172
  %98 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %97), !dbg !1173
  %99 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) %98, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)), !dbg !1174
  %100 = load i32, i32* %15, align 4, !dbg !1176
  %101 = add nsw i32 %100, 1, !dbg !1178
  %102 = srem i32 %101, 16, !dbg !1179
  %103 = icmp eq i32 %102, 0, !dbg !1180
  br i1 %103, label %104, label %106, !dbg !1181

; <label>:104:                                    ; preds = %93
  %105 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* @_ZSt4cout, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1182
  br label %106, !dbg !1184

; <label>:106:                                    ; preds = %104, %93
  br label %107

; <label>:107:                                    ; preds = %106
  br label %108, !dbg !1185

; <label>:108:                                    ; preds = %107
  %109 = load i32, i32* %15, align 4, !dbg !1186
  %110 = add nsw i32 %109, 1, !dbg !1186
  store i32 %110, i32* %15, align 4, !dbg !1186
  br label %61, !dbg !1188, !llvm.loop !1189

; <label>:111:                                    ; preds = %74, %61
  %112 = load i32*, i32** %7, align 4, !dbg !1191
  %113 = bitcast i32* %112 to i8*, !dbg !1191
  call void @sds_free(i8* %113), !dbg !1192
  %114 = load i32*, i32** %8, align 4, !dbg !1193
  %115 = bitcast i32* %114 to i8*, !dbg !1193
  call void @sds_free(i8* %115), !dbg !1194
  %116 = load i32*, i32** %9, align 4, !dbg !1195
  %117 = bitcast i32* %116 to i8*, !dbg !1195
  call void @free(i8* %117) #3, !dbg !1196
  %118 = load i32, i32* %14, align 4, !dbg !1197
  %119 = icmp ne i32 %118, 0, !dbg !1197
  br i1 %119, label %120, label %123, !dbg !1199

; <label>:120:                                    ; preds = %111
  %121 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0)), !dbg !1200
  %122 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %121, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1202
  store i32 1, i32* %3, align 4, !dbg !1204
  br label %126, !dbg !1204

; <label>:123:                                    ; preds = %111
  %124 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140) @_ZSt4cout, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i32 0, i32 0)), !dbg !1205
  %125 = call dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %124, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !1206
  store i32 0, i32* %3, align 4, !dbg !1207
  br label %126, !dbg !1207

; <label>:126:                                    ; preds = %123, %120
  %127 = load i32, i32* %3, align 4, !dbg !1208
  ret i32 %127, !dbg !1208
}

declare !xidane.fname !1209 !xidane.function_declaration_type !1210 !xidane.function_declaration_filename !1211 !xidane.ExternC !1212 i8* @sds_alloc(i32) #1

; Function Attrs: nounwind
declare !xidane.fname !1213 !xidane.function_declaration_type !1214 !xidane.function_declaration_filename !1215 !xidane.ExternC !1212 noalias i8* @malloc(i32) #2

; Function Attrs: nounwind
declare !xidane.fname !1216 !xidane.function_declaration_type !1217 !xidane.function_declaration_filename !1215 !xidane.ExternC !1212 i32 @rand() #2

; Function Attrs: nounwind
define linkonce_odr %"class.sds_utils::perf_counter"* @_ZN9sds_utils12perf_counterC2Ev(%"class.sds_utils::perf_counter"* returned) unnamed_addr #4 comdat align 2 !dbg !1218 !xidane.fname !1219 !xidane.function_declaration_type !971 !xidane.function_declaration_filename !1220 {
  %2 = alloca %"class.sds_utils::perf_counter"*, align 4
  store %"class.sds_utils::perf_counter"* %0, %"class.sds_utils::perf_counter"** %2, align 4
  call void @llvm.dbg.declare(metadata %"class.sds_utils::perf_counter"** %2, metadata !1221, metadata !981), !dbg !1223
  %3 = load %"class.sds_utils::perf_counter"*, %"class.sds_utils::perf_counter"** %2, align 4
  %4 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 0, !dbg !1224
  store i64 0, i64* %4, align 8, !dbg !1224
  %5 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 1, !dbg !1225
  store i64 0, i64* %5, align 8, !dbg !1225
  %6 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 2, !dbg !1226
  store i64 0, i64* %6, align 8, !dbg !1226
  ret %"class.sds_utils::perf_counter"* %3, !dbg !1227
}

; Function Attrs: inlinehint
define linkonce_odr void @_ZN9sds_utils12perf_counter5startEv(%"class.sds_utils::perf_counter"*) #7 comdat align 2 !dbg !1228 !xidane.fname !1229 !xidane.function_declaration_type !971 !xidane.function_declaration_filename !1220 {
  %2 = alloca %"class.sds_utils::perf_counter"*, align 4
  store %"class.sds_utils::perf_counter"* %0, %"class.sds_utils::perf_counter"** %2, align 4
  call void @llvm.dbg.declare(metadata %"class.sds_utils::perf_counter"** %2, metadata !1230, metadata !981), !dbg !1231
  %3 = load %"class.sds_utils::perf_counter"*, %"class.sds_utils::perf_counter"** %2, align 4
  %4 = call i64 @sds_clock_counter(), !dbg !1232
  %5 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 1, !dbg !1233
  store i64 %4, i64* %5, align 8, !dbg !1234
  %6 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 2, !dbg !1235
  %7 = load i64, i64* %6, align 8, !dbg !1236
  %8 = add i64 %7, 1, !dbg !1236
  store i64 %8, i64* %6, align 8, !dbg !1236
  ret void, !dbg !1237
}

declare !xidane.fname !1238 !xidane.function_declaration_type !1239 !xidane.function_declaration_filename !1240 !xidane.function_argument_annotation !1241 void @_Z16mean_value_accelPiS_i(i32*, i32*, i32) #1

; Function Attrs: inlinehint
define linkonce_odr void @_ZN9sds_utils12perf_counter4stopEv(%"class.sds_utils::perf_counter"*) #7 comdat align 2 !dbg !1242 !xidane.fname !1243 !xidane.function_declaration_type !971 !xidane.function_declaration_filename !1220 {
  %2 = alloca %"class.sds_utils::perf_counter"*, align 4
  store %"class.sds_utils::perf_counter"* %0, %"class.sds_utils::perf_counter"** %2, align 4
  call void @llvm.dbg.declare(metadata %"class.sds_utils::perf_counter"** %2, metadata !1244, metadata !981), !dbg !1245
  %3 = load %"class.sds_utils::perf_counter"*, %"class.sds_utils::perf_counter"** %2, align 4
  %4 = call i64 @sds_clock_counter(), !dbg !1246
  %5 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 1, !dbg !1247
  %6 = load i64, i64* %5, align 8, !dbg !1247
  %7 = sub i64 %4, %6, !dbg !1248
  %8 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 0, !dbg !1249
  %9 = load i64, i64* %8, align 8, !dbg !1250
  %10 = add i64 %9, %7, !dbg !1250
  store i64 %10, i64* %8, align 8, !dbg !1250
  ret void, !dbg !1251
}

; Function Attrs: inlinehint nounwind
define linkonce_odr i64 @_ZN9sds_utils12perf_counter14avg_cpu_cyclesEv(%"class.sds_utils::perf_counter"*) #8 comdat align 2 !dbg !1252 !xidane.fname !1253 !xidane.function_declaration_type !1254 !xidane.function_declaration_filename !1220 {
  %2 = alloca %"class.sds_utils::perf_counter"*, align 4
  store %"class.sds_utils::perf_counter"* %0, %"class.sds_utils::perf_counter"** %2, align 4
  call void @llvm.dbg.declare(metadata %"class.sds_utils::perf_counter"** %2, metadata !1255, metadata !981), !dbg !1256
  %3 = load %"class.sds_utils::perf_counter"*, %"class.sds_utils::perf_counter"** %2, align 4
  %4 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 0, !dbg !1257
  %5 = load i64, i64* %4, align 8, !dbg !1257
  %6 = getelementptr inbounds %"class.sds_utils::perf_counter", %"class.sds_utils::perf_counter"* %3, i32 0, i32 2, !dbg !1258
  %7 = load i64, i64* %6, align 8, !dbg !1258
  %8 = udiv i64 %5, %7, !dbg !1259
  ret i64 %8, !dbg !1260
}

declare !xidane.fname !1261 !xidane.function_declaration_type !1262 !xidane.function_declaration_filename !1263 dereferenceable(140) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(140), i8*) #1

declare !xidane.fname !1261 !xidane.function_declaration_type !1264 !xidane.function_declaration_filename !1263 dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEy(%"class.std::basic_ostream"*, i64) #1

declare !xidane.fname !1261 !xidane.function_declaration_type !1265 !xidane.function_declaration_filename !1263 dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare !xidane.fname !1266 !xidane.function_declaration_type !1267 !xidane.function_declaration_filename !1263 dereferenceable(140) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(140)) #1

declare !xidane.fname !1261 !xidane.function_declaration_type !1268 !xidane.function_declaration_filename !1263 dereferenceable(140) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare !xidane.fname !1269 !xidane.function_declaration_type !1270 !xidane.function_declaration_filename !1211 !xidane.ExternC !1212 void @sds_free(i8*) #1

; Function Attrs: nounwind
declare !xidane.fname !1271 !xidane.function_declaration_type !1270 !xidane.function_declaration_filename !1215 !xidane.ExternC !1212 void @free(i8*) #2

declare !xidane.fname !1272 !xidane.function_declaration_type !1273 !xidane.function_declaration_filename !1211 !xidane.ExternC !1212 i64 @sds_clock_counter() #1

define internal void @_GLOBAL__sub_I_main.cpp() #0 section ".text.startup" !dbg !1274 {
  call void @__cxx_global_var_init(), !dbg !1276
  ret void
}

attributes #0 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { norecurse "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { inlinehint "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { inlinehint nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="cortex-a9" "target-features"="+dsp,+vfp3,-crypto,-d16,-fp-armv8,-fp-only-sp,-fp16,-neon,-vfp4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!961, !962, !963, !964}
!llvm.ident = !{!965}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6, imports: !25)
!1 = !DIFile(filename: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/main.cpp", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 32, align: 32)
!5 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!6 = !{!7}
!7 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !8, file: !10, line: 74, type: !11, isLocal: true, isDefinition: true, variable: %"class.std::ios_base::Init"* @_ZStL8__ioinit)
!8 = !DINamespace(name: "std", scope: null, file: !9, line: 199)
!9 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/arm-linux-gnueabihf/bits/c++config.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!10 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/iostream", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!11 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !13, file: !12, line: 601, size: 8, align: 8, elements: !14, identifier: "_ZTSNSt8ios_base4InitE")
!12 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/bits/ios_base.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!13 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !8, file: !12, line: 228, size: 896, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!14 = !{!15, !18, !20, !24}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !11, file: !12, line: 609, baseType: !16, flags: DIFlagStaticMember)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !17, line: 32, baseType: !5)
!17 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/arm-linux-gnueabihf/bits/atomic_word.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!18 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !11, file: !12, line: 610, baseType: !19, flags: DIFlagStaticMember)
!19 = !DIBasicType(name: "bool", size: 8, align: 8, encoding: DW_ATE_boolean)
!20 = !DISubprogram(name: "Init", scope: !11, file: !12, line: 605, type: !21, isLocal: false, isDefinition: false, scopeLine: 605, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 32, align: 32, flags: DIFlagArtificial | DIFlagObjectPointer)
!24 = !DISubprogram(name: "~Init", scope: !11, file: !12, line: 606, type: !21, isLocal: false, isDefinition: false, scopeLine: 606, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!25 = !{!26, !43, !46, !50, !58, !66, !70, !77, !81, !85, !87, !89, !93, !103, !107, !113, !119, !121, !125, !129, !133, !137, !149, !151, !155, !159, !163, !165, !171, !175, !179, !181, !183, !187, !195, !199, !203, !207, !209, !215, !217, !224, !229, !233, !238, !243, !247, !251, !253, !255, !259, !263, !267, !269, !273, !277, !279, !281, !285, !291, !296, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !364, !368, !372, !376, !379, !381, !383, !385, !387, !389, !391, !393, !395, !397, !399, !401, !403, !406, !409, !411, !413, !415, !417, !419, !421, !423, !425, !427, !429, !431, !433, !436, !440, !445, !450, !452, !454, !456, !458, !460, !462, !464, !466, !468, !470, !472, !474, !476, !478, !480, !484, !490, !494, !496, !501, !503, !507, !511, !515, !525, !529, !533, !537, !541, !545, !549, !553, !557, !561, !565, !569, !573, !575, !579, !583, !587, !593, !597, !601, !603, !607, !611, !617, !619, !623, !627, !631, !635, !639, !643, !647, !648, !649, !650, !653, !654, !655, !656, !657, !658, !659, !661, !666, !671, !675, !677, !679, !681, !683, !690, !694, !698, !702, !706, !710, !715, !719, !721, !725, !731, !735, !740, !742, !744, !748, !752, !756, !758, !760, !762, !764, !768, !770, !772, !776, !780, !784, !788, !792, !794, !796, !800, !804, !808, !812, !814, !816, !820, !824, !825, !826, !827, !828, !829, !836, !838, !839, !841, !843, !845, !847, !851, !853, !855, !857, !859, !861, !863, !865, !867, !871, !875, !877, !881, !885, !890, !894, !898, !902, !906, !910, !912, !914, !916, !920, !924, !928, !932, !936, !938, !940, !942, !946, !950, !954, !956, !958}
!26 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !27, line: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !28, line: 106, baseType: !29)
!28 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/wchar.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !28, line: 94, baseType: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !28, line: 82, size: 64, align: 32, elements: !31, identifier: "_ZTS11__mbstate_t")
!31 = !{!32, !33}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !30, file: !28, line: 84, baseType: !5, size: 32, align: 32)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !30, file: !28, line: 93, baseType: !34, size: 32, align: 32, offset: 32)
!34 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !30, file: !28, line: 85, size: 32, align: 32, elements: !35, identifier: "_ZTSN11__mbstate_tUt_E")
!35 = !{!36, !38}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !34, file: !28, line: 88, baseType: !37, size: 32, align: 32)
!37 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !34, file: !28, line: 92, baseType: !39, size: 32, align: 8)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 32, align: 8, elements: !41)
!40 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_unsigned_char)
!41 = !{!42}
!42 = !DISubrange(count: 4)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !44, line: 139)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !45, line: 357, baseType: !37)
!45 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/lib/gcc/arm-linux-gnueabihf/6.2.1/include/stddef.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !47, line: 141)
!47 = !DISubprogram(name: "btowc", scope: !28, file: !28, line: 356, type: !48, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DISubroutineType(types: !49)
!49 = !{!44, !5}
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !51, line: 142)
!51 = !DISubprogram(name: "fgetwc", scope: !28, file: !28, line: 748, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DISubroutineType(types: !53)
!53 = !{!44, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 32, align: 32)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !56, line: 64, baseType: !57)
!56 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/stdio.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!57 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !56, line: 44, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !59, line: 143)
!59 = !DISubprogram(name: "fgetws", scope: !28, file: !28, line: 777, type: !60, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !64, !5, !65}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 32, align: 32)
!63 = !DIBasicType(name: "wchar_t", size: 32, align: 32, encoding: DW_ATE_unsigned)
!64 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !62)
!65 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !54)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !67, line: 144)
!67 = !DISubprogram(name: "fputwc", scope: !28, file: !28, line: 762, type: !68, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DISubroutineType(types: !69)
!69 = !{!44, !63, !54}
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !71, line: 145)
!71 = !DISubprogram(name: "fputws", scope: !28, file: !28, line: 784, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!5, !74, !65}
!74 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 32, align: 32)
!76 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !78, line: 146)
!78 = !DISubprogram(name: "fwide", scope: !28, file: !28, line: 590, type: !79, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!5, !54, !5}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !82, line: 147)
!82 = !DISubprogram(name: "fwprintf", scope: !28, file: !28, line: 597, type: !83, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DISubroutineType(types: !84)
!84 = !{!5, !65, !74, null}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !86, line: 148)
!86 = !DISubprogram(name: "fwscanf", scope: !28, file: !28, line: 638, type: !83, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !88, line: 149)
!88 = !DISubprogram(name: "getwc", scope: !28, file: !28, line: 749, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !90, line: 150)
!90 = !DISubprogram(name: "getwchar", scope: !28, file: !28, line: 755, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DISubroutineType(types: !92)
!92 = !{!44}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !94, line: 151)
!94 = !DISubprogram(name: "mbrlen", scope: !28, file: !28, line: 379, type: !95, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{!97, !98, !97, !101}
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 216, baseType: !37)
!98 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !99)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 32, align: 32)
!100 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!101 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 32, align: 32)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !104, line: 152)
!104 = !DISubprogram(name: "mbrtowc", scope: !28, file: !28, line: 368, type: !105, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DISubroutineType(types: !106)
!106 = !{!97, !64, !98, !97, !101}
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !108, line: 153)
!108 = !DISubprogram(name: "mbsinit", scope: !28, file: !28, line: 364, type: !109, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DISubroutineType(types: !110)
!110 = !{!5, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 32, align: 32)
!112 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !27)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !114, line: 154)
!114 = !DISubprogram(name: "mbsrtowcs", scope: !28, file: !28, line: 411, type: !115, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DISubroutineType(types: !116)
!116 = !{!97, !64, !117, !97, !101}
!117 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !118)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 32, align: 32)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !120, line: 155)
!120 = !DISubprogram(name: "putwc", scope: !28, file: !28, line: 763, type: !68, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !122, line: 156)
!122 = !DISubprogram(name: "putwchar", scope: !28, file: !28, line: 769, type: !123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!44, !63}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !126, line: 158)
!126 = !DISubprogram(name: "swprintf", scope: !28, file: !28, line: 607, type: !127, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DISubroutineType(types: !128)
!128 = !{!5, !64, !97, !74, null}
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !130, line: 160)
!130 = !DISubprogram(name: "swscanf", scope: !28, file: !28, line: 648, type: !131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!5, !74, !74, null}
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !134, line: 161)
!134 = !DISubprogram(name: "ungetwc", scope: !28, file: !28, line: 792, type: !135, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DISubroutineType(types: !136)
!136 = !{!44, !44, !54}
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !138, line: 162)
!138 = !DISubprogram(name: "vfwprintf", scope: !28, file: !28, line: 615, type: !139, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!5, !65, !74, !141}
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gnuc_va_list", file: !142, line: 40, baseType: !143)
!142 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/lib/gcc/arm-linux-gnueabihf/6.2.1/include/stdarg.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "__builtin_va_list", file: !1, baseType: !144)
!144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list", scope: !145, file: !1, size: 32, align: 32, elements: !146, identifier: "_ZTSSt9__va_list")
!145 = !DINamespace(name: "std", scope: null, file: !1)
!146 = !{!147}
!147 = !DIDerivedType(tag: DW_TAG_member, name: "__ap", scope: !144, file: !1, baseType: !148, size: 32, align: 32)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32, align: 32)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !150, line: 164)
!150 = !DISubprogram(name: "vfwscanf", scope: !28, file: !28, line: 692, type: !139, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !152, line: 167)
!152 = !DISubprogram(name: "vswprintf", scope: !28, file: !28, line: 628, type: !153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!5, !64, !97, !74, !141}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !156, line: 170)
!156 = !DISubprogram(name: "vswscanf", scope: !28, file: !28, line: 704, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!5, !74, !74, !141}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !160, line: 172)
!160 = !DISubprogram(name: "vwprintf", scope: !28, file: !28, line: 623, type: !161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!5, !74, !141}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !164, line: 174)
!164 = !DISubprogram(name: "vwscanf", scope: !28, file: !28, line: 700, type: !161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !166, line: 176)
!166 = !DISubprogram(name: "wcrtomb", scope: !28, file: !28, line: 373, type: !167, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!97, !169, !63, !101}
!169 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !170)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 32, align: 32)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !172, line: 177)
!172 = !DISubprogram(name: "wcscat", scope: !28, file: !28, line: 157, type: !173, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!62, !64, !74}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !176, line: 178)
!176 = !DISubprogram(name: "wcscmp", scope: !28, file: !28, line: 166, type: !177, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DISubroutineType(types: !178)
!178 = !{!5, !75, !75}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !180, line: 179)
!180 = !DISubprogram(name: "wcscoll", scope: !28, file: !28, line: 195, type: !177, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !182, line: 180)
!182 = !DISubprogram(name: "wcscpy", scope: !28, file: !28, line: 147, type: !173, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !184, line: 181)
!184 = !DISubprogram(name: "wcscspn", scope: !28, file: !28, line: 255, type: !185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{!97, !75, !75}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !188, line: 182)
!188 = !DISubprogram(name: "wcsftime", scope: !28, file: !28, line: 858, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!97, !64, !97, !74, !191}
!191 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 32, align: 32)
!193 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !194)
!194 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !28, line: 137, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !196, line: 183)
!196 = !DISubprogram(name: "wcslen", scope: !28, file: !28, line: 290, type: !197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!97, !75}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !200, line: 184)
!200 = !DISubprogram(name: "wcsncat", scope: !28, file: !28, line: 161, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!62, !64, !74, !97}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !204, line: 185)
!204 = !DISubprogram(name: "wcsncmp", scope: !28, file: !28, line: 169, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!5, !75, !75, !97}
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !208, line: 186)
!208 = !DISubprogram(name: "wcsncpy", scope: !28, file: !28, line: 152, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !210, line: 187)
!210 = !DISubprogram(name: "wcsrtombs", scope: !28, file: !28, line: 417, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DISubroutineType(types: !212)
!212 = !{!97, !169, !213, !97, !101}
!213 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !214)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 32, align: 32)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !216, line: 188)
!216 = !DISubprogram(name: "wcsspn", scope: !28, file: !28, line: 259, type: !185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !218, line: 189)
!218 = !DISubprogram(name: "wcstod", scope: !28, file: !28, line: 453, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!221, !74, !222}
!221 = !DIBasicType(name: "double", size: 64, align: 64, encoding: DW_ATE_float)
!222 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !223)
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 32, align: 32)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !225, line: 191)
!225 = !DISubprogram(name: "wcstof", scope: !28, file: !28, line: 460, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DISubroutineType(types: !227)
!227 = !{!228, !74, !222}
!228 = !DIBasicType(name: "float", size: 32, align: 32, encoding: DW_ATE_float)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !230, line: 193)
!230 = !DISubprogram(name: "wcstok", scope: !28, file: !28, line: 285, type: !231, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DISubroutineType(types: !232)
!232 = !{!62, !64, !74, !222}
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !234, line: 194)
!234 = !DISubprogram(name: "wcstol", scope: !28, file: !28, line: 471, type: !235, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DISubroutineType(types: !236)
!236 = !{!237, !74, !222, !5}
!237 = !DIBasicType(name: "long int", size: 32, align: 32, encoding: DW_ATE_signed)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !239, line: 195)
!239 = !DISubprogram(name: "wcstoul", scope: !28, file: !28, line: 476, type: !240, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DISubroutineType(types: !241)
!241 = !{!242, !74, !222, !5}
!242 = !DIBasicType(name: "long unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !244, line: 196)
!244 = !DISubprogram(name: "wcsxfrm", scope: !28, file: !28, line: 199, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!245 = !DISubroutineType(types: !246)
!246 = !{!97, !64, !74, !97}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !248, line: 197)
!248 = !DISubprogram(name: "wctob", scope: !28, file: !28, line: 360, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DISubroutineType(types: !250)
!250 = !{!5, !44}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !252, line: 198)
!252 = !DISubprogram(name: "wmemcmp", scope: !28, file: !28, line: 328, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !254, line: 199)
!254 = !DISubprogram(name: "wmemcpy", scope: !28, file: !28, line: 332, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !256, line: 200)
!256 = !DISubprogram(name: "wmemmove", scope: !28, file: !28, line: 337, type: !257, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DISubroutineType(types: !258)
!258 = !{!62, !62, !75, !97}
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !260, line: 201)
!260 = !DISubprogram(name: "wmemset", scope: !28, file: !28, line: 341, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!62, !62, !63, !97}
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !264, line: 202)
!264 = !DISubprogram(name: "wprintf", scope: !28, file: !28, line: 604, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DISubroutineType(types: !266)
!266 = !{!5, !74, null}
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !268, line: 203)
!268 = !DISubprogram(name: "wscanf", scope: !28, file: !28, line: 645, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !270, line: 204)
!270 = !DISubprogram(name: "wcschr", scope: !28, file: !28, line: 230, type: !271, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!271 = !DISubroutineType(types: !272)
!272 = !{!62, !75, !63}
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !274, line: 205)
!274 = !DISubprogram(name: "wcspbrk", scope: !28, file: !28, line: 269, type: !275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DISubroutineType(types: !276)
!276 = !{!62, !75, !75}
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !278, line: 206)
!278 = !DISubprogram(name: "wcsrchr", scope: !28, file: !28, line: 240, type: !271, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !280, line: 207)
!280 = !DISubprogram(name: "wcsstr", scope: !28, file: !28, line: 280, type: !275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !282, line: 208)
!282 = !DISubprogram(name: "wmemchr", scope: !28, file: !28, line: 323, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!283 = !DISubroutineType(types: !284)
!284 = !{!62, !75, !63, !97}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !287, line: 248)
!286 = !DINamespace(name: "__gnu_cxx", scope: null, file: !9, line: 225)
!287 = !DISubprogram(name: "wcstold", scope: !28, file: !28, line: 462, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DISubroutineType(types: !289)
!289 = !{!290, !74, !222}
!290 = !DIBasicType(name: "long double", size: 64, align: 64, encoding: DW_ATE_float)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !292, line: 257)
!292 = !DISubprogram(name: "wcstoll", scope: !28, file: !28, line: 486, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!295, !74, !222, !5}
!295 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !297, line: 258)
!297 = !DISubprogram(name: "wcstoull", scope: !28, file: !28, line: 493, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DISubroutineType(types: !299)
!299 = !{!300, !74, !222, !5}
!300 = !DIBasicType(name: "long long unsigned int", size: 64, align: 64, encoding: DW_ATE_unsigned)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !287, line: 264)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !292, line: 265)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !297, line: 266)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !225, line: 280)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !150, line: 283)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !156, line: 286)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !164, line: 289)
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !287, line: 293)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !292, line: 294)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !297, line: 295)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !312, line: 58)
!312 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !314, file: !313, line: 77, size: 32, align: 32, elements: !315, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!313 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/bits/exception_ptr.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!314 = !DINamespace(name: "__exception_ptr", scope: !8, file: !313, line: 53)
!315 = !{!316, !317, !321, !324, !325, !330, !331, !335, !340, !344, !348, !351, !352, !355, !358}
!316 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !312, file: !313, line: 79, baseType: !148, size: 32, align: 32)
!317 = !DISubprogram(name: "exception_ptr", scope: !312, file: !313, line: 81, type: !318, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{null, !320, !148}
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 32, align: 32, flags: DIFlagArtificial | DIFlagObjectPointer)
!321 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !312, file: !313, line: 83, type: !322, isLocal: false, isDefinition: false, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !320}
!324 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !312, file: !313, line: 84, type: !322, isLocal: false, isDefinition: false, scopeLine: 84, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !312, file: !313, line: 86, type: !326, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DISubroutineType(types: !327)
!327 = !{!148, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 32, align: 32, flags: DIFlagArtificial | DIFlagObjectPointer)
!329 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !312)
!330 = !DISubprogram(name: "exception_ptr", scope: !312, file: !313, line: 92, type: !322, isLocal: false, isDefinition: false, scopeLine: 92, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!331 = !DISubprogram(name: "exception_ptr", scope: !312, file: !313, line: 94, type: !332, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!332 = !DISubroutineType(types: !333)
!333 = !{null, !320, !334}
!334 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !329, size: 32, align: 32)
!335 = !DISubprogram(name: "exception_ptr", scope: !312, file: !313, line: 97, type: !336, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{null, !320, !338}
!338 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !8, file: !9, line: 205, baseType: !339)
!339 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!340 = !DISubprogram(name: "exception_ptr", scope: !312, file: !313, line: 101, type: !341, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{null, !320, !343}
!343 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !312, size: 32, align: 32)
!344 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !312, file: !313, line: 114, type: !345, isLocal: false, isDefinition: false, scopeLine: 114, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!347, !320, !334}
!347 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !312, size: 32, align: 32)
!348 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !312, file: !313, line: 118, type: !349, isLocal: false, isDefinition: false, scopeLine: 118, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!347, !320, !343}
!351 = !DISubprogram(name: "~exception_ptr", scope: !312, file: !313, line: 125, type: !322, isLocal: false, isDefinition: false, scopeLine: 125, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!352 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !312, file: !313, line: 128, type: !353, isLocal: false, isDefinition: false, scopeLine: 128, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{null, !320, !347}
!355 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !312, file: !313, line: 140, type: !356, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{!19, !328}
!358 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !312, file: !313, line: 149, type: !359, isLocal: false, isDefinition: false, scopeLine: 149, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!361, !328}
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 32, align: 32)
!362 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !363)
!363 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !8, file: !313, line: 47, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !314, entity: !365, line: 71)
!365 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !8, file: !313, line: 67, type: !366, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !312}
!368 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !369, entity: !371, line: 58)
!369 = !DINamespace(name: "__gnu_debug", scope: null, file: !370, line: 56)
!370 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/debug/debug.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!371 = !DINamespace(name: "__debug", scope: !8, file: !370, line: 50)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !373, line: 48)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !374, line: 36, baseType: !375)
!374 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/stdint.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!375 = !DIBasicType(name: "signed char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !377, line: 49)
!377 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !374, line: 37, baseType: !378)
!378 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !380, line: 50)
!380 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !374, line: 38, baseType: !5)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !382, line: 51)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !374, line: 43, baseType: !295)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !384, line: 53)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !374, line: 90, baseType: !375)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !386, line: 54)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !374, line: 96, baseType: !5)
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !388, line: 55)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !374, line: 97, baseType: !5)
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !390, line: 56)
!390 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !374, line: 99, baseType: !295)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !392, line: 58)
!392 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !374, line: 65, baseType: !375)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !394, line: 59)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !374, line: 66, baseType: !378)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !396, line: 60)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !374, line: 67, baseType: !5)
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !398, line: 61)
!398 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !374, line: 72, baseType: !295)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !400, line: 63)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !374, line: 138, baseType: !295)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !402, line: 64)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !374, line: 125, baseType: !5)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !404, line: 66)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !374, line: 48, baseType: !405)
!405 = !DIBasicType(name: "unsigned char", size: 8, align: 8, encoding: DW_ATE_unsigned_char)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !407, line: 67)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !374, line: 49, baseType: !408)
!408 = !DIBasicType(name: "unsigned short", size: 16, align: 16, encoding: DW_ATE_unsigned)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !410, line: 68)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !374, line: 51, baseType: !37)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !412, line: 69)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !374, line: 58, baseType: !300)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !414, line: 71)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !374, line: 103, baseType: !405)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !416, line: 72)
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !374, line: 109, baseType: !37)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !418, line: 73)
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !374, line: 110, baseType: !37)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !420, line: 74)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !374, line: 112, baseType: !300)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !422, line: 76)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !374, line: 76, baseType: !405)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !424, line: 77)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !374, line: 77, baseType: !408)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !426, line: 78)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !374, line: 78, baseType: !37)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !428, line: 79)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !374, line: 83, baseType: !300)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !430, line: 81)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !374, line: 140, baseType: !300)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !432, line: 82)
!432 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !374, line: 128, baseType: !37)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !434, line: 53)
!434 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !435, line: 53, size: 448, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!435 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/locale.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !437, line: 54)
!437 = !DISubprogram(name: "setlocale", scope: !435, file: !435, line: 124, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DISubroutineType(types: !439)
!439 = !{!170, !5, !99}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !441, line: 55)
!441 = !DISubprogram(name: "localeconv", scope: !435, file: !435, line: 127, type: !442, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DISubroutineType(types: !443)
!443 = !{!444}
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !434, size: 32, align: 32)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !446, line: 64)
!446 = !DISubprogram(name: "isalnum", scope: !447, file: !447, line: 110, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/ctype.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!448 = !DISubroutineType(types: !449)
!449 = !{!5, !5}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !451, line: 65)
!451 = !DISubprogram(name: "isalpha", scope: !447, file: !447, line: 111, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !453, line: 66)
!453 = !DISubprogram(name: "iscntrl", scope: !447, file: !447, line: 112, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !455, line: 67)
!455 = !DISubprogram(name: "isdigit", scope: !447, file: !447, line: 113, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !457, line: 68)
!457 = !DISubprogram(name: "isgraph", scope: !447, file: !447, line: 115, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !459, line: 69)
!459 = !DISubprogram(name: "islower", scope: !447, file: !447, line: 114, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !461, line: 70)
!461 = !DISubprogram(name: "isprint", scope: !447, file: !447, line: 116, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !463, line: 71)
!463 = !DISubprogram(name: "ispunct", scope: !447, file: !447, line: 117, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !465, line: 72)
!465 = !DISubprogram(name: "isspace", scope: !447, file: !447, line: 118, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !467, line: 73)
!467 = !DISubprogram(name: "isupper", scope: !447, file: !447, line: 119, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !469, line: 74)
!469 = !DISubprogram(name: "isxdigit", scope: !447, file: !447, line: 120, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !471, line: 75)
!471 = !DISubprogram(name: "tolower", scope: !447, file: !447, line: 124, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !473, line: 76)
!473 = !DISubprogram(name: "toupper", scope: !447, file: !447, line: 127, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !475, line: 87)
!475 = !DISubprogram(name: "isblank", scope: !447, file: !447, line: 136, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !477, line: 44)
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !8, file: !9, line: 201, baseType: !37)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !479, line: 45)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !8, file: !9, line: 202, baseType: !5)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !481, line: 124)
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !482, line: 101, baseType: !483)
!482 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/stdlib.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!483 = !DICompositeType(tag: DW_TAG_structure_type, file: !482, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !485, line: 125)
!485 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !482, line: 109, baseType: !486)
!486 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !482, line: 105, size: 64, align: 32, elements: !487, identifier: "_ZTS6ldiv_t")
!487 = !{!488, !489}
!488 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !486, file: !482, line: 107, baseType: !237, size: 32, align: 32)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !486, file: !482, line: 108, baseType: !237, size: 32, align: 32, offset: 32)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !491, line: 127)
!491 = !DISubprogram(name: "abort", scope: !482, file: !482, line: 515, type: !492, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DISubroutineType(types: !493)
!493 = !{null}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !495, line: 128)
!495 = !DISubprogram(name: "abs", scope: !482, file: !482, line: 774, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !497, line: 129)
!497 = !DISubprogram(name: "atexit", scope: !482, file: !482, line: 519, type: !498, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DISubroutineType(types: !499)
!499 = !{!5, !500}
!500 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !492, size: 32, align: 32)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !502, line: 132)
!502 = !DISubprogram(name: "at_quick_exit", scope: !482, file: !482, line: 524, type: !498, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !504, line: 135)
!504 = !DISubprogram(name: "atof", scope: !482, file: !482, line: 144, type: !505, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!505 = !DISubroutineType(types: !506)
!506 = !{!221, !99}
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !508, line: 136)
!508 = !DISubprogram(name: "atoi", scope: !482, file: !482, line: 147, type: !509, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!509 = !DISubroutineType(types: !510)
!510 = !{!5, !99}
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !512, line: 137)
!512 = !DISubprogram(name: "atol", scope: !482, file: !482, line: 150, type: !513, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{!237, !99}
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !516, line: 138)
!516 = !DISubprogram(name: "bsearch", scope: !482, file: !482, line: 754, type: !517, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DISubroutineType(types: !518)
!518 = !{!148, !519, !519, !97, !97, !521}
!519 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !520, size: 32, align: 32)
!520 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!521 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !482, line: 741, baseType: !522)
!522 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !523, size: 32, align: 32)
!523 = !DISubroutineType(types: !524)
!524 = !{!5, !519, !519}
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !526, line: 139)
!526 = !DISubprogram(name: "calloc", scope: !482, file: !482, line: 468, type: !527, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DISubroutineType(types: !528)
!528 = !{!148, !97, !97}
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !530, line: 140)
!530 = !DISubprogram(name: "div", scope: !482, file: !482, line: 788, type: !531, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DISubroutineType(types: !532)
!532 = !{!481, !5, !5}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !534, line: 141)
!534 = !DISubprogram(name: "exit", scope: !482, file: !482, line: 543, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DISubroutineType(types: !536)
!536 = !{null, !5}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !538, line: 142)
!538 = !DISubprogram(name: "free", scope: !482, file: !482, line: 483, type: !539, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DISubroutineType(types: !540)
!540 = !{null, !148}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !542, line: 143)
!542 = !DISubprogram(name: "getenv", scope: !482, file: !482, line: 564, type: !543, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DISubroutineType(types: !544)
!544 = !{!170, !99}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !546, line: 144)
!546 = !DISubprogram(name: "labs", scope: !482, file: !482, line: 775, type: !547, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DISubroutineType(types: !548)
!548 = !{!237, !237}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !550, line: 145)
!550 = !DISubprogram(name: "ldiv", scope: !482, file: !482, line: 790, type: !551, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!551 = !DISubroutineType(types: !552)
!552 = !{!485, !237, !237}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !554, line: 146)
!554 = !DISubprogram(name: "malloc", scope: !482, file: !482, line: 466, type: !555, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!555 = !DISubroutineType(types: !556)
!556 = !{!148, !97}
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !558, line: 148)
!558 = !DISubprogram(name: "mblen", scope: !482, file: !482, line: 862, type: !559, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!559 = !DISubroutineType(types: !560)
!560 = !{!5, !99, !97}
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !562, line: 149)
!562 = !DISubprogram(name: "mbstowcs", scope: !482, file: !482, line: 873, type: !563, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!563 = !DISubroutineType(types: !564)
!564 = !{!97, !64, !98, !97}
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !566, line: 150)
!566 = !DISubprogram(name: "mbtowc", scope: !482, file: !482, line: 865, type: !567, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!567 = !DISubroutineType(types: !568)
!568 = !{!5, !64, !98, !97}
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !570, line: 152)
!570 = !DISubprogram(name: "qsort", scope: !482, file: !482, line: 764, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DISubroutineType(types: !572)
!572 = !{null, !148, !97, !97, !521}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !574, line: 155)
!574 = !DISubprogram(name: "quick_exit", scope: !482, file: !482, line: 549, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !576, line: 158)
!576 = !DISubprogram(name: "rand", scope: !482, file: !482, line: 374, type: !577, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!577 = !DISubroutineType(types: !578)
!578 = !{!5}
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !580, line: 159)
!580 = !DISubprogram(name: "realloc", scope: !482, file: !482, line: 480, type: !581, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!581 = !DISubroutineType(types: !582)
!582 = !{!148, !148, !97}
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !584, line: 160)
!584 = !DISubprogram(name: "srand", scope: !482, file: !482, line: 376, type: !585, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!585 = !DISubroutineType(types: !586)
!586 = !{null, !37}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !588, line: 161)
!588 = !DISubprogram(name: "strtod", scope: !482, file: !482, line: 164, type: !589, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!589 = !DISubroutineType(types: !590)
!590 = !{!221, !98, !591}
!591 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !592)
!592 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 32, align: 32)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !594, line: 162)
!594 = !DISubprogram(name: "strtol", scope: !482, file: !482, line: 183, type: !595, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!595 = !DISubroutineType(types: !596)
!596 = !{!237, !98, !591, !5}
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !598, line: 163)
!598 = !DISubprogram(name: "strtoul", scope: !482, file: !482, line: 187, type: !599, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DISubroutineType(types: !600)
!600 = !{!242, !98, !591, !5}
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !602, line: 164)
!602 = !DISubprogram(name: "system", scope: !482, file: !482, line: 716, type: !509, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !604, line: 166)
!604 = !DISubprogram(name: "wcstombs", scope: !482, file: !482, line: 876, type: !605, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DISubroutineType(types: !606)
!606 = !{!97, !169, !74, !97}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !608, line: 167)
!608 = !DISubprogram(name: "wctomb", scope: !482, file: !482, line: 869, type: !609, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DISubroutineType(types: !610)
!610 = !{!5, !170, !63}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !612, line: 220)
!612 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !482, line: 121, baseType: !613)
!613 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !482, line: 117, size: 128, align: 64, elements: !614, identifier: "_ZTS7lldiv_t")
!614 = !{!615, !616}
!615 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !613, file: !482, line: 119, baseType: !295, size: 64, align: 64)
!616 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !613, file: !482, line: 120, baseType: !295, size: 64, align: 64, offset: 64)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !618, line: 226)
!618 = !DISubprogram(name: "_Exit", scope: !482, file: !482, line: 557, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !620, line: 230)
!620 = !DISubprogram(name: "llabs", scope: !482, file: !482, line: 779, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{!295, !295}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !624, line: 236)
!624 = !DISubprogram(name: "lldiv", scope: !482, file: !482, line: 796, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DISubroutineType(types: !626)
!626 = !{!612, !295, !295}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !628, line: 247)
!628 = !DISubprogram(name: "atoll", scope: !482, file: !482, line: 157, type: !629, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!629 = !DISubroutineType(types: !630)
!630 = !{!295, !99}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !632, line: 248)
!632 = !DISubprogram(name: "strtoll", scope: !482, file: !482, line: 209, type: !633, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DISubroutineType(types: !634)
!634 = !{!295, !98, !591, !5}
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !636, line: 249)
!636 = !DISubprogram(name: "strtoull", scope: !482, file: !482, line: 214, type: !637, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!637 = !DISubroutineType(types: !638)
!638 = !{!300, !98, !591, !5}
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !640, line: 251)
!640 = !DISubprogram(name: "strtof", scope: !482, file: !482, line: 172, type: !641, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!641 = !DISubroutineType(types: !642)
!642 = !{!228, !98, !591}
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !644, line: 252)
!644 = !DISubprogram(name: "strtold", scope: !482, file: !482, line: 175, type: !645, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!645 = !DISubroutineType(types: !646)
!646 = !{!290, !98, !591}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !612, line: 260)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !618, line: 262)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !620, line: 264)
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !651, line: 265)
!651 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !286, file: !652, line: 233, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/cstdlib", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !624, line: 266)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !628, line: 268)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !640, line: 269)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !632, line: 270)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !636, line: 271)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !644, line: 272)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !660, line: 98)
!660 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !56, line: 48, baseType: !57)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !662, line: 99)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !56, line: 110, baseType: !663)
!663 = !DIDerivedType(tag: DW_TAG_typedef, name: "_G_fpos_t", file: !664, line: 25, baseType: !665)
!664 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/_G_config.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!665 = !DICompositeType(tag: DW_TAG_structure_type, file: !664, line: 21, size: 96, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !667, line: 101)
!667 = !DISubprogram(name: "clearerr", scope: !56, file: !56, line: 826, type: !668, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DISubroutineType(types: !669)
!669 = !{null, !670}
!670 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !660, size: 32, align: 32)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !672, line: 102)
!672 = !DISubprogram(name: "fclose", scope: !56, file: !56, line: 237, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!673 = !DISubroutineType(types: !674)
!674 = !{!5, !670}
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !676, line: 103)
!676 = !DISubprogram(name: "feof", scope: !56, file: !56, line: 828, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !678, line: 104)
!678 = !DISubprogram(name: "ferror", scope: !56, file: !56, line: 830, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !680, line: 105)
!680 = !DISubprogram(name: "fflush", scope: !56, file: !56, line: 242, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !682, line: 106)
!682 = !DISubprogram(name: "fgetc", scope: !56, file: !56, line: 531, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !684, line: 107)
!684 = !DISubprogram(name: "fgetpos", scope: !56, file: !56, line: 798, type: !685, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!685 = !DISubroutineType(types: !686)
!686 = !{!5, !687, !688}
!687 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !670)
!688 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !689)
!689 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !662, size: 32, align: 32)
!690 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !691, line: 108)
!691 = !DISubprogram(name: "fgets", scope: !56, file: !56, line: 622, type: !692, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!692 = !DISubroutineType(types: !693)
!693 = !{!170, !169, !5, !687}
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !695, line: 109)
!695 = !DISubprogram(name: "fopen", scope: !56, file: !56, line: 272, type: !696, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!696 = !DISubroutineType(types: !697)
!697 = !{!670, !98, !98}
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !699, line: 110)
!699 = !DISubprogram(name: "fprintf", scope: !56, file: !56, line: 356, type: !700, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!700 = !DISubroutineType(types: !701)
!701 = !{!5, !687, !98, null}
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !703, line: 111)
!703 = !DISubprogram(name: "fputc", scope: !56, file: !56, line: 573, type: !704, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!704 = !DISubroutineType(types: !705)
!705 = !{!5, !5, !670}
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !707, line: 112)
!707 = !DISubprogram(name: "fputs", scope: !56, file: !56, line: 689, type: !708, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!708 = !DISubroutineType(types: !709)
!709 = !{!5, !98, !687}
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !711, line: 113)
!711 = !DISubprogram(name: "fread", scope: !56, file: !56, line: 709, type: !712, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!712 = !DISubroutineType(types: !713)
!713 = !{!97, !714, !97, !97, !687}
!714 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !148)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !716, line: 114)
!716 = !DISubprogram(name: "freopen", scope: !56, file: !56, line: 278, type: !717, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!717 = !DISubroutineType(types: !718)
!718 = !{!670, !98, !98, !687}
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !720, line: 115)
!720 = !DISubprogram(name: "fscanf", scope: !56, file: !56, line: 425, type: !700, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !722, line: 116)
!722 = !DISubprogram(name: "fseek", scope: !56, file: !56, line: 749, type: !723, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!723 = !DISubroutineType(types: !724)
!724 = !{!5, !670, !237, !5}
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !726, line: 117)
!726 = !DISubprogram(name: "fsetpos", scope: !56, file: !56, line: 803, type: !727, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!727 = !DISubroutineType(types: !728)
!728 = !{!5, !670, !729}
!729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !730, size: 32, align: 32)
!730 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !662)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !732, line: 118)
!732 = !DISubprogram(name: "ftell", scope: !56, file: !56, line: 754, type: !733, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!733 = !DISubroutineType(types: !734)
!734 = !{!237, !670}
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !736, line: 119)
!736 = !DISubprogram(name: "fwrite", scope: !56, file: !56, line: 715, type: !737, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!737 = !DISubroutineType(types: !738)
!738 = !{!97, !739, !97, !97, !687}
!739 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !519)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !741, line: 120)
!741 = !DISubprogram(name: "getc", scope: !56, file: !56, line: 532, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !743, line: 121)
!743 = !DISubprogram(name: "getchar", scope: !56, file: !56, line: 538, type: !577, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !745, line: 124)
!745 = !DISubprogram(name: "gets", scope: !56, file: !56, line: 638, type: !746, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!746 = !DISubroutineType(types: !747)
!747 = !{!170, !170}
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !749, line: 126)
!749 = !DISubprogram(name: "perror", scope: !56, file: !56, line: 846, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!750 = !DISubroutineType(types: !751)
!751 = !{null, !99}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !753, line: 127)
!753 = !DISubprogram(name: "printf", scope: !56, file: !56, line: 362, type: !754, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!754 = !DISubroutineType(types: !755)
!755 = !{!5, !98, null}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !757, line: 128)
!757 = !DISubprogram(name: "putc", scope: !56, file: !56, line: 574, type: !704, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !759, line: 129)
!759 = !DISubprogram(name: "putchar", scope: !56, file: !56, line: 580, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !761, line: 130)
!761 = !DISubprogram(name: "puts", scope: !56, file: !56, line: 695, type: !509, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !763, line: 131)
!763 = !DISubprogram(name: "remove", scope: !56, file: !56, line: 178, type: !509, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !765, line: 132)
!765 = !DISubprogram(name: "rename", scope: !56, file: !56, line: 180, type: !766, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!766 = !DISubroutineType(types: !767)
!767 = !{!5, !99, !99}
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !769, line: 133)
!769 = !DISubprogram(name: "rewind", scope: !56, file: !56, line: 759, type: !668, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !771, line: 134)
!771 = !DISubprogram(name: "scanf", scope: !56, file: !56, line: 431, type: !754, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !773, line: 135)
!773 = !DISubprogram(name: "setbuf", scope: !56, file: !56, line: 332, type: !774, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!774 = !DISubroutineType(types: !775)
!775 = !{null, !687, !169}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !777, line: 136)
!777 = !DISubprogram(name: "setvbuf", scope: !56, file: !56, line: 336, type: !778, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DISubroutineType(types: !779)
!779 = !{!5, !687, !169, !5, !97}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !781, line: 137)
!781 = !DISubprogram(name: "sprintf", scope: !56, file: !56, line: 364, type: !782, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DISubroutineType(types: !783)
!783 = !{!5, !169, !98, null}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !785, line: 138)
!785 = !DISubprogram(name: "sscanf", scope: !56, file: !56, line: 433, type: !786, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DISubroutineType(types: !787)
!787 = !{!5, !98, !98, null}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !789, line: 139)
!789 = !DISubprogram(name: "tmpfile", scope: !56, file: !56, line: 195, type: !790, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DISubroutineType(types: !791)
!791 = !{!670}
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !793, line: 141)
!793 = !DISubprogram(name: "tmpnam", scope: !56, file: !56, line: 209, type: !746, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !795, line: 143)
!795 = !DISubprogram(name: "ungetc", scope: !56, file: !56, line: 702, type: !704, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !797, line: 144)
!797 = !DISubprogram(name: "vfprintf", scope: !56, file: !56, line: 371, type: !798, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DISubroutineType(types: !799)
!799 = !{!5, !687, !98, !141}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !801, line: 145)
!801 = !DISubprogram(name: "vprintf", scope: !56, file: !56, line: 377, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DISubroutineType(types: !803)
!803 = !{!5, !98, !141}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !805, line: 146)
!805 = !DISubprogram(name: "vsprintf", scope: !56, file: !56, line: 379, type: !806, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DISubroutineType(types: !807)
!807 = !{!5, !169, !98, !141}
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !809, line: 175)
!809 = !DISubprogram(name: "snprintf", scope: !56, file: !56, line: 386, type: !810, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!810 = !DISubroutineType(types: !811)
!811 = !{!5, !169, !97, !98, null}
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !813, line: 176)
!813 = !DISubprogram(name: "vfscanf", scope: !56, file: !56, line: 471, type: !798, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !815, line: 177)
!815 = !DISubprogram(name: "vscanf", scope: !56, file: !56, line: 479, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !817, line: 178)
!817 = !DISubprogram(name: "vsnprintf", scope: !56, file: !56, line: 390, type: !818, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!818 = !DISubroutineType(types: !819)
!819 = !{!5, !169, !97, !98, !141}
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !286, entity: !821, line: 179)
!821 = !DISubprogram(name: "vsscanf", scope: !56, file: !56, line: 483, type: !822, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!822 = !DISubroutineType(types: !823)
!823 = !{!5, !98, !98, !141}
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !809, line: 185)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !813, line: 186)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !815, line: 187)
!827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !817, line: 188)
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !821, line: 189)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !830, line: 82)
!830 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !831, line: 186, baseType: !832)
!831 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/wctype.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!832 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !833, size: 32, align: 32)
!833 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !834)
!834 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !835, line: 40, baseType: !5)
!835 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/bits/types.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !837, line: 83)
!837 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !831, line: 52, baseType: !242)
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !44, line: 84)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !840, line: 86)
!840 = !DISubprogram(name: "iswalnum", scope: !831, file: !831, line: 111, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !842, line: 87)
!842 = !DISubprogram(name: "iswalpha", scope: !831, file: !831, line: 117, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !844, line: 89)
!844 = !DISubprogram(name: "iswblank", scope: !831, file: !831, line: 162, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !846, line: 91)
!846 = !DISubprogram(name: "iswcntrl", scope: !831, file: !831, line: 120, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!847 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !848, line: 92)
!848 = !DISubprogram(name: "iswctype", scope: !831, file: !831, line: 175, type: !849, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!849 = !DISubroutineType(types: !850)
!850 = !{!5, !44, !837}
!851 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !852, line: 93)
!852 = !DISubprogram(name: "iswdigit", scope: !831, file: !831, line: 124, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!853 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !854, line: 94)
!854 = !DISubprogram(name: "iswgraph", scope: !831, file: !831, line: 128, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !856, line: 95)
!856 = !DISubprogram(name: "iswlower", scope: !831, file: !831, line: 133, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !858, line: 96)
!858 = !DISubprogram(name: "iswprint", scope: !831, file: !831, line: 136, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !860, line: 97)
!860 = !DISubprogram(name: "iswpunct", scope: !831, file: !831, line: 141, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !862, line: 98)
!862 = !DISubprogram(name: "iswspace", scope: !831, file: !831, line: 146, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !864, line: 99)
!864 = !DISubprogram(name: "iswupper", scope: !831, file: !831, line: 151, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !866, line: 100)
!866 = !DISubprogram(name: "iswxdigit", scope: !831, file: !831, line: 156, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !868, line: 101)
!868 = !DISubprogram(name: "towctrans", scope: !831, file: !831, line: 221, type: !869, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!869 = !DISubroutineType(types: !870)
!870 = !{!44, !44, !830}
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !872, line: 102)
!872 = !DISubprogram(name: "towlower", scope: !831, file: !831, line: 194, type: !873, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!873 = !DISubroutineType(types: !874)
!874 = !{!44, !44}
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !876, line: 103)
!876 = !DISubprogram(name: "towupper", scope: !831, file: !831, line: 197, type: !873, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !878, line: 104)
!878 = !DISubprogram(name: "wctrans", scope: !831, file: !831, line: 218, type: !879, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!879 = !DISubroutineType(types: !880)
!880 = !{!830, !99}
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !882, line: 105)
!882 = !DISubprogram(name: "wctype", scope: !831, file: !831, line: 171, type: !883, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DISubroutineType(types: !884)
!884 = !{!837, !99}
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !886, line: 75)
!886 = !DISubprogram(name: "memchr", scope: !887, file: !887, line: 92, type: !888, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!887 = !DIFile(filename: "/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/string.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!888 = !DISubroutineType(types: !889)
!889 = !{!148, !519, !5, !97}
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !891, line: 76)
!891 = !DISubprogram(name: "memcmp", scope: !887, file: !887, line: 65, type: !892, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!892 = !DISubroutineType(types: !893)
!893 = !{!5, !519, !519, !97}
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !895, line: 77)
!895 = !DISubprogram(name: "memcpy", scope: !887, file: !887, line: 42, type: !896, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!896 = !DISubroutineType(types: !897)
!897 = !{!148, !714, !739, !97}
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !899, line: 78)
!899 = !DISubprogram(name: "memmove", scope: !887, file: !887, line: 46, type: !900, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DISubroutineType(types: !901)
!901 = !{!148, !148, !519, !97}
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !903, line: 79)
!903 = !DISubprogram(name: "memset", scope: !887, file: !887, line: 62, type: !904, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!904 = !DISubroutineType(types: !905)
!905 = !{!148, !148, !5, !97}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !907, line: 80)
!907 = !DISubprogram(name: "strcat", scope: !887, file: !887, line: 133, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!170, !169, !98}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !911, line: 81)
!911 = !DISubprogram(name: "strcmp", scope: !887, file: !887, line: 140, type: !766, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !913, line: 82)
!913 = !DISubprogram(name: "strcoll", scope: !887, file: !887, line: 147, type: !766, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !915, line: 83)
!915 = !DISubprogram(name: "strcpy", scope: !887, file: !887, line: 125, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !917, line: 84)
!917 = !DISubprogram(name: "strcspn", scope: !887, file: !887, line: 280, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!918 = !DISubroutineType(types: !919)
!919 = !{!97, !99, !99}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !921, line: 85)
!921 = !DISubprogram(name: "strerror", scope: !887, file: !887, line: 408, type: !922, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!922 = !DISubroutineType(types: !923)
!923 = !{!170, !5}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !925, line: 86)
!925 = !DISubprogram(name: "strlen", scope: !887, file: !887, line: 394, type: !926, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!926 = !DISubroutineType(types: !927)
!927 = !{!97, !99}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !929, line: 87)
!929 = !DISubprogram(name: "strncat", scope: !887, file: !887, line: 136, type: !930, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!930 = !DISubroutineType(types: !931)
!931 = !{!170, !169, !98, !97}
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !933, line: 88)
!933 = !DISubprogram(name: "strncmp", scope: !887, file: !887, line: 143, type: !934, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!934 = !DISubroutineType(types: !935)
!935 = !{!5, !99, !99, !97}
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !937, line: 89)
!937 = !DISubprogram(name: "strncpy", scope: !887, file: !887, line: 128, type: !930, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !939, line: 90)
!939 = !DISubprogram(name: "strspn", scope: !887, file: !887, line: 284, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !941, line: 91)
!941 = !DISubprogram(name: "strtok", scope: !887, file: !887, line: 343, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !943, line: 92)
!943 = !DISubprogram(name: "strxfrm", scope: !887, file: !887, line: 150, type: !944, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!944 = !DISubroutineType(types: !945)
!945 = !{!97, !169, !98, !97}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !947, line: 93)
!947 = !DISubprogram(name: "strchr", scope: !887, file: !887, line: 231, type: !948, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!948 = !DISubroutineType(types: !949)
!949 = !{!170, !99, !5}
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !951, line: 94)
!951 = !DISubprogram(name: "strpbrk", scope: !887, file: !887, line: 310, type: !952, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!952 = !DISubroutineType(types: !953)
!953 = !{!170, !99, !99}
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !955, line: 95)
!955 = !DISubprogram(name: "strrchr", scope: !887, file: !887, line: 258, type: !948, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !8, entity: !957, line: 96)
!957 = !DISubprogram(name: "strstr", scope: !887, file: !887, line: 337, type: !952, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!958 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !959, line: 38)
!959 = !DINamespace(name: "sds_utils", scope: null, file: !960, line: 5)
!960 = !DIFile(filename: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/libs/sds_utils/sds_utils.h", directory: "/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/emu")
!961 = !{i32 2, !"Dwarf Version", i32 4}
!962 = !{i32 2, !"Debug Info Version", i32 3}
!963 = !{i32 1, !"wchar_size", i32 4}
!964 = !{i32 1, !"min_enum_size", i32 4}
!965 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!966 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !10, file: !10, line: 74, type: !492, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!967 = !DILocation(line: 74, column: 25, scope: !966)
!968 = !DILocation(line: 74, column: 25, scope: !969)
!969 = !DILexicalBlockFile(scope: !966, file: !10, discriminator: 1)
!970 = !{!"Init"}
!971 = !{!"void."}
!972 = !{!"/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/bits/ios_base.h"}
!973 = !{!"~Init"}
!974 = distinct !DISubprogram(name: "mean_value", linkageName: "_Z10mean_valuePiS_i", scope: !1, file: !1, line: 40, type: !975, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!975 = !DISubroutineType(types: !976)
!976 = !{null, !4, !4, !5}
!977 = !{!"mean_value"}
!978 = !{!"void.int [].1.int [].1.int.0"}
!979 = !{!"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/main.cpp"}
!980 = !DILocalVariable(name: "in", arg: 1, scope: !974, file: !1, line: 40, type: !4)
!981 = !DIExpression()
!982 = !DILocation(line: 40, column: 21, scope: !974)
!983 = !DILocalVariable(name: "out", arg: 2, scope: !974, file: !1, line: 40, type: !4)
!984 = !DILocation(line: 40, column: 31, scope: !974)
!985 = !DILocalVariable(name: "n", arg: 3, scope: !974, file: !1, line: 40, type: !5)
!986 = !DILocation(line: 40, column: 42, scope: !974)
!987 = !DILocation(line: 42, column: 16, scope: !974)
!988 = !DILocation(line: 42, column: 24, scope: !974)
!989 = !DILocation(line: 42, column: 22, scope: !974)
!990 = !DILocation(line: 42, column: 32, scope: !974)
!991 = !DILocation(line: 42, column: 5, scope: !974)
!992 = !DILocation(line: 42, column: 12, scope: !974)
!993 = !DILocalVariable(name: "i", scope: !994, file: !1, line: 43, type: !5)
!994 = distinct !DILexicalBlock(scope: !974, file: !1, line: 43, column: 5)
!995 = !DILocation(line: 43, column: 14, scope: !994)
!996 = !DILocation(line: 43, column: 10, scope: !994)
!997 = !DILocation(line: 43, column: 22, scope: !998)
!998 = !DILexicalBlockFile(scope: !999, file: !1, discriminator: 1)
!999 = distinct !DILexicalBlock(scope: !994, file: !1, line: 43, column: 5)
!1000 = !DILocation(line: 43, column: 26, scope: !998)
!1001 = !DILocation(line: 43, column: 27, scope: !998)
!1002 = !DILocation(line: 43, column: 24, scope: !998)
!1003 = !DILocation(line: 43, column: 5, scope: !998)
!1004 = !DILocation(line: 45, column: 22, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !999, file: !1, line: 44, column: 5)
!1006 = !DILocation(line: 45, column: 23, scope: !1005)
!1007 = !DILocation(line: 45, column: 19, scope: !1005)
!1008 = !DILocation(line: 45, column: 32, scope: !1005)
!1009 = !DILocation(line: 45, column: 29, scope: !1005)
!1010 = !DILocation(line: 45, column: 27, scope: !1005)
!1011 = !DILocation(line: 45, column: 40, scope: !1005)
!1012 = !DILocation(line: 45, column: 41, scope: !1005)
!1013 = !DILocation(line: 45, column: 37, scope: !1005)
!1014 = !DILocation(line: 45, column: 35, scope: !1005)
!1015 = !DILocation(line: 45, column: 46, scope: !1005)
!1016 = !DILocation(line: 45, column: 13, scope: !1005)
!1017 = !DILocation(line: 45, column: 9, scope: !1005)
!1018 = !DILocation(line: 45, column: 16, scope: !1005)
!1019 = !DILocation(line: 46, column: 5, scope: !1005)
!1020 = !DILocation(line: 43, column: 33, scope: !1021)
!1021 = !DILexicalBlockFile(scope: !999, file: !1, discriminator: 2)
!1022 = !DILocation(line: 43, column: 5, scope: !1021)
!1023 = distinct !{!1023, !1024}
!1024 = !DILocation(line: 43, column: 5, scope: !974)
!1025 = !DILocation(line: 47, column: 20, scope: !974)
!1026 = !DILocation(line: 47, column: 21, scope: !974)
!1027 = !DILocation(line: 47, column: 17, scope: !974)
!1028 = !DILocation(line: 47, column: 31, scope: !974)
!1029 = !DILocation(line: 47, column: 33, scope: !974)
!1030 = !DILocation(line: 47, column: 27, scope: !974)
!1031 = !DILocation(line: 47, column: 25, scope: !974)
!1032 = !DILocation(line: 47, column: 38, scope: !974)
!1033 = !DILocation(line: 47, column: 9, scope: !974)
!1034 = !DILocation(line: 47, column: 10, scope: !974)
!1035 = !DILocation(line: 47, column: 5, scope: !974)
!1036 = !DILocation(line: 47, column: 14, scope: !974)
!1037 = !DILocation(line: 48, column: 1, scope: !974)
!1038 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 50, type: !1039, isLocal: false, isDefinition: true, scopeLine: 51, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!5, !5, !592}
!1041 = !{!"main"}
!1042 = !{!"int.int.0.char **.1"}
!1043 = !DILocalVariable(name: "argc", arg: 1, scope: !1038, file: !1, line: 50, type: !5)
!1044 = !DILocation(line: 50, column: 14, scope: !1038)
!1045 = !DILocalVariable(name: "argv", arg: 2, scope: !1038, file: !1, line: 50, type: !592)
!1046 = !DILocation(line: 50, column: 27, scope: !1038)
!1047 = !DILocalVariable(name: "vector_size_bytes", scope: !1038, file: !1, line: 53, type: !97)
!1048 = !DILocation(line: 53, column: 12, scope: !1038)
!1049 = !DILocalVariable(name: "source_input", scope: !1038, file: !1, line: 58, type: !4)
!1050 = !DILocation(line: 58, column: 10, scope: !1038)
!1051 = !DILocation(line: 58, column: 49, scope: !1038)
!1052 = !DILocation(line: 58, column: 39, scope: !1038)
!1053 = !DILocation(line: 58, column: 31, scope: !1038)
!1054 = !DILocalVariable(name: "source_hw_results", scope: !1038, file: !1, line: 59, type: !4)
!1055 = !DILocation(line: 59, column: 10, scope: !1038)
!1056 = !DILocation(line: 59, column: 49, scope: !1038)
!1057 = !DILocation(line: 59, column: 39, scope: !1038)
!1058 = !DILocation(line: 59, column: 31, scope: !1038)
!1059 = !DILocalVariable(name: "source_sw_results", scope: !1038, file: !1, line: 62, type: !4)
!1060 = !DILocation(line: 62, column: 10, scope: !1038)
!1061 = !DILocation(line: 62, column: 46, scope: !1038)
!1062 = !DILocation(line: 62, column: 39, scope: !1038)
!1063 = !DILocation(line: 62, column: 31, scope: !1038)
!1064 = !DILocalVariable(name: "i", scope: !1065, file: !1, line: 65, type: !5)
!1065 = distinct !DILexicalBlock(scope: !1038, file: !1, line: 65, column: 5)
!1066 = !DILocation(line: 65, column: 13, scope: !1065)
!1067 = !DILocation(line: 65, column: 9, scope: !1065)
!1068 = !DILocation(line: 65, column: 21, scope: !1069)
!1069 = !DILexicalBlockFile(scope: !1070, file: !1, discriminator: 1)
!1070 = distinct !DILexicalBlock(scope: !1065, file: !1, line: 65, column: 5)
!1071 = !DILocation(line: 65, column: 23, scope: !1069)
!1072 = !DILocation(line: 65, column: 5, scope: !1069)
!1073 = !DILocation(line: 66, column: 27, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1070, file: !1, line: 65, column: 41)
!1075 = !DILocation(line: 66, column: 34, scope: !1074)
!1076 = !DILocation(line: 66, column: 22, scope: !1074)
!1077 = !DILocation(line: 66, column: 9, scope: !1074)
!1078 = !DILocation(line: 66, column: 25, scope: !1074)
!1079 = !DILocation(line: 67, column: 45, scope: !1074)
!1080 = !DILocation(line: 67, column: 32, scope: !1074)
!1081 = !DILocation(line: 67, column: 27, scope: !1074)
!1082 = !DILocation(line: 67, column: 9, scope: !1074)
!1083 = !DILocation(line: 67, column: 30, scope: !1074)
!1084 = !DILocation(line: 68, column: 27, scope: !1074)
!1085 = !DILocation(line: 68, column: 9, scope: !1074)
!1086 = !DILocation(line: 68, column: 30, scope: !1074)
!1087 = !DILocation(line: 69, column: 5, scope: !1074)
!1088 = !DILocation(line: 65, column: 38, scope: !1089)
!1089 = !DILexicalBlockFile(scope: !1070, file: !1, discriminator: 2)
!1090 = !DILocation(line: 65, column: 5, scope: !1089)
!1091 = distinct !{!1091, !1092}
!1092 = !DILocation(line: 65, column: 5, scope: !1038)
!1093 = !DILocalVariable(name: "hw_ctr", scope: !1038, file: !1, line: 70, type: !1094)
!1094 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "perf_counter", scope: !959, file: !960, line: 6, size: 192, align: 64, elements: !1095, identifier: "_ZTSN9sds_utils12perf_counterE")
!1095 = !{!1096, !1097, !1098, !1099, !1103, !1104, !1105, !1106}
!1096 = !DIDerivedType(tag: DW_TAG_member, name: "tot", scope: !1094, file: !960, line: 9, baseType: !412, size: 64, align: 64, flags: DIFlagPublic)
!1097 = !DIDerivedType(tag: DW_TAG_member, name: "cnt", scope: !1094, file: !960, line: 9, baseType: !412, size: 64, align: 64, offset: 64, flags: DIFlagPublic)
!1098 = !DIDerivedType(tag: DW_TAG_member, name: "calls", scope: !1094, file: !960, line: 9, baseType: !412, size: 64, align: 64, offset: 128, flags: DIFlagPublic)
!1099 = !DISubprogram(name: "perf_counter", scope: !1094, file: !960, line: 10, type: !1100, isLocal: false, isDefinition: false, scopeLine: 10, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!1100 = !DISubroutineType(types: !1101)
!1101 = !{null, !1102}
!1102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 32, align: 32, flags: DIFlagArtificial | DIFlagObjectPointer)
!1103 = !DISubprogram(name: "reset", linkageName: "_ZN9sds_utils12perf_counter5resetEv", scope: !1094, file: !960, line: 11, type: !1100, isLocal: false, isDefinition: false, scopeLine: 11, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!1104 = !DISubprogram(name: "start", linkageName: "_ZN9sds_utils12perf_counter5startEv", scope: !1094, file: !960, line: 12, type: !1100, isLocal: false, isDefinition: false, scopeLine: 12, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!1105 = !DISubprogram(name: "stop", linkageName: "_ZN9sds_utils12perf_counter4stopEv", scope: !1094, file: !960, line: 13, type: !1100, isLocal: false, isDefinition: false, scopeLine: 13, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!1106 = !DISubprogram(name: "avg_cpu_cycles", linkageName: "_ZN9sds_utils12perf_counter14avg_cpu_cyclesEv", scope: !1094, file: !960, line: 14, type: !1107, isLocal: false, isDefinition: false, scopeLine: 14, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!412, !1102}
!1109 = !DILocation(line: 70, column: 18, scope: !1038)
!1110 = !DILocation(line: 72, column: 16, scope: !1038)
!1111 = !DILocation(line: 72, column: 29, scope: !1038)
!1112 = !DILocation(line: 72, column: 5, scope: !1038)
!1113 = !DILocalVariable(name: "size", scope: !1038, file: !1, line: 74, type: !5)
!1114 = !DILocation(line: 74, column: 9, scope: !1038)
!1115 = !DILocation(line: 76, column: 12, scope: !1038)
!1116 = !DILocation(line: 78, column: 22, scope: !1038)
!1117 = !DILocation(line: 78, column: 36, scope: !1038)
!1118 = !DILocation(line: 78, column: 55, scope: !1038)
!1119 = !DILocation(line: 78, column: 5, scope: !1038)
!1120 = !DILocation(line: 79, column: 12, scope: !1038)
!1121 = !DILocalVariable(name: "hw_cycles", scope: !1038, file: !1, line: 81, type: !412)
!1122 = !DILocation(line: 81, column: 14, scope: !1038)
!1123 = !DILocation(line: 81, column: 33, scope: !1038)
!1124 = !DILocation(line: 83, column: 15, scope: !1038)
!1125 = !DILocation(line: 84, column: 10, scope: !1038)
!1126 = !DILocation(line: 84, column: 7, scope: !1038)
!1127 = !DILocation(line: 84, column: 20, scope: !1128)
!1128 = !DILexicalBlockFile(scope: !1038, file: !1, discriminator: 1)
!1129 = !DILocalVariable(name: "match", scope: !1038, file: !1, line: 87, type: !5)
!1130 = !DILocation(line: 87, column: 9, scope: !1038)
!1131 = !DILocation(line: 88, column: 15, scope: !1038)
!1132 = !DILocation(line: 88, column: 30, scope: !1128)
!1133 = !DILocalVariable(name: "i", scope: !1134, file: !1, line: 89, type: !5)
!1134 = distinct !DILexicalBlock(scope: !1038, file: !1, line: 89, column: 5)
!1135 = !DILocation(line: 89, column: 14, scope: !1134)
!1136 = !DILocation(line: 89, column: 10, scope: !1134)
!1137 = !DILocation(line: 89, column: 22, scope: !1138)
!1138 = !DILexicalBlockFile(scope: !1139, file: !1, discriminator: 1)
!1139 = distinct !DILexicalBlock(scope: !1134, file: !1, line: 89, column: 5)
!1140 = !DILocation(line: 89, column: 24, scope: !1138)
!1141 = !DILocation(line: 89, column: 5, scope: !1138)
!1142 = !DILocation(line: 90, column: 31, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1144, file: !1, line: 90, column: 13)
!1144 = distinct !DILexicalBlock(scope: !1139, file: !1, line: 89, column: 42)
!1145 = !DILocation(line: 90, column: 13, scope: !1143)
!1146 = !DILocation(line: 90, column: 55, scope: !1143)
!1147 = !DILocation(line: 90, column: 37, scope: !1143)
!1148 = !DILocation(line: 90, column: 34, scope: !1143)
!1149 = !DILocation(line: 90, column: 13, scope: !1144)
!1150 = !DILocation(line: 91, column: 23, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1143, file: !1, line: 90, column: 58)
!1152 = !DILocation(line: 91, column: 51, scope: !1153)
!1153 = !DILexicalBlockFile(scope: !1151, file: !1, discriminator: 1)
!1154 = !DILocation(line: 92, column: 23, scope: !1151)
!1155 = !DILocation(line: 92, column: 36, scope: !1151)
!1156 = !DILocation(line: 92, column: 33, scope: !1153)
!1157 = !DILocation(line: 92, column: 38, scope: !1158)
!1158 = !DILexicalBlockFile(scope: !1151, file: !1, discriminator: 2)
!1159 = !DILocation(line: 92, column: 79, scope: !1151)
!1160 = !DILocation(line: 92, column: 61, scope: !1151)
!1161 = !DILocation(line: 92, column: 58, scope: !1162)
!1162 = !DILexicalBlockFile(scope: !1151, file: !1, discriminator: 3)
!1163 = !DILocation(line: 93, column: 17, scope: !1151)
!1164 = !DILocation(line: 93, column: 61, scope: !1151)
!1165 = !DILocation(line: 93, column: 43, scope: !1151)
!1166 = !DILocation(line: 93, column: 40, scope: !1153)
!1167 = !DILocation(line: 93, column: 64, scope: !1158)
!1168 = !DILocation(line: 94, column: 19, scope: !1151)
!1169 = !DILocation(line: 95, column: 13, scope: !1151)
!1170 = !DILocation(line: 97, column: 44, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1143, file: !1, line: 96, column: 14)
!1172 = !DILocation(line: 97, column: 26, scope: !1171)
!1173 = !DILocation(line: 97, column: 23, scope: !1171)
!1174 = !DILocation(line: 97, column: 47, scope: !1175)
!1175 = !DILexicalBlockFile(scope: !1171, file: !1, discriminator: 1)
!1176 = !DILocation(line: 98, column: 21, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1171, file: !1, line: 98, column: 18)
!1178 = !DILocation(line: 98, column: 22, scope: !1177)
!1179 = !DILocation(line: 98, column: 26, scope: !1177)
!1180 = !DILocation(line: 98, column: 32, scope: !1177)
!1181 = !DILocation(line: 98, column: 18, scope: !1171)
!1182 = !DILocation(line: 98, column: 48, scope: !1183)
!1183 = !DILexicalBlockFile(scope: !1177, file: !1, discriminator: 1)
!1184 = !DILocation(line: 98, column: 38, scope: !1183)
!1185 = !DILocation(line: 100, column: 5, scope: !1144)
!1186 = !DILocation(line: 89, column: 39, scope: !1187)
!1187 = !DILexicalBlockFile(scope: !1139, file: !1, discriminator: 2)
!1188 = !DILocation(line: 89, column: 5, scope: !1187)
!1189 = distinct !{!1189, !1190}
!1190 = !DILocation(line: 89, column: 5, scope: !1038)
!1191 = !DILocation(line: 103, column: 14, scope: !1038)
!1192 = !DILocation(line: 103, column: 5, scope: !1038)
!1193 = !DILocation(line: 104, column: 14, scope: !1038)
!1194 = !DILocation(line: 104, column: 5, scope: !1038)
!1195 = !DILocation(line: 105, column: 10, scope: !1038)
!1196 = !DILocation(line: 105, column: 5, scope: !1038)
!1197 = !DILocation(line: 107, column: 9, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1038, file: !1, line: 107, column: 9)
!1199 = !DILocation(line: 107, column: 9, scope: !1038)
!1200 = !DILocation(line: 108, column: 19, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1198, file: !1, line: 107, column: 15)
!1202 = !DILocation(line: 108, column: 37, scope: !1203)
!1203 = !DILexicalBlockFile(scope: !1201, file: !1, discriminator: 1)
!1204 = !DILocation(line: 109, column: 9, scope: !1201)
!1205 = !DILocation(line: 111, column: 15, scope: !1038)
!1206 = !DILocation(line: 111, column: 33, scope: !1128)
!1207 = !DILocation(line: 112, column: 5, scope: !1038)
!1208 = !DILocation(line: 113, column: 1, scope: !1038)
!1209 = !{!"sds_alloc"}
!1210 = !{!"void .unsigned int.0"}
!1211 = !{!"/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/target/aarch32-linux/include/sds_lib.h"}
!1212 = !{!"t"}
!1213 = !{!"malloc"}
!1214 = !{!"void .size_t.0"}
!1215 = !{!"/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/libc/usr/include/stdlib.h"}
!1216 = !{!"rand"}
!1217 = !{!"int."}
!1218 = distinct !DISubprogram(name: "perf_counter", linkageName: "_ZN9sds_utils12perf_counterC2Ev", scope: !1094, file: !960, line: 10, type: !1100, isLocal: false, isDefinition: true, scopeLine: 10, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1099, variables: !2)
!1219 = !{!"perf_counter"}
!1220 = !{!"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/libs/sds_utils/sds_utils.h"}
!1221 = !DILocalVariable(name: "this", arg: 1, scope: !1218, type: !1222, flags: DIFlagArtificial | DIFlagObjectPointer)
!1222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1094, size: 32, align: 32)
!1223 = !DILocation(line: 0, scope: !1218)
!1224 = !DILocation(line: 10, column: 26, scope: !1218)
!1225 = !DILocation(line: 10, column: 34, scope: !1218)
!1226 = !DILocation(line: 10, column: 42, scope: !1218)
!1227 = !DILocation(line: 10, column: 52, scope: !1218)
!1228 = distinct !DISubprogram(name: "start", linkageName: "_ZN9sds_utils12perf_counter5startEv", scope: !1094, file: !960, line: 12, type: !1100, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1104, variables: !2)
!1229 = !{!"start"}
!1230 = !DILocalVariable(name: "this", arg: 1, scope: !1228, type: !1222, flags: DIFlagArtificial | DIFlagObjectPointer)
!1231 = !DILocation(line: 0, scope: !1228)
!1232 = !DILocation(line: 12, column: 37, scope: !1228)
!1233 = !DILocation(line: 12, column: 31, scope: !1228)
!1234 = !DILocation(line: 12, column: 35, scope: !1228)
!1235 = !DILocation(line: 12, column: 58, scope: !1228)
!1236 = !DILocation(line: 12, column: 63, scope: !1228)
!1237 = !DILocation(line: 12, column: 67, scope: !1228)
!1238 = !{!"mean_value_accel"}
!1239 = !{!"void.int *.1.int *.1.int.0"}
!1240 = !{!"/proj/xhdhdstaff2/kalib/sprite_makefile_dev/apps/cpp/getting_started/dependence_inter/src/mean_value.h"}
!1241 = !{!"in,,,,,,,zero_copy,,,, out,,,,,,,zero_copy,,,, "}
!1242 = distinct !DISubprogram(name: "stop", linkageName: "_ZN9sds_utils12perf_counter4stopEv", scope: !1094, file: !960, line: 13, type: !1100, isLocal: false, isDefinition: true, scopeLine: 13, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1105, variables: !2)
!1243 = !{!"stop"}
!1244 = !DILocalVariable(name: "this", arg: 1, scope: !1242, type: !1222, flags: DIFlagArtificial | DIFlagObjectPointer)
!1245 = !DILocation(line: 0, scope: !1242)
!1246 = !DILocation(line: 13, column: 38, scope: !1242)
!1247 = !DILocation(line: 13, column: 60, scope: !1242)
!1248 = !DILocation(line: 13, column: 58, scope: !1242)
!1249 = !DILocation(line: 13, column: 30, scope: !1242)
!1250 = !DILocation(line: 13, column: 34, scope: !1242)
!1251 = !DILocation(line: 13, column: 66, scope: !1242)
!1252 = distinct !DISubprogram(name: "avg_cpu_cycles", linkageName: "_ZN9sds_utils12perf_counter14avg_cpu_cyclesEv", scope: !1094, file: !960, line: 14, type: !1107, isLocal: false, isDefinition: true, scopeLine: 14, flags: DIFlagPrototyped, isOptimized: false, unit: !0, declaration: !1106, variables: !2)
!1253 = !{!"avg_cpu_cycles"}
!1254 = !{!"uint64_t."}
!1255 = !DILocalVariable(name: "this", arg: 1, scope: !1252, type: !1222, flags: DIFlagArtificial | DIFlagObjectPointer)
!1256 = !DILocation(line: 0, scope: !1252)
!1257 = !DILocation(line: 14, column: 51, scope: !1252)
!1258 = !DILocation(line: 14, column: 57, scope: !1252)
!1259 = !DILocation(line: 14, column: 55, scope: !1252)
!1260 = !DILocation(line: 14, column: 43, scope: !1252)
!1261 = !{!"operator<<"}
!1262 = !{!"basic_ostream<char, struct std::char_traits<char> > .basic_ostream<char, struct std::char_traits<char> > &.0.const char *.1"}
!1263 = !{!"/proj/xbuilds/2017.1_sdx_0419_1/installs/lin64/SDx/2017.1/SDK/gnu/aarch32/lin/gcc-arm-linux-gnueabi/arm-linux-gnueabihf/include/c++/6.2.1/ostream"}
!1264 = !{!"__ostream_type .unsigned long long.0"}
!1265 = !{!"__ostream_type .__ostream_type &(*)(__ostream_type &).1"}
!1266 = !{!"endl"}
!1267 = !{!"basic_ostream<char, struct std::char_traits<char> > .basic_ostream<char, struct std::char_traits<char> > &.0"}
!1268 = !{!"__ostream_type .int.0"}
!1269 = !{!"sds_free"}
!1270 = !{!"void.void *.1"}
!1271 = !{!"free"}
!1272 = !{!"sds_clock_counter"}
!1273 = !{!"unsigned long long."}
!1274 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_main.cpp", scope: !1, file: !1, type: !1275, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !0, variables: !2)
!1275 = !DISubroutineType(types: !2)
!1276 = !DILocation(line: 0, scope: !1274)
