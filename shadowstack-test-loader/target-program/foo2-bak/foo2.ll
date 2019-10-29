; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/foo2.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/foo2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"----------1 in fun----------\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"----------1 in my_itoa----------\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"----------2 in my_itoa----------\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"----------3 in my_itoa----------\00", align 1
@.str.4 = private unnamed_addr constant [33 x i8] c"----------4 in my_itoa----------\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"----------1----------\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"----------2----------\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"----------3----------\00", align 1
@.str.8 = private unnamed_addr constant [22 x i8] c"----------4----------\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"success!\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @fun() #0 {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0))
  ret i32 1
}

declare dso_local i32 @puts(i8*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i8* @my_itoa(i64 %val, i8* %buf, i32 %radix) #0 {
entry:
  %val.addr = alloca i64, align 8
  %buf.addr = alloca i8*, align 8
  %radix.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %firstdig = alloca i8*, align 8
  %temp = alloca i8, align 1
  %digval = alloca i32, align 4
  store i64 %val, i64* %val.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %radix, i32* %radix.addr, align 4
  %call = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0))
  %0 = load i8*, i8** %buf.addr, align 8
  store i8* %0, i8** %p, align 8
  %1 = load i8*, i8** %p, align 8
  store i8* %1, i8** %firstdig, align 8
  %call1 = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0))
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %2 = load i64, i64* %val.addr, align 8
  %3 = load i32, i32* %radix.addr, align 4
  %conv = zext i32 %3 to i64
  %rem = urem i64 %2, %conv
  %conv2 = trunc i64 %rem to i32
  store i32 %conv2, i32* %digval, align 4
  %4 = load i32, i32* %radix.addr, align 4
  %conv3 = zext i32 %4 to i64
  %5 = load i64, i64* %val.addr, align 8
  %div = udiv i64 %5, %conv3
  store i64 %div, i64* %val.addr, align 8
  %6 = load i32, i32* %digval, align 4
  %cmp = icmp ugt i32 %6, 9
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %7 = load i32, i32* %digval, align 4
  %sub = sub i32 %7, 10
  %add = add i32 %sub, 97
  %conv5 = trunc i32 %add to i8
  %8 = load i8*, i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 %conv5, i8* %8, align 1
  br label %if.end

if.else:                                          ; preds = %do.body
  %9 = load i32, i32* %digval, align 4
  %add6 = add i32 %9, 48
  %conv7 = trunc i32 %add6 to i8
  %10 = load i8*, i8** %p, align 8
  %incdec.ptr8 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr8, i8** %p, align 8
  store i8 %conv7, i8* %10, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %11 = load i64, i64* %val.addr, align 8
  %cmp9 = icmp ugt i64 %11, 0
  br i1 %cmp9, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %call11 = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0))
  %12 = load i8*, i8** %p, align 8
  %incdec.ptr12 = getelementptr inbounds i8, i8* %12, i32 -1
  store i8* %incdec.ptr12, i8** %p, align 8
  store i8 32, i8* %12, align 1
  br label %do.body13

do.body13:                                        ; preds = %do.cond16, %do.end
  %13 = load i8*, i8** %p, align 8
  %14 = load i8, i8* %13, align 1
  store i8 %14, i8* %temp, align 1
  %15 = load i8*, i8** %firstdig, align 8
  %16 = load i8, i8* %15, align 1
  %17 = load i8*, i8** %p, align 8
  store i8 %16, i8* %17, align 1
  %18 = load i8, i8* %temp, align 1
  %19 = load i8*, i8** %firstdig, align 8
  store i8 %18, i8* %19, align 1
  %20 = load i8*, i8** %p, align 8
  %incdec.ptr14 = getelementptr inbounds i8, i8* %20, i32 -1
  store i8* %incdec.ptr14, i8** %p, align 8
  %21 = load i8*, i8** %firstdig, align 8
  %incdec.ptr15 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr15, i8** %firstdig, align 8
  br label %do.cond16

do.cond16:                                        ; preds = %do.body13
  %22 = load i8*, i8** %firstdig, align 8
  %23 = load i8*, i8** %p, align 8
  %cmp17 = icmp ult i8* %22, %23
  br i1 %cmp17, label %do.body13, label %do.end19

do.end19:                                         ; preds = %do.cond16
  %call20 = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.4, i64 0, i64 0))
  %24 = load i8*, i8** %buf.addr, align 8
  ret i8* %24
}

; Function Attrs: noinline nounwind optnone
define dso_local void @enclave_main() #0 {
entry:
  %fp = alloca i32 ()*, align 8
  %b = alloca i32, align 4
  %i_b = alloca [8 x i8], align 1
  %ii_b = alloca i8*, align 8
  store i32 ()* @fun, i32 ()** %fp, align 8
  %call = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0))
  %0 = load i32 ()*, i32 ()** %fp, align 8
  %call1 = call i32 %0()
  store i32 %call1, i32* %b, align 4
  %call2 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0))
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  %call3 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0))
  %2 = load i32, i32* %b, align 4
  %conv = sext i32 %2 to i64
  %3 = load i8*, i8** %ii_b, align 8
  %call4 = call i8* @my_itoa(i64 %conv, i8* %3, i32 10)
  store i8* %call4, i8** %ii_b, align 8
  %call5 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i64 0, i64 0))
  %4 = load i8*, i8** %ii_b, align 8
  %call6 = call i32 @puts(i8* %4)
  %call7 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i64 0, i64 0))
  call void @exit(i32 0) #3
  unreachable
}

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
