; ModuleID = 'foo2'
source_filename = "foo2"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"checking next indirect call...\0A\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Matching CFICheckAddressPtr[mid]: \00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"found it!\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"larger!\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"smaller!\0A\00", align 1
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

while.cond:                                       ; preds = %if.end22, %entry
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
  %call3 = call i8* @my_itoa(i64 %9, i8* %10, i64 10)
  store i8* %call3, i8** %ii_b, align 8
  %11 = load i8*, i8** %ii_b, align 8
  %call4 = call i32 @puts(i8* %11)
  %call5 = call i32 @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %12 = load i32, i32* %mid, align 4
  %13 = load i32, i32* %high, align 4
  %cmp6 = icmp sge i32 %12, %13
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %14 = load i64*, i64** %CFICheckAddressPtr, align 8
  %15 = load i32, i32* %mid, align 4
  %idxprom7 = sext i32 %15 to i64
  %arrayidx8 = getelementptr inbounds i64, i64* %14, i64 %idxprom7
  %16 = load i64, i64* %arrayidx8, align 8
  %17 = load i64, i64* %target.addr, align 8
  %cmp9 = icmp eq i64 %16, %17
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.end
  %call11 = call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0))
  ret void

if.else:                                          ; preds = %if.end
  %18 = load i64*, i64** %CFICheckAddressPtr, align 8
  %19 = load i32, i32* %mid, align 4
  %idxprom12 = sext i32 %19 to i64
  %arrayidx13 = getelementptr inbounds i64, i64* %18, i64 %idxprom12
  %20 = load i64, i64* %arrayidx13, align 8
  %21 = load i64, i64* %target.addr, align 8
  %cmp14 = icmp sgt i64 %20, %21
  br i1 %cmp14, label %if.then15, label %if.else18

if.then15:                                        ; preds = %if.else
  %call16 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %22 = load i32, i32* %mid, align 4
  %sub17 = sub nsw i32 %22, 1
  store i32 %sub17, i32* %high, align 4
  br label %if.end21

if.else18:                                        ; preds = %if.else
  %call19 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0))
  %23 = load i32, i32* %mid, align 4
  %add20 = add nsw i32 %23, 1
  store i32 %add20, i32* %low, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.else18, %if.then15
  br label %if.end22

if.end22:                                         ; preds = %if.end21
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
