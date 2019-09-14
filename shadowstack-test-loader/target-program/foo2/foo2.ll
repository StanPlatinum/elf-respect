; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/foo2.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/foo2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"success!\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fun() #0 {
entry:
  ret i32 1
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @enclave_main() #0 {
entry:
  %fp = alloca i32 ()*, align 8
  %b = alloca i32, align 4
  store i32 ()* @fun, i32 ()** %fp, align 8
  %0 = load i32 ()*, i32 ()** %fp, align 8
  %call = call i32 %0()
  store i32 %call, i32* %b, align 4
  %call1 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 0) #3
  unreachable
}

declare dso_local i32 @puts(i8*) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git ea61fcc2e46adc99b39525b77c98b101708386f4)"}
