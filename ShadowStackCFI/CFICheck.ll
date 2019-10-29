; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"checking next indirect call...\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Matching CFICheckAddressPtr[mid]: \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"found it!\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"larger!\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"smaller!\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @CFICheck(i64 %target) #0 {
entry:
  %target.addr = alloca i64, align 8
  %CFICheckAddressPtr = alloca i64*, align 8
  %CFICheckAddressNum = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  %mid = alloca i32, align 4
  %i_b = alloca [8 x i8], align 1
  %ii_b = alloca i8*, align 8
  store i64 %target, i64* %target.addr, align 8
  store i64* inttoptr (i64 2305843009213693951 to i64*), i64** %CFICheckAddressPtr, align 8
  store i32 536870911, i32* %CFICheckAddressNum, align 4
  store i32 0, i32* %low, align 4
  %0 = load i32, i32* %CFICheckAddressNum, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %high, align 4
  %call = call i32 @puts(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0))
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end25, %entry
  %2 = load i32, i32* %low, align 4
  %3 = load i32, i32* %high, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %low, align 4
  %5 = load i32, i32* %high, align 4
  %6 = load i32, i32* %low, align 4
  %sub1 = sub nsw i32 %5, %6
  %div = sdiv i32 %sub1, 2
  %add = add nsw i32 %4, %div
  store i32 %add, i32* %mid, align 4
  %call2 = call i32 @puts(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0))
  %7 = load i64*, i64** %CFICheckAddressPtr, align 8
  %8 = load i32, i32* %mid, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 %idxprom
  %9 = load i64, i64* %arrayidx, align 8
  %10 = load i8*, i8** %ii_b, align 8
  %call3 = call i32 (i64, i8*, i32, ...) bitcast (i32 (...)* @itoa to i32 (i64, i8*, i32, ...)*)(i64 %9, i8* %10, i32 10)
  %conv = sext i32 %call3 to i64
  %11 = inttoptr i64 %conv to i8*
  store i8* %11, i8** %ii_b, align 8
  %12 = load i8*, i8** %ii_b, align 8
  %call4 = call i32 @puts(i8* %12)
  %call5 = call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %13 = load i32, i32* %mid, align 4
  %14 = load i32, i32* %high, align 4
  %cmp6 = icmp sge i32 %13, %14
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %15 = load i64*, i64** %CFICheckAddressPtr, align 8
  %16 = load i32, i32* %mid, align 4
  %idxprom8 = sext i32 %16 to i64
  %arrayidx9 = getelementptr inbounds i64, i64* %15, i64 %idxprom8
  %17 = load i64, i64* %arrayidx9, align 8
  %18 = load i64, i64* %target.addr, align 8
  %cmp10 = icmp eq i64 %17, %18
  br i1 %cmp10, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.end
  %call13 = call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0))
  ret void

if.else:                                          ; preds = %if.end
  %19 = load i64*, i64** %CFICheckAddressPtr, align 8
  %20 = load i32, i32* %mid, align 4
  %idxprom14 = sext i32 %20 to i64
  %arrayidx15 = getelementptr inbounds i64, i64* %19, i64 %idxprom14
  %21 = load i64, i64* %arrayidx15, align 8
  %22 = load i64, i64* %target.addr, align 8
  %cmp16 = icmp sgt i64 %21, %22
  br i1 %cmp16, label %if.then18, label %if.else21

if.then18:                                        ; preds = %if.else
  %call19 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %23 = load i32, i32* %mid, align 4
  %sub20 = sub nsw i32 %23, 1
  store i32 %sub20, i32* %high, align 4
  br label %if.end24

if.else21:                                        ; preds = %if.else
  %call22 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0))
  %24 = load i32, i32* %mid, align 4
  %add23 = add nsw i32 %24, 1
  store i32 %add23, i32* %low, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else21, %if.then18
  br label %if.end25

if.end25:                                         ; preds = %if.end24
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  call void @exit(i32 -1) #3
  unreachable
}

declare dso_local i32 @puts(i8*) #1

declare dso_local i32 @itoa(...) #1

; Function Attrs: noreturn
declare dso_local void @exit(i32) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"}
