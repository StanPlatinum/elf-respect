; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/CFICheck.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CFICheckAddressNum = common dso_local global i32 0, align 4
@CFICheckAddressPtr = common dso_local global i64* null, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CFICheck(i64 %target) #0 {
entry:
  %target.addr = alloca i64, align 8
  %low = alloca i32, align 4
  %high = alloca i32, align 4
  %mid = alloca i32, align 4
  store i64 %target, i64* %target.addr, align 8
  store i32 0, i32* %low, align 4
  %0 = load i32, i32* @CFICheckAddressNum, align 4
  %sub = sub nsw i32 %0, 1
  store i32 %sub, i32* %high, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end13, %entry
  %1 = load i32, i32* %low, align 4
  %2 = load i32, i32* %high, align 4
  %cmp = icmp sle i32 %1, %2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %low, align 4
  %4 = load i32, i32* %high, align 4
  %5 = load i32, i32* %low, align 4
  %sub1 = sub nsw i32 %4, %5
  %div = sdiv i32 %sub1, 2
  %add = add nsw i32 %3, %div
  store i32 %add, i32* %mid, align 4
  %6 = load i32, i32* %mid, align 4
  %7 = load i32, i32* %high, align 4
  %cmp2 = icmp sge i32 %6, %7
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  %8 = load i64*, i64** @CFICheckAddressPtr, align 8
  %9 = load i32, i32* %mid, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 %idxprom
  %10 = load i64, i64* %arrayidx, align 8
  %11 = load i64, i64* %target.addr, align 8
  %cmp3 = icmp eq i64 %10, %11
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  ret void

if.else:                                          ; preds = %if.end
  %12 = load i64*, i64** @CFICheckAddressPtr, align 8
  %13 = load i32, i32* %mid, align 4
  %idxprom5 = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds i64, i64* %12, i64 %idxprom5
  %14 = load i64, i64* %arrayidx6, align 8
  %15 = load i64, i64* %target.addr, align 8
  %cmp7 = icmp sgt i64 %14, %15
  br i1 %cmp7, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else
  %16 = load i32, i32* %mid, align 4
  %sub9 = sub nsw i32 %16, 1
  store i32 %sub9, i32* %high, align 4
  br label %if.end12

if.else10:                                        ; preds = %if.else
  %17 = load i32, i32* %mid, align 4
  %add11 = add nsw i32 %17, 1
  store i32 %add11, i32* %low, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.else10, %if.then8
  br label %if.end13

if.end13:                                         ; preds = %if.end12
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  call void @abort() #2
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @abort() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git ea61fcc2e46adc99b39525b77c98b101708386f4)"}
