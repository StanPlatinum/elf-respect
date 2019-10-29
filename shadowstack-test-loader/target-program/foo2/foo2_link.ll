; ModuleID = 'foo2'
source_filename = "foo2"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"traverse all targets:\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"checking next indirect call...\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"target: \00", align 1
@.str.3 = private unnamed_addr constant [26 x i8] c"CFICheckAddressPtr[mid]: \00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"larger!\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"smaller!\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"found it!\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"----------1 in fun----------\00", align 1
@.str.1.9 = private unnamed_addr constant [22 x i8] c"----------1----------\00", align 1
@.str.2.10 = private unnamed_addr constant [22 x i8] c"----------2----------\00", align 1
@.str.3.11 = private unnamed_addr constant [22 x i8] c"----------3----------\00", align 1
@.str.4.12 = private unnamed_addr constant [22 x i8] c"----------4----------\00", align 1
@.str.5.13 = private unnamed_addr constant [9 x i8] c"success!\00", align 1

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
  %4 = load i32, i32* %i, align 4
  %add = add nsw i32 %4, 48
  %conv = sext i32 %add to i64
  %5 = inttoptr i64 %conv to i8*
  %call1 = call i32 @puts(i8* %5)
  %6 = load i64*, i64** %CFICheckAddressPtr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 %idxprom
  %8 = load i64, i64* %arrayidx, align 8
  %9 = load i8*, i8** %list_s, align 8
  %call2 = call i8* @my_itoa(i64 %8, i8* %9, i64 16)
  store i8* %call2, i8** %list_s, align 8
  %10 = load i8*, i8** %list_s, align 8
  %call3 = call i32 @puts(i8* %10)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call4 = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0))
  %12 = bitcast [8 x i8]* %target_d to i8*
  store i8* %12, i8** %target_str, align 8
  %13 = load i64, i64* %target.addr, align 8
  %14 = load i8*, i8** %target_str, align 8
  %call5 = call i8* @my_itoa(i64 %13, i8* %14, i64 16)
  store i8* %call5, i8** %target_str, align 8
  %call6 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i64 0, i64 0))
  %15 = load i8*, i8** %target_str, align 8
  %call7 = call i32 @puts(i8* %15)
  br label %while.cond

while.cond:                                       ; preds = %if.end44, %for.end
  %16 = load i32, i32* %low, align 4
  %17 = load i32, i32* %high, align 4
  %cmp8 = icmp sle i32 %16, %17
  br i1 %cmp8, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %18 = bitcast [8 x i8]* %mid_d to i8*
  store i8* %18, i8** %mid_s, align 8
  %19 = load i32, i32* %low, align 4
  %20 = load i32, i32* %high, align 4
  %21 = load i32, i32* %low, align 4
  %sub = sub nsw i32 %20, %21
  %div = sdiv i32 %sub, 2
  %add10 = add nsw i32 %19, %div
  store i32 %add10, i32* %mid, align 4
  %22 = load i32, i32* %mid, align 4
  %conv11 = sext i32 %22 to i64
  %23 = load i8*, i8** %mid_s, align 8
  %call12 = call i8* @my_itoa(i64 %conv11, i8* %23, i64 10)
  store i8* %call12, i8** %mid_s, align 8
  %24 = load i8*, i8** %mid_s, align 8
  %call13 = call i32 @puts(i8* %24)
  %25 = bitcast [8 x i8]* %low_d to i8*
  store i8* %25, i8** %low_s, align 8
  %26 = load i32, i32* %low, align 4
  %conv14 = sext i32 %26 to i64
  %27 = load i8*, i8** %low_s, align 8
  %call15 = call i8* @my_itoa(i64 %conv14, i8* %27, i64 10)
  store i8* %call15, i8** %low_s, align 8
  %28 = load i8*, i8** %low_s, align 8
  %call16 = call i32 @puts(i8* %28)
  %29 = bitcast [8 x i8]* %high_d to i8*
  store i8* %29, i8** %high_s, align 8
  %30 = load i32, i32* %high, align 4
  %conv17 = sext i32 %30 to i64
  %31 = load i8*, i8** %high_s, align 8
  %call18 = call i8* @my_itoa(i64 %conv17, i8* %31, i64 10)
  store i8* %call18, i8** %high_s, align 8
  %32 = load i8*, i8** %high_s, align 8
  %call19 = call i32 @puts(i8* %32)
  %33 = bitcast [8 x i8]* %cfiptr_mid to i8*
  store i8* %33, i8** %cfiptr_mid_s, align 8
  %call20 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.3, i64 0, i64 0))
  %34 = load i64*, i64** %CFICheckAddressPtr, align 8
  %35 = load i32, i32* %mid, align 4
  %idxprom21 = sext i32 %35 to i64
  %arrayidx22 = getelementptr inbounds i64, i64* %34, i64 %idxprom21
  %36 = load i64, i64* %arrayidx22, align 8
  %37 = load i8*, i8** %cfiptr_mid_s, align 8
  %call23 = call i8* @my_itoa(i64 %36, i8* %37, i64 16)
  store i8* %call23, i8** %cfiptr_mid_s, align 8
  %38 = load i8*, i8** %cfiptr_mid_s, align 8
  %call24 = call i32 @puts(i8* %38)
  %39 = load i32, i32* %mid, align 4
  %40 = load i32, i32* %high, align 4
  %cmp25 = icmp sgt i32 %39, %40
  br i1 %cmp25, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %41 = load i64*, i64** %CFICheckAddressPtr, align 8
  %42 = load i32, i32* %mid, align 4
  %idxprom27 = sext i32 %42 to i64
  %arrayidx28 = getelementptr inbounds i64, i64* %41, i64 %idxprom27
  %43 = load i64, i64* %arrayidx28, align 8
  %44 = load i64, i64* %target.addr, align 8
  %cmp29 = icmp ugt i64 %43, %44
  br i1 %cmp29, label %if.then31, label %if.else

