; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"traverse all targets:\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"checking next indirect call...\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"target: \00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"mid: \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"CFICheckAddressPtr[mid]: \00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"target is smaller than [mid]\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"target is larger than [mid]\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"found it!\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @CFICheck(i64 %target) #0 {
entry:
  %target.addr = alloca i64, align 8
  %CFICheckAddressPtr = alloca i64*, align 8
  %CFICheckAddressNum = alloca i32, align 4
  %low = alloca i64, align 8
  %high = alloca i64, align 8
  %mid = alloca i64, align 8
  %i = alloca i32, align 4
  %list = alloca [9 x i8], align 1
  %list_s = alloca i8*, align 8
  %target_d = alloca [9 x i8], align 1
  %target_str = alloca i8*, align 8
  %mid_d = alloca [9 x i8], align 1
  %ret = alloca i32, align 4
  %cfiptr_mid = alloca [9 x i8], align 1
  %cfiptr_mid_s = alloca i8*, align 8
  store i64 %target, i64* %target.addr, align 8
  store i64* inttoptr (i64 2305843009213693951 to i64*), i64** %CFICheckAddressPtr, align 8
  store i32 536870911, i32* %CFICheckAddressNum, align 4
  store i64 0, i64* %low, align 8
  %0 = load i32, i32* %CFICheckAddressNum, align 4
  %conv = sext i32 %0 to i64
  store i64 %conv, i64* %high, align 8
  %call = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %CFICheckAddressNum, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = bitcast [9 x i8]* %list to i8*
  store i8* %3, i8** %list_s, align 8
  %4 = load i64*, i64** %CFICheckAddressPtr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %idxprom
  %6 = load i64, i64* %arrayidx, align 8
  %7 = load i8*, i8** %list_s, align 8
  %call2 = call i8* @my_itoa(i64 %6, i8* %7, i64 16)
  store i8* %call2, i8** %list_s, align 8
  %8 = load i8*, i8** %list_s, align 8
  %call3 = call i32 @puts(i8* %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call4 = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0))
  %10 = bitcast [9 x i8]* %target_d to i8*
  store i8* %10, i8** %target_str, align 8
  %11 = load i64, i64* %target.addr, align 8
  %12 = load i8*, i8** %target_str, align 8
  %call5 = call i8* @my_itoa(i64 %11, i8* %12, i64 16)
  store i8* %call5, i8** %target_str, align 8
  %call6 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0))
  %13 = load i8*, i8** %target_str, align 8
  %call7 = call i32 @puts(i8* %13)
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %for.end
  %14 = load i64, i64* %low, align 8
  %15 = load i64, i64* %high, align 8
  %cmp8 = icmp ule i64 %14, %15
  br i1 %cmp8, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %16 = load i64, i64* %low, align 8
  %17 = load i64, i64* %high, align 8
  %18 = load i64, i64* %low, align 8
  %sub = sub i64 %17, %18
  %div = udiv i64 %sub, 2
  %add = add i64 %16, %div
  store i64 %add, i64* %mid, align 8
  %call10 = call i32 @puts(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [9 x i8], [9 x i8]* %mid_d, i64 0, i64 0
  %19 = load i64, i64* %mid, align 8
  %call11 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i64 %19) #5
  store i32 %call11, i32* %ret, align 4
  %arraydecay12 = getelementptr inbounds [9 x i8], [9 x i8]* %mid_d, i64 0, i64 0
  %call13 = call i32 @puts(i8* %arraydecay12)
  %20 = bitcast [9 x i8]* %cfiptr_mid to i8*
  store i8* %20, i8** %cfiptr_mid_s, align 8
  %call14 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.5, i64 0, i64 0))
  %21 = load i64*, i64** %CFICheckAddressPtr, align 8
  %22 = load i64, i64* %mid, align 8
  %arrayidx15 = getelementptr inbounds i64, i64* %21, i64 %22
  %23 = load i64, i64* %arrayidx15, align 8
  %24 = load i8*, i8** %cfiptr_mid_s, align 8
  %call16 = call i8* @my_itoa(i64 %23, i8* %24, i64 16)
  store i8* %call16, i8** %cfiptr_mid_s, align 8
  %25 = load i8*, i8** %cfiptr_mid_s, align 8
  %call17 = call i32 @puts(i8* %25)
  %26 = load i64, i64* %mid, align 8
  %27 = load i64, i64* %high, align 8
  %cmp18 = icmp ugt i64 %26, %27
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %28 = load i8*, i8** %cfiptr_mid_s, align 8
  %29 = load i8*, i8** %target_str, align 8
  %call20 = call i32 @strncmp(i8* %28, i8* %29, i64 12) #6
  %cmp21 = icmp sgt i32 %call20, 0
  br i1 %cmp21, label %if.then23, label %if.else

if.then23:                                        ; preds = %if.end
  %call24 = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i64 0, i64 0))
  %30 = load i64, i64* %mid, align 8
  %sub25 = sub i64 %30, 1
  store i64 %sub25, i64* %high, align 8
  br label %if.end35

if.else:                                          ; preds = %if.end
  %31 = load i8*, i8** %cfiptr_mid_s, align 8
  %32 = load i8*, i8** %target_str, align 8
  %call26 = call i32 @strncmp(i8* %31, i8* %32, i64 12) #6
  %cmp27 = icmp slt i32 %call26, 0
  br i1 %cmp27, label %if.then29, label %if.else32

if.then29:                                        ; preds = %if.else
  %call30 = call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i64 0, i64 0))
  %33 = load i64, i64* %mid, align 8
  %add31 = add i64 %33, 1
  store i64 %add31, i64* %low, align 8
  br label %if.end34

if.else32:                                        ; preds = %if.else
  %call33 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i64 0, i64 0))
  ret void

if.end34:                                         ; preds = %if.then29
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then23
  %call36 = call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i64 0, i64 0))
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  call void @exit(i32 -1) #7
  unreachable
}

declare dso_local i32 @puts(i8*) #1

declare dso_local i8* @my_itoa(i64, i8*, i64) #1

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @strncmp(i8*, i8*, i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"}
