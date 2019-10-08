; ModuleID = 'foo2'
source_filename = "foo2"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"success!\00", align 1

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
  %8 = load i64*, i64** %CFICheckAddressPtr, align 8
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
  %12 = load i64*, i64** %CFICheckAddressPtr, align 8
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
  call void @exit(i32 -1) #3
  unreachable
}

; Function Attrs: noreturn
declare dso_local void @exit(i32) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @fun() #0 {
entry:
  ret i32 1
}

; Function Attrs: noinline nounwind optnone
define dso_local i8* @my_itoa(i32 %val, i8* %buf, i32 %radix) #0 {
entry:
  %val.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %radix.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %firstdig = alloca i8*, align 8
  %temp = alloca i8, align 1
  %digval = alloca i32, align 4
  store i32 %val, i32* %val.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %radix, i32* %radix.addr, align 4
  %0 = load i8*, i8** %buf.addr, align 8
  store i8* %0, i8** %p, align 8
  %1 = load i32, i32* %val.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 45, i8* %2, align 1
  %3 = load i32, i32* %val.addr, align 4
  %conv = sext i32 %3 to i64
  %sub = sub nsw i64 0, %conv
  %conv1 = trunc i64 %sub to i32
  store i32 %conv1, i32* %val.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i8*, i8** %p, align 8
  store i8* %4, i8** %firstdig, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %5 = load i32, i32* %val.addr, align 4
  %6 = load i32, i32* %radix.addr, align 4
  %rem = urem i32 %5, %6
  store i32 %rem, i32* %digval, align 4
  %7 = load i32, i32* %radix.addr, align 4
  %8 = load i32, i32* %val.addr, align 4
  %div = udiv i32 %8, %7
  store i32 %div, i32* %val.addr, align 4
  %9 = load i32, i32* %digval, align 4
  %cmp2 = icmp ugt i32 %9, 9
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %do.body
  %10 = load i32, i32* %digval, align 4
  %sub5 = sub i32 %10, 10
  %add = add i32 %sub5, 97
  %conv6 = trunc i32 %add to i8
  %11 = load i8*, i8** %p, align 8
  %incdec.ptr7 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr7, i8** %p, align 8
  store i8 %conv6, i8* %11, align 1
  br label %if.end11

if.else:                                          ; preds = %do.body
  %12 = load i32, i32* %digval, align 4
  %add8 = add i32 %12, 48
  %conv9 = trunc i32 %add8 to i8
  %13 = load i8*, i8** %p, align 8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr10, i8** %p, align 8
  store i8 %conv9, i8* %13, align 1
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then4
  br label %do.cond

do.cond:                                          ; preds = %if.end11
  %14 = load i32, i32* %val.addr, align 4
  %cmp12 = icmp sgt i32 %14, 0
  br i1 %cmp12, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %15 = load i8*, i8** %p, align 8
  %incdec.ptr14 = getelementptr inbounds i8, i8* %15, i32 -1
  store i8* %incdec.ptr14, i8** %p, align 8
  store i8 32, i8* %15, align 1
  br label %do.body15

do.body15:                                        ; preds = %do.cond18, %do.end
  %16 = load i8*, i8** %p, align 8
  %17 = load i8, i8* %16, align 1
  store i8 %17, i8* %temp, align 1
  %18 = load i8*, i8** %firstdig, align 8
  %19 = load i8, i8* %18, align 1
  %20 = load i8*, i8** %p, align 8
  store i8 %19, i8* %20, align 1
  %21 = load i8, i8* %temp, align 1
  %22 = load i8*, i8** %firstdig, align 8
  store i8 %21, i8* %22, align 1
  %23 = load i8*, i8** %p, align 8
  %incdec.ptr16 = getelementptr inbounds i8, i8* %23, i32 -1
  store i8* %incdec.ptr16, i8** %p, align 8
  %24 = load i8*, i8** %firstdig, align 8
  %incdec.ptr17 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr17, i8** %firstdig, align 8
  br label %do.cond18

do.cond18:                                        ; preds = %do.body15
  %25 = load i8*, i8** %firstdig, align 8
  %26 = load i8*, i8** %p, align 8
  %cmp19 = icmp ult i8* %25, %26
  br i1 %cmp19, label %do.body15, label %do.end21

do.end21:                                         ; preds = %do.cond18
  %27 = load i8*, i8** %buf.addr, align 8
  ret i8* %27
}

; Function Attrs: noinline nounwind optnone
define dso_local void @enclave_main() #0 {
entry:
  %fp = alloca i32 ()*, align 8
  %b = alloca i32, align 4
  %i_b = alloca [8 x i8], align 1
  %ii_b = alloca i8*, align 8
  store i32 ()* @fun, i32 ()** %fp, align 8
  %0 = load i32 ()*, i32 ()** %fp, align 8
  %call = call i32 %0()
  store i32 %call, i32* %b, align 4
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  %2 = load i32, i32* %b, align 4
  %3 = load i8*, i8** %ii_b, align 8
  %call1 = call i8* @my_itoa(i32 %2, i8* %3, i32 10)
  store i8* %call1, i8** %ii_b, align 8
  %4 = load i8*, i8** %ii_b, align 8
  %call2 = call i32 @puts(i8* %4)
  %call3 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 0) #4
  unreachable
}

declare dso_local i32 @puts(i8*) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 9.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