if.then31:                                        ; preds = %if.end
  %call32 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0))
  %45 = load i32, i32* %mid, align 4
  %sub33 = sub nsw i32 %45, 1
  store i32 %sub33, i32* %high, align 4
  br label %if.end44

if.else:                                          ; preds = %if.end
  %46 = load i64*, i64** %CFICheckAddressPtr, align 8
  %47 = load i32, i32* %mid, align 4
  %idxprom34 = sext i32 %47 to i64
  %arrayidx35 = getelementptr inbounds i64, i64* %46, i64 %idxprom34
  %48 = load i64, i64* %arrayidx35, align 8
  %49 = load i64, i64* %target.addr, align 8
  %cmp36 = icmp ult i64 %48, %49
  br i1 %cmp36, label %if.then38, label %if.else41

if.then38:                                        ; preds = %if.else
  %call39 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0))
  %50 = load i32, i32* %mid, align 4
  %add40 = add nsw i32 %50, 1
  store i32 %add40, i32* %low, align 4
  br label %if.end43

if.else41:                                        ; preds = %if.else
  %call42 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i64 0, i64 0))
  ret void

if.end43:                                         ; preds = %if.then38
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then31
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %call45 = call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0))
  call void @exit(i32 -1) #3
  unreachable
}

declare dso_local i32 @puts(i8*) #1

declare dso_local i8* @my_itoa(i64, i8*, i64) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

; Function Attrs: noinline nounwind optnone
define dso_local i32 @fun() #0 {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i64 0, i64 0))
  ret i32 1
}

; Function Attrs: noinline nounwind optnone
define dso_local void @enclave_main() #0 {
entry:
  %fp = alloca i32 ()*, align 8
  %b = alloca i32, align 4
  %i_b = alloca [8 x i8], align 1
  %ii_b = alloca i8*, align 8
  store i32 ()* @fun, i32 ()** %fp, align 8
  %call = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.9, i64 0, i64 0))
  %0 = load i32 ()*, i32 ()** %fp, align 8
  %call1 = call i32 %0()
  store i32 %call1, i32* %b, align 4
  %call2 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2.10, i64 0, i64 0))
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  %call3 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3.11, i64 0, i64 0))
  %2 = load i32, i32* %b, align 4
  %conv = sext i32 %2 to i64
  %3 = load i8*, i8** %ii_b, align 8
  %call4 = call i8* @my_itoa(i64 %conv, i8* %3, i64 10)
  store i8* %call4, i8** %ii_b, align 8
  %call5 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.12, i64 0, i64 0))
  %4 = load i8*, i8** %ii_b, align 8
  %call6 = call i32 @puts(i8* %4)
  %call7 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5.13, i64 0, i64 0))
  call void @exit(i32 0) #3
  unreachable
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"}
!1 = !{i32 1, !"wchar_size", i32 4}
