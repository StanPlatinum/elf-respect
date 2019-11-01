; ModuleID = '/home/liuweijie/elf-respect/dynamic-loader-checker/target-program/ShadowStackCFI/CFICheck.c'
source_filename = "/home/liuweijie/elf-respect/dynamic-loader-checker/target-program/ShadowStackCFI/CFICheck.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone
define dso_local void @CFICheck(i64 %target) #0 {
entry:
  %target.addr = alloca i64, align 8
  %CFICheckAddressPtr = alloca i64*, align 8
  %CFICheckAddressNum = alloca i32, align 4
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  %mid = alloca i32, align 4
  store i64 %target, i64* %target.addr, align 8
  store i64* inttoptr (i64 2305843009213693951 to i64*), i64** %CFICheckAddressPtr, align 8
  store i32 536870911, i32* %CFICheckAddressNum, align 4
  store i32 0, i32* %low, align 4
  %0 = load i32, i32* %CFICheckAddressNum, align 4
  store i32 %0, i32* %high, align 4
  store i32 0, i32* %mid, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end12, %entry
  %1 = load i32, i32* %low, align 4
  %2 = load i32, i32* %high, align 4
  %cmp = icmp sle i32 %1, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %low, align 4
  %4 = load i32, i32* %high, align 4
  %5 = load i32, i32* %low, align 4
  %sub = sub nsw i32 %4, %5
  %div = sdiv i32 %sub, 2
  %add = add nsw i32 %3, %div
  store i32 %add, i32* %mid, align 4
  %6 = load i32, i32* %mid, align 4
  %7 = load i32, i32* %high, align 4
  %cmp1 = icmp sgt i32 %6, %7
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %8 = load i64*, i64** %CFICheckAddressPtr, align 8
  %9 = load i32, i32* %mid, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 %idxprom
  %10 = load i64, i64* %arrayidx, align 8
  %11 = load i64, i64* %target.addr, align 8
  %cmp2 = icmp ugt i64 %10, %11
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %12 = load i32, i32* %mid, align 4
  %sub4 = sub nsw i32 %12, 1
  store i32 %sub4, i32* %high, align 4
  br label %if.end12

if.else:                                          ; preds = %if.end
  %13 = load i64*, i64** %CFICheckAddressPtr, align 8
  %14 = load i32, i32* %mid, align 4
  %idxprom5 = sext i32 %14 to i64
  %arrayidx6 = getelementptr inbounds i64, i64* %13, i64 %idxprom5
  %15 = load i64, i64* %arrayidx6, align 8
  %16 = load i64, i64* %target.addr, align 8
  %cmp7 = icmp ult i64 %15, %16
  br i1 %cmp7, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else
  %17 = load i32, i32* %mid, align 4
  %add9 = add nsw i32 %17, 1
  store i32 %add9, i32* %low, align 4
  br label %if.end11

if.else10:                                        ; preds = %if.else
  ret void

if.end11:                                         ; preds = %if.then8
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then3
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  call void @exit(i32 -1) #2
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @exit(i32) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"}
