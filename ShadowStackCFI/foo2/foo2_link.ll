; ModuleID = 'foo2'
source_filename = "foo2"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"checking next indirect call...\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"target: \00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"Matching CFICheckAddressPtr[mid]: \00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"larger!\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"smaller!\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"found it!\00", align 1
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
  %i = alloca i32, align 4
  %target_s = alloca [8 x i8], align 1
  %target_str = alloca i8*, align 8
  store i64 %target, i64* %target.addr, align 8
  store i64* inttoptr (i64 2305843009213693951 to i64*), i64** %CFICheckAddressPtr, align 8
  store i32 536870911, i32* %CFICheckAddressNum, align 4
  store i32 0, i32* %low, align 4
  %0 = load i32, i32* %CFICheckAddressNum, align 4
  store i32 %0, i32* %high, align 4
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %CFICheckAddressNum, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %conv = sext i32 %4 to i64
  %5 = load i8*, i8** %ii_b, align 8
  %call = call i8* @my_itoa(i64 %conv, i8* %5, i64 10)
  store i8* %call, i8** %ii_b, align 8
  %6 = load i8*, i8** %ii_b, align 8
  %call1 = call i32 @puts(i8* %6)
  %7 = load i64*, i64** %CFICheckAddressPtr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 %idxprom
  %9 = load i64, i64* %arrayidx, align 8
  %10 = load i8*, i8** %ii_b, align 8
  %call2 = call i8* @my_itoa(i64 %9, i8* %10, i64 16)
  store i8* %call2, i8** %ii_b, align 8
  %11 = load i8*, i8** %ii_b, align 8
  %call3 = call i32 @puts(i8* %11)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call4 = call i32 @puts(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0))
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %target_s, i64 0, i64 0
  store i8* %arraydecay, i8** %target_str, align 8
  %13 = load i64, i64* %target.addr, align 8
  %14 = load i8*, i8** %target_str, align 8
  %call5 = call i8* @my_itoa(i64 %13, i8* %14, i64 16)
  store i8* %call5, i8** %target_str, align 8
  %call6 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  %15 = load i8*, i8** %target_str, align 8
  %call7 = call i32 @puts(i8* %15)
  br label %while.cond

while.cond:                                       ; preds = %if.end43, %for.end
  %16 = load i32, i32* %low, align 4
  %17 = load i32, i32* %high, align 4
  %cmp8 = icmp sle i32 %16, %17
  br i1 %cmp8, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %18 = load i32, i32* %low, align 4
  %19 = load i32, i32* %high, align 4
  %20 = load i32, i32* %low, align 4
  %sub = sub nsw i32 %19, %20
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %18, %div
  store i32 %add, i32* %mid, align 4
  %21 = load i32, i32* %mid, align 4
  %conv10 = sext i32 %21 to i64
  %22 = load i8*, i8** %ii_b, align 8
  %call11 = call i8* @my_itoa(i64 %conv10, i8* %22, i64 10)
  store i8* %call11, i8** %ii_b, align 8
  %23 = load i8*, i8** %ii_b, align 8
  %call12 = call i32 @puts(i8* %23)
  %24 = load i32, i32* %low, align 4
  %conv13 = sext i32 %24 to i64
  %25 = load i8*, i8** %ii_b, align 8
  %call14 = call i8* @my_itoa(i64 %conv13, i8* %25, i64 10)
  store i8* %call14, i8** %ii_b, align 8
  %26 = load i8*, i8** %ii_b, align 8
  %call15 = call i32 @puts(i8* %26)
  %27 = load i32, i32* %high, align 4
  %conv16 = sext i32 %27 to i64
  %28 = load i8*, i8** %ii_b, align 8
  %call17 = call i8* @my_itoa(i64 %conv16, i8* %28, i64 10)
  store i8* %call17, i8** %ii_b, align 8
  %29 = load i8*, i8** %ii_b, align 8
  %call18 = call i32 @puts(i8* %29)
  %call19 = call i32 @puts(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0))
  %30 = load i64*, i64** %CFICheckAddressPtr, align 8
  %31 = load i32, i32* %mid, align 4
  %idxprom20 = sext i32 %31 to i64
  %arrayidx21 = getelementptr inbounds i64, i64* %30, i64 %idxprom20
  %32 = load i64, i64* %arrayidx21, align 8
  %33 = load i8*, i8** %ii_b, align 8
  %call22 = call i8* @my_itoa(i64 %32, i8* %33, i64 16)
  store i8* %call22, i8** %ii_b, align 8
  %34 = load i8*, i8** %ii_b, align 8
  %call23 = call i32 @puts(i8* %34)
  %35 = load i32, i32* %mid, align 4
  %36 = load i32, i32* %high, align 4
  %cmp24 = icmp sgt i32 %35, %36
  br i1 %cmp24, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %37 = load i64*, i64** %CFICheckAddressPtr, align 8
  %38 = load i32, i32* %mid, align 4
  %idxprom26 = sext i32 %38 to i64
  %arrayidx27 = getelementptr inbounds i64, i64* %37, i64 %idxprom26
  %39 = load i64, i64* %arrayidx27, align 8
  %40 = load i64, i64* %target.addr, align 8
  %cmp28 = icmp ugt i64 %39, %40
  br i1 %cmp28, label %if.then30, label %if.else

if.then30:                                        ; preds = %if.end
  %call31 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0))
  %41 = load i32, i32* %mid, align 4
  %sub32 = sub nsw i32 %41, 1
  store i32 %sub32, i32* %high, align 4
  br label %if.end43

if.else:                                          ; preds = %if.end
  %42 = load i64*, i64** %CFICheckAddressPtr, align 8
  %43 = load i32, i32* %mid, align 4
  %idxprom33 = sext i32 %43 to i64
  %arrayidx34 = getelementptr inbounds i64, i64* %42, i64 %idxprom33
  %44 = load i64, i64* %arrayidx34, align 8
  %45 = load i64, i64* %target.addr, align 8
  %cmp35 = icmp ult i64 %44, %45
  br i1 %cmp35, label %if.then37, label %if.else40

if.then37:                                        ; preds = %if.else
  %call38 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0))
  %46 = load i32, i32* %mid, align 4
  %add39 = add nsw i32 %46, 1
  store i32 %add39, i32* %low, align 4
  br label %if.end42

if.else40:                                        ; preds = %if.else
  %call41 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0))
  ret void

if.end42:                                         ; preds = %if.then37
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.then30
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  call void @exit(i32 -1) #3
  unreachable
}

declare dso_local i8* @my_itoa(i64, i8*, i64) #1

declare dso_local i32 @puts(i8*) #1

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
