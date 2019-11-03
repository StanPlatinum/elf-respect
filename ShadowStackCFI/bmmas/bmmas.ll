; ModuleID = './bmmas.c'
source_filename = "./bmmas.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@objs = common dso_local global i64* null, align 8
@objs_end = common dso_local global i64* null, align 8
@__tmp = dso_local global [64 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [14 x i8] c"overlap exist\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"no overlap\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local void @sort(i32 %left, i32 %right) #0 {
entry:
  %left.addr = alloca i32, align 4
  %right.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %pivot = alloca i64, align 8
  %tmp = alloca i64, align 8
  store i32 %left, i32* %left.addr, align 4
  store i32 %right, i32* %right.addr, align 4
  %0 = load i32, i32* %left.addr, align 4
  %1 = load i32, i32* %right.addr, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** @objs, align 8
  %3 = load i32, i32* %left.addr, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds i64, i64* %2, i64 %idxprom
  %4 = load i64, i64* %arrayidx, align 8
  store i64 %4, i64* %pivot, align 8
  %5 = load i32, i32* %left.addr, align 4
  store i32 %5, i32* %i, align 4
  %6 = load i32, i32* %left.addr, align 4
  %add = add i32 %6, 1
  store i32 %add, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i32, i32* %j, align 4
  %8 = load i32, i32* %right.addr, align 4
  %cmp1 = icmp ule i32 %7, %8
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i64*, i64** @objs, align 8
  %10 = load i32, i32* %j, align 4
  %idxprom2 = zext i32 %10 to i64
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 %idxprom2
  %11 = load i64, i64* %arrayidx3, align 8
  %12 = load i64, i64* %pivot, align 8
  %cmp4 = icmp ult i64 %11, %12
  br i1 %cmp4, label %if.then5, label %if.end22

if.then5:                                         ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add i32 %13, 1
  store i32 %inc, i32* %i, align 4
  %14 = load i64*, i64** @objs, align 8
  %15 = load i32, i32* %j, align 4
  %idxprom6 = zext i32 %15 to i64
  %arrayidx7 = getelementptr inbounds i64, i64* %14, i64 %idxprom6
  %16 = load i64, i64* %arrayidx7, align 8
  store i64 %16, i64* %tmp, align 8
  %17 = load i64*, i64** @objs, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom8 = zext i32 %18 to i64
  %arrayidx9 = getelementptr inbounds i64, i64* %17, i64 %idxprom8
  %19 = load i64, i64* %arrayidx9, align 8
  %20 = load i64*, i64** @objs, align 8
  %21 = load i32, i32* %j, align 4
  %idxprom10 = zext i32 %21 to i64
  %arrayidx11 = getelementptr inbounds i64, i64* %20, i64 %idxprom10
  store i64 %19, i64* %arrayidx11, align 8
  %22 = load i64, i64* %tmp, align 8
  %23 = load i64*, i64** @objs, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom12 = zext i32 %24 to i64
  %arrayidx13 = getelementptr inbounds i64, i64* %23, i64 %idxprom12
  store i64 %22, i64* %arrayidx13, align 8
  %25 = load i64*, i64** @objs_end, align 8
  %26 = load i32, i32* %j, align 4
  %idxprom14 = zext i32 %26 to i64
  %arrayidx15 = getelementptr inbounds i64, i64* %25, i64 %idxprom14
  %27 = load i64, i64* %arrayidx15, align 8
  store i64 %27, i64* %tmp, align 8
  %28 = load i64*, i64** @objs_end, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom16 = zext i32 %29 to i64
  %arrayidx17 = getelementptr inbounds i64, i64* %28, i64 %idxprom16
  %30 = load i64, i64* %arrayidx17, align 8
  %31 = load i64*, i64** @objs_end, align 8
  %32 = load i32, i32* %j, align 4
  %idxprom18 = zext i32 %32 to i64
  %arrayidx19 = getelementptr inbounds i64, i64* %31, i64 %idxprom18
  store i64 %30, i64* %arrayidx19, align 8
  %33 = load i64, i64* %tmp, align 8
  %34 = load i64*, i64** @objs_end, align 8
  %35 = load i32, i32* %i, align 4
  %idxprom20 = zext i32 %35 to i64
  %arrayidx21 = getelementptr inbounds i64, i64* %34, i64 %idxprom20
  store i64 %33, i64* %arrayidx21, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then5, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %36 = load i32, i32* %j, align 4
  %inc23 = add i32 %36, 1
  store i32 %inc23, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %37 = load i64*, i64** @objs, align 8
  %38 = load i32, i32* %left.addr, align 4
  %idxprom24 = zext i32 %38 to i64
  %arrayidx25 = getelementptr inbounds i64, i64* %37, i64 %idxprom24
  %39 = load i64, i64* %arrayidx25, align 8
  store i64 %39, i64* %tmp, align 8
  %40 = load i64*, i64** @objs, align 8
  %41 = load i32, i32* %i, align 4
  %idxprom26 = zext i32 %41 to i64
  %arrayidx27 = getelementptr inbounds i64, i64* %40, i64 %idxprom26
  %42 = load i64, i64* %arrayidx27, align 8
  %43 = load i64*, i64** @objs, align 8
  %44 = load i32, i32* %left.addr, align 4
  %idxprom28 = zext i32 %44 to i64
  %arrayidx29 = getelementptr inbounds i64, i64* %43, i64 %idxprom28
  store i64 %42, i64* %arrayidx29, align 8
  %45 = load i64, i64* %tmp, align 8
  %46 = load i64*, i64** @objs, align 8
  %47 = load i32, i32* %i, align 4
  %idxprom30 = zext i32 %47 to i64
  %arrayidx31 = getelementptr inbounds i64, i64* %46, i64 %idxprom30
  store i64 %45, i64* %arrayidx31, align 8
  %48 = load i64*, i64** @objs_end, align 8
  %49 = load i32, i32* %left.addr, align 4
  %idxprom32 = zext i32 %49 to i64
  %arrayidx33 = getelementptr inbounds i64, i64* %48, i64 %idxprom32
  %50 = load i64, i64* %arrayidx33, align 8
  store i64 %50, i64* %tmp, align 8
  %51 = load i64*, i64** @objs_end, align 8
  %52 = load i32, i32* %i, align 4
  %idxprom34 = zext i32 %52 to i64
  %arrayidx35 = getelementptr inbounds i64, i64* %51, i64 %idxprom34
  %53 = load i64, i64* %arrayidx35, align 8
  %54 = load i64*, i64** @objs_end, align 8
  %55 = load i32, i32* %left.addr, align 4
  %idxprom36 = zext i32 %55 to i64
  %arrayidx37 = getelementptr inbounds i64, i64* %54, i64 %idxprom36
  store i64 %53, i64* %arrayidx37, align 8
  %56 = load i64, i64* %tmp, align 8
  %57 = load i64*, i64** @objs_end, align 8
  %58 = load i32, i32* %i, align 4
  %idxprom38 = zext i32 %58 to i64
  %arrayidx39 = getelementptr inbounds i64, i64* %57, i64 %idxprom38
  store i64 %56, i64* %arrayidx39, align 8
  %59 = load i32, i32* %left.addr, align 4
  %60 = load i32, i32* %i, align 4
  %sub = sub i32 %60, 1
  call void @sort(i32 %59, i32 %sub)
  %61 = load i32, i32* %i, align 4
  %add40 = add i32 %61, 1
  %62 = load i32, i32* %right.addr, align 4
  call void @sort(i32 %add40, i32 %62)
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @check_overlap() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 4096
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i64*, i64** @objs_end, align 8
  %2 = load i32, i32* %i, align 4
  %sub = sub i32 %2, 1
  %idxprom = zext i32 %sub to i64
  %arrayidx = getelementptr inbounds i64, i64* %1, i64 %idxprom
  %3 = load i64, i64* %arrayidx, align 8
  %4 = load i64*, i64** @objs, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom1 = zext i32 %5 to i64
  %arrayidx2 = getelementptr inbounds i64, i64* %4, i64 %idxprom1
  %6 = load i64, i64* %arrayidx2, align 8
  %cmp3 = icmp ugt i64 %3, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind optnone
define dso_local void @enclave_main() #0 {
entry:
  %i = alloca i32, align 4
  %size = alloca i64, align 8
  %call = call noalias i8* @malloc(i64 32768) #4
  %0 = bitcast i8* %call to i64*
  store i64* %0, i64** @objs, align 8
  %call1 = call noalias i8* @malloc(i64 32768) #4
  %1 = bitcast i8* %call1 to i64*
  store i64* %1, i64** @objs_end, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %2, 4096
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %rem = urem i32 %3, 5
  %add = add i32 %rem, 5
  %conv = zext i32 %add to i64
  store i64 %conv, i64* %size, align 8
  %4 = load i64, i64* %size, align 8
  %call2 = call noalias i8* @malloc(i64 %4) #4
  %5 = ptrtoint i8* %call2 to i64
  %6 = load i64*, i64** @objs, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = zext i32 %7 to i64
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 %idxprom
  store i64 %5, i64* %arrayidx, align 8
  %8 = load i64*, i64** @objs, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom3 = zext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds i64, i64* %8, i64 %idxprom3
  %10 = load i64, i64* %arrayidx4, align 8
  %11 = load i64, i64* %size, align 8
  %add5 = add i64 %10, %11
  %12 = load i64*, i64** @objs_end, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom6 = zext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds i64, i64* %12, i64 %idxprom6
  store i64 %add5, i64* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @sort(i32 0, i32 4095)
  %call8 = call i32 @check_overlap()
  %tobool = icmp ne i32 %call8, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  %call9 = call i32 (i8*, ...) bitcast (i32 (...)* @puts to i32 (i8*, ...)*)(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %for.end
  %call10 = call i32 (i8*, ...) bitcast (i32 (...)* @puts to i32 (i8*, ...)*)(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc17, %if.end
  %15 = load i32, i32* %i, align 4
  %cmp12 = icmp ult i32 %15, 4096
  br i1 %cmp12, label %for.body14, label %for.end19

for.body14:                                       ; preds = %for.cond11
  %16 = load i64*, i64** @objs, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom15 = zext i32 %17 to i64
  %arrayidx16 = getelementptr inbounds i64, i64* %16, i64 %idxprom15
  %18 = load i64, i64* %arrayidx16, align 8
  %19 = inttoptr i64 %18 to i8*
  call void @free(i8* %19) #4
  br label %for.inc17

for.inc17:                                        ; preds = %for.body14
  %20 = load i32, i32* %i, align 4
  %inc18 = add i32 %20, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond11

for.end19:                                        ; preds = %for.cond11
  call void @exit(i32 0) #5
  unreachable
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

declare dso_local i32 @puts(...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"}
