; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"traverse all targets:\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"checking next indirect call...\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"target: \00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"CFICheckAddressPtr[mid]: \00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"target is smaller than [mid]\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"target is larger than [mid]\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"found it!\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @CFICheck(i64 %target) #0 {
entry:
  %target.addr = alloca i64, align 8
  %CFICheckAddressPtr = alloca i64*, align 8
  %CFICheckAddressNum = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  %mid = alloca i32, align 4
  %i = alloca i32, align 4
  %list = alloca [8 x i8], align 1
  %list_s = alloca i8*, align 8
  %target_d = alloca [8 x i8], align 1
  %target_str = alloca i8*, align 8
  %mid_d = alloca [8 x i8], align 1
  %mid_s = alloca i8*, align 8
  %low_d = alloca [8 x i8], align 1
  %low_s = alloca i8*, align 8
  %high_d = alloca [8 x i8], align 1
  %high_s = alloca i8*, align 8
  %cfiptr_mid = alloca [8 x i8], align 1
  %cfiptr_mid_s = alloca i8*, align 8
  store i64 %target, i64* %target.addr, align 8
  store i64* inttoptr (i64 2305843009213693951 to i64*), i64** %CFICheckAddressPtr, align 8
  store i32 536870911, i32* %CFICheckAddressNum, align 4
  store i32 0, i32* %low, align 4
  %0 = load i32, i32* %CFICheckAddressNum, align 4
  store i32 %0, i32* %high, align 4
  %call = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %CFICheckAddressNum, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = bitcast [8 x i8]* %list to i8*
  store i8* %3, i8** %list_s, align 8
  %4 = load i64*, i64** %CFICheckAddressPtr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 %idxprom
  %6 = load i64, i64* %arrayidx, align 8
  %7 = load i8*, i8** %list_s, align 8
  %call1 = call i8* @my_itoa(i64 %6, i8* %7, i64 16)
  store i8* %call1, i8** %list_s, align 8
  %8 = load i8*, i8** %list_s, align 8
  %call2 = call i32 @puts(i8* %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call3 = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0))
  %10 = bitcast [8 x i8]* %target_d to i8*
  store i8* %10, i8** %target_str, align 8
  %11 = load i64, i64* %target.addr, align 8
  %12 = load i8*, i8** %target_str, align 8
  %call4 = call i8* @my_itoa(i64 %11, i8* %12, i64 16)
  store i8* %call4, i8** %target_str, align 8
  %call5 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0))
  %13 = load i8*, i8** %target_str, align 8
  %call6 = call i32 @puts(i8* %13)
  br label %while.cond

while.cond:                                       ; preds = %if.end40, %for.end
  %14 = load i32, i32* %low, align 4
  %15 = load i32, i32* %high, align 4
  %cmp7 = icmp sle i32 %14, %15
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %16 = load i32, i32* %low, align 4
  %17 = load i32, i32* %high, align 4
  %18 = load i32, i32* %low, align 4
  %sub = sub nsw i32 %17, %18
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %16, %div
  store i32 %add, i32* %mid, align 4
  %19 = bitcast [8 x i8]* %mid_d to i8*
  store i8* %19, i8** %mid_s, align 8
  %20 = load i32, i32* %mid, align 4
  %conv = sext i32 %20 to i64
  %21 = load i8*, i8** %mid_s, align 8
  %call8 = call i8* @my_itoa(i64 %conv, i8* %21, i64 10)
  store i8* %call8, i8** %mid_s, align 8
  %22 = load i8*, i8** %mid_s, align 8
  %call9 = call i32 @puts(i8* %22)
  %23 = bitcast [8 x i8]* %low_d to i8*
  store i8* %23, i8** %low_s, align 8
  %24 = load i32, i32* %low, align 4
  %conv10 = sext i32 %24 to i64
  %25 = load i8*, i8** %low_s, align 8
  %call11 = call i8* @my_itoa(i64 %conv10, i8* %25, i64 10)
  store i8* %call11, i8** %low_s, align 8
  %26 = load i8*, i8** %low_s, align 8
  %call12 = call i32 @puts(i8* %26)
  %27 = bitcast [8 x i8]* %high_d to i8*
  store i8* %27, i8** %high_s, align 8
  %28 = load i32, i32* %high, align 4
  %conv13 = sext i32 %28 to i64
  %29 = load i8*, i8** %high_s, align 8
  %call14 = call i8* @my_itoa(i64 %conv13, i8* %29, i64 10)
  store i8* %call14, i8** %high_s, align 8
  %30 = load i8*, i8** %high_s, align 8
  %call15 = call i32 @puts(i8* %30)
  %31 = bitcast [8 x i8]* %cfiptr_mid to i8*
  store i8* %31, i8** %cfiptr_mid_s, align 8
  %call16 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i64 0, i64 0))
  %32 = load i64*, i64** %CFICheckAddressPtr, align 8
  %33 = load i32, i32* %mid, align 4
  %idxprom17 = sext i32 %33 to i64
  %arrayidx18 = getelementptr inbounds i64, i64* %32, i64 %idxprom17
  %34 = load i64, i64* %arrayidx18, align 8
  %35 = load i8*, i8** %cfiptr_mid_s, align 8
  %call19 = call i8* @my_itoa(i64 %34, i8* %35, i64 16)
  store i8* %call19, i8** %cfiptr_mid_s, align 8
  %36 = load i8*, i8** %cfiptr_mid_s, align 8
  %call20 = call i32 @puts(i8* %36)
  %37 = load i32, i32* %mid, align 4
  %38 = load i32, i32* %high, align 4
  %cmp21 = icmp sgt i32 %37, %38
  br i1 %cmp21, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %39 = load i64*, i64** %CFICheckAddressPtr, align 8
  %40 = load i32, i32* %mid, align 4
  %idxprom23 = sext i32 %40 to i64
  %arrayidx24 = getelementptr inbounds i64, i64* %39, i64 %idxprom23
  %41 = load i64, i64* %arrayidx24, align 8
  %42 = load i64, i64* %target.addr, align 8
  %cmp25 = icmp ugt i64 %41, %42
  br i1 %cmp25, label %if.then27, label %if.else

if.then27:                                        ; preds = %if.end
  %call28 = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i64 0, i64 0))
  %43 = load i32, i32* %mid, align 4
  %sub29 = sub nsw i32 %43, 1
  store i32 %sub29, i32* %high, align 4
  br label %if.end40

if.else:                                          ; preds = %if.end
  %44 = load i64*, i64** %CFICheckAddressPtr, align 8
  %45 = load i32, i32* %mid, align 4
  %idxprom30 = sext i32 %45 to i64
  %arrayidx31 = getelementptr inbounds i64, i64* %44, i64 %idxprom30
  %46 = load i64, i64* %arrayidx31, align 8
  %47 = load i64, i64* %target.addr, align 8
  %cmp32 = icmp ult i64 %46, %47
  br i1 %cmp32, label %if.then34, label %if.else37

if.then34:                                        ; preds = %if.else
  %call35 = call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i64 0, i64 0))
  %48 = load i32, i32* %mid, align 4
  %add36 = add nsw i32 %48, 1
  store i32 %add36, i32* %low, align 4
  br label %if.end39

if.else37:                                        ; preds = %if.else
  %call38 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0))
  ret void

if.end39:                                         ; preds = %if.then34
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then27
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %call41 = call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  call void @exit(i32 -1) #3
  unreachable
}

declare dso_local i32 @puts(i8*) #1

declare dso_local i8* @my_itoa(i64, i8*, i64) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"}
