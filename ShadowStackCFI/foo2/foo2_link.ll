; ModuleID = 'foo2'
source_filename = "foo2"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"checking next indirect call...\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"target: \00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"Matching CFICheckAddressPtr[mid]: \00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"found it!\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"larger!\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"smaller!\00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"----------1 in fun----------\00", align 1
@.str.1.7 = private unnamed_addr constant [22 x i8] c"----------1----------\00", align 1
@.str.2.8 = private unnamed_addr constant [22 x i8] c"----------2----------\00", align 1
@.str.3.9 = private unnamed_addr constant [22 x i8] c"----------3----------\00", align 1
@.str.4.10 = private unnamed_addr constant [22 x i8] c"----------4----------\00", align 1
@.str.5.11 = private unnamed_addr constant [9 x i8] c"success!\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @CFICheck(i64 %target) #0 {
entry:
  %target.addr = alloca i64, align 8
  %CFICheckAddressPtr = alloca i64*, align 8
  %CFICheckAddressNum = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  %mid = alloca i32, align 4
  %target_s = alloca [8 x i8], align 1
  %target_str = alloca i8*, align 8
  %i_b = alloca [8 x i8], align 1
  %ii_b = alloca i8*, align 8
  store i64 %target, i64* %target.addr, align 8
  store i64* inttoptr (i64 2305843009213693951 to i64*), i64** %CFICheckAddressPtr, align 8
  store i32 536870911, i32* %CFICheckAddressNum, align 4
  store i32 0, i32* %low, align 4
  %0 = load i32, i32* %CFICheckAddressNum, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %high, align 4
  %call = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %target_s, i64 0, i64 0
  store i8* %arraydecay, i8** %target_str, align 8
  %1 = load i64, i64* %target.addr, align 8
  %2 = load i8*, i8** %target_str, align 8
  %call1 = call i8* @my_itoa(i64 %1, i8* %2, i64 16)
  store i8* %call1, i8** %target_str, align 8
  %call2 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  %3 = load i8*, i8** %target_str, align 8
  %call3 = call i32 @puts(i8* %3)
  %4 = bitcast [8 x i8]* %i_b to i8*
  store i8* %4, i8** %ii_b, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end24, %entry
  %5 = load i32, i32* %low, align 4
  %6 = load i32, i32* %high, align 4
  %cmp = icmp sle i32 %5, %6
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %low, align 4
  %8 = load i32, i32* %high, align 4
  %9 = load i32, i32* %low, align 4
  %sub4 = sub nsw i32 %8, %9
  %div = sdiv i32 %sub4, 2
  %add = add nsw i32 %7, %div
  store i32 %add, i32* %mid, align 4
  %call5 = call i32 @puts(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0))
  %10 = load i64*, i64** %CFICheckAddressPtr, align 8
  %11 = load i32, i32* %mid, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds i64, i64* %10, i64 %idxprom
  %12 = load i64, i64* %arrayidx, align 8
  %13 = load i8*, i8** %ii_b, align 8
  %call6 = call i8* @my_itoa(i64 %12, i8* %13, i64 16)
  store i8* %call6, i8** %ii_b, align 8
  %14 = load i8*, i8** %ii_b, align 8
  %call7 = call i32 @puts(i8* %14)
  %15 = load i32, i32* %mid, align 4
  %16 = load i32, i32* %high, align 4
  %cmp8 = icmp sge i32 %15, %16
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %17 = load i64*, i64** %CFICheckAddressPtr, align 8
  %18 = load i32, i32* %mid, align 4
  %idxprom9 = sext i32 %18 to i64
  %arrayidx10 = getelementptr inbounds i64, i64* %17, i64 %idxprom9
  %19 = load i64, i64* %arrayidx10, align 8
  %20 = load i64, i64* %target.addr, align 8
  %cmp11 = icmp eq i64 %19, %20
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %if.end
  %call13 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0))
  ret void

if.else:                                          ; preds = %if.end
  %21 = load i64*, i64** %CFICheckAddressPtr, align 8
  %22 = load i32, i32* %mid, align 4
  %idxprom14 = sext i32 %22 to i64
  %arrayidx15 = getelementptr inbounds i64, i64* %21, i64 %idxprom14
  %23 = load i64, i64* %arrayidx15, align 8
  %24 = load i64, i64* %target.addr, align 8
  %cmp16 = icmp sgt i64 %23, %24
  br i1 %cmp16, label %if.then17, label %if.else20

if.then17:                                        ; preds = %if.else
  %call18 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0))
  %25 = load i32, i32* %mid, align 4
  %sub19 = sub nsw i32 %25, 1
  store i32 %sub19, i32* %high, align 4
  br label %if.end23

if.else20:                                        ; preds = %if.else
  %call21 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0))
  %26 = load i32, i32* %mid, align 4
  %add22 = add nsw i32 %26, 1
  store i32 %add22, i32* %low, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.else20, %if.then17
  br label %if.end24

if.end24:                                         ; preds = %if.end23
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
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
  %call = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i64 0, i64 0))
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
  %call = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1.7, i64 0, i64 0))
  %0 = load i32 ()*, i32 ()** %fp, align 8
  %call1 = call i32 %0()
  store i32 %call1, i32* %b, align 4
  %call2 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2.8, i64 0, i64 0))
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  %call3 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3.9, i64 0, i64 0))
  %2 = load i32, i32* %b, align 4
  %conv = sext i32 %2 to i64
  %3 = load i8*, i8** %ii_b, align 8
  %call4 = call i8* @my_itoa(i64 %conv, i8* %3, i64 10)
  store i8* %call4, i8** %ii_b, align 8
  %call5 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4.10, i64 0, i64 0))
  %4 = load i8*, i8** %ii_b, align 8
  %call6 = call i32 @puts(i8* %4)
  %call7 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5.11, i64 0, i64 0))
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
